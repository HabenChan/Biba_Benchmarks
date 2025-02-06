#include <cuda.h>
#include <cuda_runtime.h>
#include <stdio.h>
#include <stdlib.h>

#define BLOCK_SIZE 256

__global__ void memory_latency_kernel(float *data, int size) {
    __shared__ float shared_data[BLOCK_SIZE];
    
    // 将数据从全局内存加载到共享内存
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx < size) {
        shared_data[threadIdx.x] = data[idx];
    }
    
    // 同步线程块
    __syncthreads();
    
    // 从共享内存中读取数据
    if (idx < size) {
        data[idx] = shared_data[threadIdx.x];
    }
}

void measure_memory_latency(int block_size_kb) {
    int block_size = block_size_kb * 1024; // 将KB转换为字节
    float *h_data, *d_data;
    
    // 分配主机和设备内存
    h_data = (float *)malloc(block_size);
    cudaMalloc((void **)&d_data, block_size);
    
    // 初始化数据
    for (int i = 0; i < block_size / sizeof(float); ++i) {
        h_data[i] = (float)i;
    }
    
    // 复制数据到设备
    cudaMemcpy(d_data, h_data, block_size, cudaMemcpyHostToDevice);
    
    // 创建CUDA事件
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
    
    // 启动计时器
    cudaEventRecord(start);
    
    // 执行核函数
    int num_blocks = (block_size / sizeof(float) + BLOCK_SIZE - 1) / BLOCK_SIZE;
    memory_latency_kernel<<<num_blocks, BLOCK_SIZE>>>(d_data, block_size / sizeof(float));
    
    // 停止计时器
    cudaEventRecord(stop);
    cudaDeviceSynchronize();
    
    float elapsed_time = 0.0f;
    cudaEventElapsedTime(&elapsed_time, start, stop);
    
    // 输出结果
    printf("Block size: %d KB, Latency: %.6f ms\n", block_size_kb, elapsed_time);
    
    // 释放资源
    cudaEventDestroy(start);
    cudaEventDestroy(stop);
    free(h_data);
    cudaFree(d_data);
}

int main() {
    // 初始化CUDA环境
    cudaSetDevice(0); // 设置GPU设备
    
    printf("Measuring memory latency for different block sizes...\n");

    // warm up
    measure_memory_latency(1);
    printf("Warm up over, start bench...\n");
    
    // 测量不同块大小的延迟
    for (int block_size_kb = 1; block_size_kb <= 1048576; block_size_kb *= 2) {
        measure_memory_latency(block_size_kb);
    }
    
    return 0;
}

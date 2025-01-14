## Diffusers_Benchmark：使用Diffusers编写的AI绘画Benchmark
### 使用方法
#### 1 安装diffusers
N卡用户在安装好Python后，运行：`pip install diffusers["torch"] transformers`
  
A卡相对复杂一些，参考：https://zhuanlan.zhihu.com/p/11572902441

安装完成后在对应Python环境的Prompt里用`python3 -c 'import torch; print(torch.cuda.is_available())'`验证安装，出现True则安装成功

#### 2 安装Juptyer Notebook

运行`pip install notebook`，安装完成之后输入`jupyter-notebook`打开Jupyter Notebook的网页

#### 3 下载模型

项目默认用的模型是`stablediffusionapi/anything-v5`和`stabilityai/stable-diffusion-x4-upscaler`的本地模型

如果你没有本地模型，那么把代码中的`./anything-v5`改成`stablediffusionapi/anything-v5`和`./stable-diffusion-x4-upscaler`改成`stabilityai/stable-diffusion-x4-upscaler`即可

注意本地模型要是diffusers的文件格式，不然读不了，模型可以是safetensors也可以是bin

如果使用bin文件，会报警告找不到safetensors，但一样可以加载

#### 4 运行Diffusers_Benchmark

在Jupyter Notebook的网页中打开本项目里的Diffusers_Benchmark.ipynb，依次运行（选中代码框，Shift+Enter）即可

进度条最后的it/s就是运行速度

## ollama_test：基于OLLAMA的LLM推理Benchmark
### 使用方法
#### 1 安装OLLAMA
在这里下载安装即可：https://ollama.com/

#### 2 启动OLLAMA
Windows用户直接运行OLLAMA，任务栏有图标就可以了

#### 3 双击ollama_test.bat
直接双击运行就可以运行Benchmark了，会自动下载qwen2.5的14b、7b和3b模型，输出三个AI生成的txt和相应的时间（秒）

统计一下生成了多少tokens，除以相应的秒数，就可以得到一秒生成多少tokens了

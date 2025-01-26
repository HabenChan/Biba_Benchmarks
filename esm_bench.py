import time
from transformers import pipeline

pipe = pipeline("fill-mask", model="./esm2_t36_3B_UR50D") #如果你没有本地模型，那么model="facebook/esm2_t36_3B_UR50D"

esm_test_input = []
for i in range(100):
    esm_test_input.append('MQIFVKTLTGKTITLEVEPS<mask>TIENVKAKIQDKEGIPPDQQRLIFAGKQLEDGRTLSDYNIQKESTLHLVLRLRGG')
    
start = time.time()
pipe(esm_test_input)
end = time.time()

print(end - start)
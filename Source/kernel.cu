#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <iostream>
#include <fstream>

#include "CNNModel.h";
#include "GPULoader.h";
#include "MnistLoader.h";

int main() {   
   
    DeepLearn::MnistLoader datas;
    datas.LoadMnistFile("LearnData\\train-images.idx3-ubyte");

    DeepLearn::GPULoader gpu;
    gpu.GPULoad();

    clock_t startTime = clock();

    clock_t endTime = clock();
    
    std::cout << "모델 학습 시간 : " << endTime - startTime << std::endl;

    while (true) { // 모델 테스트
        
    }

    return 0;
}
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <iostream>
#include <fstream>
#include <ctime>

// CUDA 에러 체크 함수: 에러 발생 시 메시지를 출력하고 종료합니다.
void checkCudaError(cudaError_t err, const char* msg) {
    if (err != cudaSuccess) {
        std::cerr << "CUDA Error: " << msg << " - " << cudaGetErrorString(err) << std::endl;
        exit(EXIT_FAILURE);
    }
}

int main() {   
    // Cuda 초기화
    int deviceCount;
    cudaError_t err = cudaGetDeviceCount(&deviceCount);
    checkCudaError(err, "디바이스 카운트 확인 실패");

    if (deviceCount == 0) {
        std::cout << "사용 가능한 GPU가 없습니다." << std::endl;
        return 1;
    }

    // 현재 사용중인 디바이스 정보 출력
    cudaDeviceProp deviceProp;
    cudaGetDeviceProperties(&deviceProp, 0);
    std::cout << "사용 중인 디바이스: " << deviceProp.name << std::endl;

    clock_t startTime = clock();



    // GPU 작업 완료 대기 및 에러 체크
    err = cudaDeviceSynchronize();
    checkCudaError(err, "커널 실행 중 에러 발생");

    clock_t endTime = clock();
    
    std::cout << "모델 학습 시간 : " << endTime - startTime << std::endl;

    while (true) { // 모델 테스트
        
    }

    return 0;
}
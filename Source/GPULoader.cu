#include "GPULoader.h"
#include <iostream>

namespace DeepLearn {
	bool GPULoader::checkCudaError(cudaError_t err, const char* msg) {
		if (err != cudaSuccess) {
			std::cerr << "CUDA Error: " << msg << " - " << cudaGetErrorString(err) << std::endl;
			return false;
		}
		return true;
	}

    GPULoader::GPULoader() {}
    
    bool GPULoader::GPULoad() {
        int deviceCount;
        err = cudaGetDeviceCount(&deviceCount);
        if(checkCudaError(err, "디바이스 카운트 확인 실패"));

        if (deviceCount == 0) {
            std::cout << "사용 가능한 GPU가 없습니다." << std::endl;
            return false;
        }
    }

    void GPULoader::PrintDeviceInfo(){
        cudaGetDeviceProperties(&deviceProp, 0);
        std::cout << "사용 중인 디바이스: " << deviceProp.name << std::endl;
        
    }
}

   
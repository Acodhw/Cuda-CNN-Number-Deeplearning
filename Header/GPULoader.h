#pragma once

#include "cuda_runtime.h"
#include "device_launch_parameters.h"

namespace DeepLearn {
	class GPULoader
	{
	private:
		cudaError_t err;
		cudaDeviceProp deviceProp;

		bool checkCudaError(cudaError_t err, const char* msg);
	public:
		GPULoader();
		bool GPULoad();
		void PrintDeviceInfo();
	};
}


#pragma once

#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <iostream>
#include <fstream>

namespace DeepLearn {
	class MnistLoader
	{
	private:
		// 헤더 정보를 담을 변수 선언 (4바이트 정수들)
		uint32_t magic_number;
		uint32_t number_of_images;
		uint32_t rows;
		uint32_t cols;
	
		std::ifstream file;
	public:
		MnistLoader();
		uint32_t swapEndian(uint32_t val);
		bool LoadMnistFile(const char* path);
		
	};
}


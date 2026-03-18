#include "MnistLoader.h"

namespace DeepLearn {

	MnistLoader::MnistLoader() :
		magic_number(0),
		number_of_images(0),
		rows(0),
		cols(0),
		file()
	{}

	uint32_t MnistLoader::swapEndian(uint32_t val) {
		return (val << 24) | ((val << 8) & 0x00FF0000) | ((val >> 8) & 0x0000FF00) | (val >> 24);
	}
	bool MnistLoader::LoadMnistFile(const char* path) {
		// 파일 열기
		file.open("path", std::ios::binary);

		if (!file.is_open())
		{
			std::cout << "파일을 읽지 못했습니다." << std::endl;
			return false;
		}

		// 파일에서 4바이트씩 읽기 (read 함수 사용)
		file.read(reinterpret_cast<char*>(&magic_number), 4);
		magic_number = swapEndian(magic_number);

		file.read(reinterpret_cast<char*>(&number_of_images), 4);
		number_of_images = swapEndian(number_of_images);

		file.read(reinterpret_cast<char*>(&rows), 4);
		rows = swapEndian(rows);

		file.read(reinterpret_cast<char*>(&cols), 4);
		cols = swapEndian(cols);

		// 실제 이미지 데이터 읽기
		// 이미지 1개 크기 = rows * cols (28 * 28 = 784 바이트)
		// 전체 크기 = number_of_images * 784
		int image_size = rows * cols;
		int total_size = number_of_images * image_size;

		unsigned char* _pixels = new unsigned char[total_size];
		file.read(reinterpret_cast<char*>(_pixels), total_size);

		std::cout << "학습 데이터 정보 \n이미지 1개 크기 : " << image_size << ", 파일 총 사이즈 : " << total_size << std::endl;

		return true;
	}
}


	
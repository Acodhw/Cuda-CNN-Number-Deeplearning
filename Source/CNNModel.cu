#include "CNNModel.h"

namespace CNN {
	class MnistLoader
	{
		uint32_t swapEndian(uint32_t val) {
			return (val << 24) | ((val << 8) & 0x00FF0000) | ((val >> 8) & 0x0000FF00) | (val >> 24);
		}
	};
}


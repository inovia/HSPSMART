#pragma once

#ifdef _WIN64
#define DLLAPI extern "C"
#else
#define DLLAPI extern "C" __declspec(dllexport)
#endif

#include "hspsmart_exports.h"
#include "hspsmart_defines.h"

// DLLÇÃÉrÉbÉgêî
#ifndef HSPSMART64
#define HSPSMART_BITS 32
#else
#define HSPSMART_BITS 64
#endif
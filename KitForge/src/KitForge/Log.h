#pragma once

#include<memory>

#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/fmt/ostr.h"
#include "spdlog/sinks/stdout_color_sinks.h"

namespace KitForge {

	class KITFORGE_API Log {
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }
	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};

}

// Core Log Macros
#define KITFORGE_CORE_TRACE(...)	::KitForge::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define KITFORGE_CORE_INFO(...)		::KitForge::Log::GetCoreLogger()->info(__VA_ARGS__)
#define KITFORGE_CORE_WARN(...)		::KitForge::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define KITFORGE_CORE_ERROR(...)	::KitForge::Log::GetCoreLogger()->error(__VA_ARGS__)
#define KITFORGE_CORE_FATAL(...)	::KitForge::Log::GetCoreLogger()->fatal(__VA_ARGS__)

// Client Log Macros
#define KITFORGE_TRACE(...)		::KitForge::Log::GetClientLogger()->trace(__VA_ARGS__)
#define KITFORGE_INFO(...)		::KitForge::Log::GetClientLogger()->info(__VA_ARGS__)
#define KITFORGE_WARN(...)		::KitForge::Log::GetClientLogger()->warn(__VA_ARGS__)
#define KITFORGE_ERROR(...)		::KitForge::Log::GetClientLogger()->error(__VA_ARGS__)
#define KITFORGE_FATAL(...)		::KitForge::Log::GetClientLogger()->fatal(__VA_ARGS__)
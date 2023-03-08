#pragma once

#ifdef KITFORGE_PLATFORM_WINDOWS

extern KitForge::Application* KitForge::CreateApplication();

int main(int argc, char** argv) {
	KitForge::Log::Init();
	KITFORGE_CORE_WARN("Initialized Log!");
	int a = 5;
	KITFORGE_INFO("Hello! Var={0}", a);

	printf("KitForge Engine");
	auto app = KitForge::CreateApplication();
	app->Run();
	delete app;
}

#endif

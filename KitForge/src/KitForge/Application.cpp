#include "Application.h"

#include "KitForge/Events/ApplicationEvent.h"
#include "KitForge/Log.h"

namespace KitForge {

	Application::Application() {}

	Application::~Application() {}

	void Application::Run() {
		WindowResizeEvent e(1280, 720);
		if (e.IsInCategory(EventCategoryApplication)) {
			KITFORGE_TRACE(e);
		}
		if (e.IsInCategory(EventCategoryInput)) {
			KITFORGE_TRACE(e);
		}
		while (true);
	}

}
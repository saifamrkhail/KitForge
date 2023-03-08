#include <KitForge.h>

class Sandbox : public KitForge::Application {
public:
	Sandbox() {}
	~Sandbox() {}
};

KitForge::Application* KitForge::CreateApplication() {
	return new Sandbox();
}

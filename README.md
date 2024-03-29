# KitForge

## Exercise 1 – Questions

### What is the difference between git and github?
Git is a version control system, whereas Github is a cloud-based hosting service that lets you manage (remote) repositories.

### Name 3 benefits of a version control system:
- Keep track of every change done to the code and revert if necessary
- Reduce code duplication and errors due to outdated code
- Facilitate simultaneous collaboration with other developers through branching and merging

### Name 3 alternatives to git:
- Subversion
- Mercurial
- Perfoce Helix Core

### Name 2 differences between git and other version control systems:
- While SVN is centralized, Git is a distributed version control system, i.e., each git installation can act as server and client. Each user also has a local copy of the repository with its full history.
- While SVN branches are based on a directory structure (a branch is created as directory), Git branches only reference specific commits

### Name known issues related to game engines (Unreal, Unity) and version control systems:
Binary files like images, videos, models or any other asset may together take up a lot of disk space and slow down operations like the cloning of a repository. Furthermore they can't be merged, which makes collaboration on an asset difficult.

## Exercise 2 - Questions

### Describe a logging system with your own words:
A logging system serves the purpose of providing the developer with a simplified way to output all kinds of information in the output console in a standardized way. The logged messages can be categorized as warnings, information, etc. and are used for troubleshooting and monitoring of the application.

### What is the difference between git submodules and git subtrees?
Submodules are a link to a commit of an other repository (good when you depend on a fixed version),
Subtrees copy the whole repository including the commit history. (Useful for component based development)

### What is a build system in C++? Name 3 build systems:
With a build system, the developer can specify configurations and build details (include directories, links, etc) in a build file that can then be executed to build the project. Build systems provide useful functions for system insights as well as other command line commands such as the copy command.
Examples: make, cmake, premake, ninja, nmake

### What is a package manager in C++? Name 3 package managers:
A package manager automates the installation of third party libraries and optionally handles the interaction with the build system.
Examples: conan, vcpkg, hunter

## Exercise 3 - Questions

### What is the difference between a dynamic linked library and a static library?
Static libraries are loaded to the program at compile time, i.e., the resulting executable contains its own copy of the library code. Dynamic libraries are usually shared by multiple programs and loaded at runtime.

### Describe an event system with your own words:
An event system provides the developer with a uniform way to handle (capture, enqueue, process) emerging events such as mouse/key input, window resizing, etc. within a game engine.

### What is a Design Pattern?
A reusable solution to a common occuring problem.

### Name and describe 2 Design Patterns (except façade or adapter):
- State: Behavioural design pattern which allows for objects to have multiple states and change their behaviour according to the state they are in.
- Memento: Design pattern that enables the storage and later restoring of the internal state of an object.

## Exercise 4 - Questions

### What is a precompiled header? Name pros and cons:
In a precompiled header usually commonly used header files are grouped together and precompiled into a binary format. The advantage is faster compilation time and fewer include statements in the source code. Disadvantages are that PCHs can easily become bloated, the entire PCH must be recompiled when a change occurs in an included header file, additional maintenance overhead, and that the compiler must support precompiled headers.

### Describe the layer of abstraction with your own words:
The abstraction layer (Window.h) allows us to program the rest of our application without worrying about the details of the concrete implementation of the window class. In Window.h we can make the decision about which concrete class (for which platform) we will use, which in turn is responsible for the concrete implementation of the window functionality.

### Name the SOLID principles and describe them briefly:
- The **S** ingle-responsibility principle: Every class should have only one responsibility.
- The **O** pen–closed principle: Software entities should be open for extension, but closed for modification.
- The **L** iskov substitution principle: An object of a derived class must be able to be used as an object of the base class without breaking the program.
- The **I** nterface segregation principle: Clients should not be forced to depend upon interfaces that they do not use.
- The **D** ependency inversion principle: Depend upon abstractions (interfaces), not on concrete implementation.

LAbstractParser
===============

iOS Abstract Parser

You may use the LAbstractParser class in your project, or you may follow the steps below to clone the repo and use it as static library in your project.

Integrating into your project as static library
-----------------------------------------------

1. Clone the LAbstractParser git repository
2. drag LAbstractParser.xcodeproj to your project, make sure "Copy items" is unchecked
3. in your target's Build Phases, under Link Binary With Libraries, click on the (+) and add the libLAbstractParser.a library
4. add -ObjC and -all_load to Other Linker Flags in your target's build settings

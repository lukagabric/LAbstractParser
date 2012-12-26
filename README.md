LAbstractParser
===============

iOS Abstract Parser

You may use the LAbstractParser class files in your project, or you may follow the steps below to clone the repo and use it as static library in your project. Check SampleParser for implementation example.

Integrating into your project as static library
-----------------------------------------------

1. Clone the LAbstractParser git repository
2. drag LAbstractParser.xcodeproj to your project, make sure "Copy items" is unchecked
3. in your target's Build Phases, under Link Binary With Libraries, click on the (+) and add the libLAbstractParser.a library
4. add -ObjC and -all_load to Other Linker Flags in your target's build settings

Implementation example
----------------------

1. subclass LAbstractParser
2. implement didStartElement and didEndElement methods


    - (void)didStartElement
    {
        ifElement(@"item")
        {
           _item = [SampleItem new];
           _item.identifier = [_attributesDict objectForKey:@"id"];
           _item.name = [_attributesDict objectForKey:@"name"];
        }
    }


- parsed values (including CDATA blocks) are stored in _elementValue member
- you may bind data as in SampleParser:

 

3. use itemsArray property to get the items

SampleViewController implementation:

    SampleParser *parser = [SampleParser new];
    [parser parseData:[NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"sample" withExtension:@"xml"]]];

- get items using the itemsArray property.

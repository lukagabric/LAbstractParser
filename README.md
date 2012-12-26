LAbstractParser
===============

iOS Abstract Parser

You may use the LAbstractParser class files in your project, or you may follow the steps below to clone the repo and use it as static library in your project. Check SampleParser for implementation example.

Integrating into your project as static library
-----------------------------------------------

1. Clone the LAbstractParser git repository
2. drag LAbstractParser.xcodeproj to your project, make sure "Copy items" is unchecked
3. in your target's Build Phases, under Link Binary With Libraries, click on the (+) and add the libLAbstractParser.a library
4. add the relative path to the LAbstractParser header in your "User Header Search Path" Build Setting
5. add -ObjC and -all_load to Other Linker Flags in your target's build settings

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
    
    - (void)didEndElement
    {
        ifElement(@"item") [_items addObject:_item];
        elifElement(@"value") bind(_item.value);
        elifElement(@"cdataValue") bind(_item.cDataValue);
        elifElement(@"intValue") bindInt(_item.intValue);
        elifElement(@"floatValue") bindFloat(_item.floatValue);
        elifElement(@"number") bindNo(_item.number);
    }

3. parsing

    SampleParser *parser = [SampleParser new];
    [parser parseData:[NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"sample" withExtension:@"xml"]]];

4. get items using the itemsArray property

Note:
* parsed values (including CDATA blocks) are stored in _elementValue member, check also _attributesDict and _elementName members
* you may bind data as in SampleParser (check the definitions in LAbstractParser.h):

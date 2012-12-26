#import "SampleParser.h"
#import "SampleItem.h"


@implementation SampleParser
{
    SampleItem *_item;
}


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


@end
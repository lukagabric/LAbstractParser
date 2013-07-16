#import "LParserInterface.h"


#define ifElement(str)    if ([_elementName isEqualToString:str])
#define elifElement(str)  else if ([_elementName isEqualToString:str])
#define bindStr(obj)      obj = _elementValue
#define bindNo(obj)       obj = [NSNumber numberWithDouble:[_elementValue doubleValue]]
#define bindDate(obj)     obj = [_dateFormatter dateFromString:_elementValue]
#define bindDateTime(obj) obj = [_dateTimeFormatter dateFromString:_elementValue]
#define bindNoInt(obj)    obj = [NSNumber numberWithInteger:[_elementValue integerValue]]
#define bindInt(obj)      obj = [_elementValue intValue]
#define bindFloat(obj)    obj = [_elementValue floatValue]


@interface LAbstractParser : NSObject <NSXMLParserDelegate, LParserInterface>
{
	NSDictionary *_attributesDict;
	NSString *_elementValue;
	NSString *_elementName;
	NSMutableArray *_items;
	NSXMLParser *_parser;
    NSDateFormatter *_dateTimeFormatter;
    NSDateFormatter *_dateFormatter;
    NSError *_error;
}


@end


#pragma mark - Protected


@interface LAbstractParser ()


- (void)initialize;

- (void)didStartElement;
- (void)didEndElement;

- (NSString *)dateTimeFormat;
- (NSString *)dateFormat;


@end
#import "LParserInterface.h"


#define ifElement(str) if ([_elementName isEqualToString:str])
#define elifElement(str) else if ([_elementName isEqualToString:str])
#define bindStr(obj) obj = _elementValue
#define bindNo(obj) obj = [NSNumber numberWithDouble:[_elementValue doubleValue]]
#define bindNoInt(obj) obj = [NSNumber numberWithInteger:[_elementValue integerValue]]
#define bindInt(obj) obj = [_elementValue intValue]
#define bindFloat(obj) obj = [_elementValue floatValue]


@interface LAbstractParser : NSObject <NSXMLParserDelegate, LParserInterface>
{
    NSDictionary *_attributesDict;
	NSString *_elementValue;
	NSString *_elementName;
    NSMutableArray *_items;
}


@property (readonly, nonatomic) NSError *error;
@property (readonly, nonatomic) NSArray *itemsArray;


- (void)parseData:(NSData *)data;


@end


#pragma mark - Protected


@interface LAbstractParser ()


- (void)didStartElement;
- (void)didEndElement;


@end
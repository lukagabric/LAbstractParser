//
//  Created by Luka Gabrić.
//  Copyright (c) 2013 Luka Gabrić. All rights reserved.
//


#import "LParserInterface.h"


#define ifElement(str)    if ([_elementName isEqualToString:str])
#define elifElement(str)  else if ([_elementName isEqualToString:str])
#define bindStr(obj)      obj = _elementValue
#define bindNo(obj)       obj = [NSNumber numberWithDouble:[_elementValue doubleValue]]
#define bindDate(obj)     obj = [_dateFormatter dateFromString:_elementValue]
#define bindDateTime(obj) obj = [_dateTimeFormatter dateFromString:_elementValue]
#define bindNoInt(obj)    obj = [NSNumber numberWithInteger:[_elementValue integerValue]]
#define bindNoBool(obj)   obj = [NSNumber numberWithBool:[_elementValue boolValue]]
#define bindInt(obj)      obj = [_elementValue intValue]
#define bindFloat(obj)    obj = [_elementValue floatValue]
#define bindDouble(obj)   obj = [_elementValue doubleValue]


@interface LAbstractParser : NSObject <NSXMLParserDelegate, LParserInterface>
{
    NSDictionary *_attributesDict;
	NSString *_elementValue;
	NSString *_elementName;
	NSXMLParser *_parser;
	NSMutableArray *_items;
    NSError *_error;
    NSDateFormatter *_dateTimeFormatter;
    NSDateFormatter *_dateFormatter;
    
    id _userInfo;
}


@end


#pragma mark - Protected


@interface LAbstractParser ()


- (void)initialize;

- (void)didStartElement;
- (void)didEndElement;

- (NSString *)getDateTimeFormat;
- (NSString *)getDateFormat;


@end
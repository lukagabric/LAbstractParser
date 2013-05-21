#import "LAbstractParser.h"


@implementation LAbstractParser
{
    NSMutableString *_mElementValue;
}


#pragma mark - Parse data


- (void)parseData:(NSData *)data
{
    NSXMLParser *parser = nil;
	
    if (data)
    {
		parser = [[NSXMLParser alloc] initWithData:data];

        _items = [NSMutableArray new];
        
        [parser setDelegate:self];
        
        [parser setShouldProcessNamespaces:NO];
        [parser setShouldReportNamespacePrefixes:NO];
        [parser setShouldResolveExternalEntities:NO];
        
        [parser parse];

    }
    else
    {
        _error = [NSError errorWithDomain:@"No data" code:0 userInfo:nil];
    }
}


#pragma mark - NSXMLParserDelegate


- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	if (string != nil)
	{
		[_mElementValue appendString:string];
	}
	else
	{
		_error = [NSError errorWithDomain:@"Parsing error! Appending nil value." code:-1 userInfo:nil];
		NSLog(@"Parsing error! Appending nil value.");
		[parser abortParsing];
	}
}


- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    _error = parseError;
	NSLog(@"%@", [NSString stringWithFormat:@"Parsing error code %i, %@, at line: %i, column: %i", [parseError code], [[parser parserError] localizedDescription], [parser lineNumber], [parser columnNumber]]);
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    _mElementValue = [[NSMutableString alloc] init];
    _elementValue = nil;
	_elementName = [NSString stringWithString:elementName];
    _attributesDict = attributeDict;
    
    [self didStartElement];
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    _elementName = [NSString stringWithString:elementName];
    _elementValue = [[NSString stringWithString:_mElementValue] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    [self didEndElement];
}


- (void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock
{
    _mElementValue = [[NSMutableString alloc] initWithData:CDATABlock encoding:NSUTF8StringEncoding];
}


#pragma mark - Methods to override in subclass


- (void)didStartElement
{
    
}


- (void)didEndElement
{
    
}


#pragma mark - itemsArray getter


- (NSArray *)itemsArray
{
    return [NSArray arrayWithArray:_items];
}


#pragma mark -


@end
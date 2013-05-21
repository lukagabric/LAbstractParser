@protocol LParserInterface <NSObject>


- (void)parseData:(NSData *)data;
- (NSError *)error;
- (NSArray *)itemsArray;


@end
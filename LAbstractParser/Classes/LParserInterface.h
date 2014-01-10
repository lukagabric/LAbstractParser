@protocol LParserInterface <NSObject>


- (void)parseData:(NSData *)data;
- (void)setUserInfo:(id)userInfo;
- (NSError *)getError;
- (NSArray *)getItemsArray;
- (void)abortParsing;


@end
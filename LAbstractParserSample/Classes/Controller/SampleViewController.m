#import "SampleViewController.h"
#import "SampleParser.h"
#import "SampleItem.h"


@implementation SampleViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    SampleParser *parser = [SampleParser new];
    [parser parseData:[NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"sample" withExtension:@"xml"]]];
    
    for (SampleItem *item in parser.itemsArray)
    {
        NSLog(@"%@", item);
    }
}


@end
#import "SampleItem.h"


@implementation SampleItem


- (NSString *)description
{
    return [NSString stringWithFormat:@"\nIdentifier:%@\nName:%@\nValue:%@\ncDataValue:%@\nIntValue:%d\nFloatValue:%f\nNumber:%@", _identifier, _name, _value, _cDataValue, _intValue, _floatValue, _number];
}


@end
#import "AppDelegate.h"
#import "SampleViewController.h"


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [SampleViewController new];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
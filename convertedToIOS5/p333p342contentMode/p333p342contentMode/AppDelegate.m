

#import "AppDelegate.h"
#import "MyView.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    MyView* mv = [[MyView alloc] 
                  initWithFrame: CGRectMake(0, 0, self.window.bounds.size.width - 50, 150)];
    mv.center = self.window.center;
    [self.window addSubview: mv];
    mv.opaque = NO;
    mv.tag = 111; // so I can get a reference to this view later

    [self performSelector:@selector(resize:) withObject:nil afterDelay:0.1];

    
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void) resize: (id) dummy {
    UIView* mv = [self.window viewWithTag:111];
    CGRect f = mv.bounds;
    f.size.height *= 2;
    mv.bounds = f;
}


@end
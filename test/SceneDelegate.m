#import "SceneDelegate.h"
#import "ViewController.h"
#import "VideoVc.h"
#import "PYViewController.h"
#import "meVc.h"

@interface SceneDelegate ()<UITabBarControllerDelegate>

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    UIWindowScene* winSce = (UIWindowScene*)scene;
    self.window = [[UIWindow alloc]initWithWindowScene:(UIWindowScene *)scene];
    self.window.frame = winSce.coordinateSpace.bounds;
    
  
    
    UITabBarController * vc = [[UITabBarController alloc]init];
    vc.view.backgroundColor = [UIColor whiteColor];
    
    
//tabBar
    ViewController* v1 = [[ViewController alloc]init];
    v1.view.backgroundColor = [UIColor whiteColor];
    v1.tabBarItem.title = @"新闻";
    v1.tabBarItem.image = [UIImage imageNamed:@"search"];
    
    VideoVc* v2 = [[VideoVc alloc]init];

    
    PYViewController* v3 = [[PYViewController alloc]init];

    
    meVc* v4 = [[meVc alloc]init];

    
    
    [vc setViewControllers:@[v1,v2,v3,v4]];
    vc.delegate = self;
    
    UINavigationController* nav = [[UINavigationController alloc]initWithRootViewController:vc];
    
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];

}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"ssssss");
}

- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end

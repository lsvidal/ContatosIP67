//
//  CMPAppDelegate.m
//  ContatosIP67
//
//  Created by ios3109 on 04/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CMPAppDelegate.h"
#import "CMPFormularioContatoViewControllerViewController.h"
#import "ListaContatosViewController.h"
@implementation CMPAppDelegate

@synthesize window = _window;
@synthesize contatos, arquivoContatos;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    NSArray *userDirs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDir = [userDirs objectAtIndex:0];
    self.arquivoContatos = [NSString stringWithFormat:@"%@/ArquivoContatos", documentDir];
    
    // Override point for customization after application launch.
    self.contatos = [NSKeyedUnarchiver unarchiveObjectWithFile:self.arquivoContatos];
    if(!self.contatos) {
        self.contatos = [[NSMutableArray alloc] init];
    }
    //CMPFormularioContatoViewControllerViewController *formulario = [[CMPFormularioContatoViewControllerViewController alloc] init];
    //self.window.rootViewController = formulario;
    ListaContatosViewController *lista = [[ListaContatosViewController alloc] init];
    lista.contatos = self.contatos;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:lista];
    self.window.rootViewController = nav;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [NSKeyedArchiver archiveRootObject:self.contatos toFile:self.arquivoContatos];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

//
//  ViewController.m
//  打印所有APP信息
//
//  Created by Bai on 2017/10/19.
//  Copyright © 2017年 e聚科技. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>  

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)log:(id)sender {
    Class lsawsc = objc_getClass("LSApplicationWorkspace");
    
    NSObject* workspace = [lsawsc performSelector:NSSelectorFromString(@"defaultWorkspace")];
    NSArray *Arr = [workspace performSelector:NSSelectorFromString(@"allInstalledApplications")];
    Class LSApplicationProxy_class = object_getClass(@"LSApplicationProxy");
    for (LSApplicationProxy_class in Arr)
    {
        NSString *bundleID = [LSApplicationProxy_class performSelector:@selector(applicationIdentifier)];
        NSLog(@"%@",bundleID);
    }
}

- (IBAction)open:(id)sender {
    Class lsawsc = objc_getClass("LSApplicationWorkspace");
    NSObject* workspace = [lsawsc performSelector:NSSelectorFromString(@"defaultWorkspace")];
    // iOS6 没有defaultWorkspace
    if ([workspace respondsToSelector:NSSelectorFromString(@"openApplicationWithBundleID:")])
    {
        [workspace performSelector:NSSelectorFromString(@"openApplicationWithBundleID:") withObject:@"com.yiju.huaxin"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

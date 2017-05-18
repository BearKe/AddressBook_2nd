//
//  KCContactViewController.m
//  AddressBook_e
//
//  Created by KeX on 2017/4/22.
//  Copyright © 2017年 KeX. All rights reserved.
//

#import "KCContactViewController.h"

@interface KCContactViewController ()

@end

@implementation KCContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    self.tabBarItem.title=@"Search";
    self.tabBarItem.image=[UIImage imageNamed:@"search.png"];
    self.tabBarItem.selectedImage=[UIImage imageNamed:@"search.png"];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  KCAddDataViewController.m
//  AddressBook_e
//
//  Created by KeX on 2017/4/22.
//  Copyright © 2017年 KeX. All rights reserved.
//
#import "KCAddDataViewController.h"

@interface KCAddDataViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) NSMutableArray *Array;

@property (strong, nonatomic) UITableView* tableView;

@end

@implementation KCAddDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tabBarItem.title=@"Add";
    self.tabBarItem.image=[UIImage imageNamed:@"add"];
    self.tabBarItem.selectedImage=[UIImage imageNamed:@"add"];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

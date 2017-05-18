//
//  KCWebChatViewController.m
//  AddressBook_e
//
//  Created by KeX on 2017/4/22.
//  Copyright © 2017年 KeX. All rights reserved.
//

#import "KCWebChatViewController.h"

@interface KCWebChatViewController ()  <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *Array;

@property (nonatomic,assign) NSInteger indexPath;

@property (strong, nonatomic) UITableView* tableView;

@end
  
@implementation KCWebChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=[UIColor whiteColor];
    
    //设置视图控制器标题
    self.title=@"Homepage";
    
    //注意通过tabBarController或者parentViewController可以得到其俯视图控制器（也就是KCTabBarViewController）
    NSLog(@"%i",self.tabBarController==self.parentViewController);//对于当前应用二者相等
    
    
    //设置图标、标题(tabBarItem是显示在tabBar上的标签)
    self.tabBarItem.title=@"Homepage";//注意如果这个标题不设置默认在页签上显示视图控制器标题
    self.tabBarItem.image=[UIImage imageNamed:@"chat"];//默认图片----!!!（图片显示问题 待解决）
    self.tabBarItem.selectedImage=[UIImage imageNamed:@"chat"];//选中图片
    
    //图标右上角内容 (小红点 点不掉看了很不爽 )
    //self.tabBarItem.badgeValue=@"2";
    
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    // Do any additional setup after loading the view, typically from a nib.
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"Array"])
    {
        NSMutableArray *A_array = [[NSMutableArray alloc] initWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"Array"]];
        
        self.Array = A_array;
    }
    else{
        self.Array = [[NSMutableArray alloc] init];
        
        for (int i = 1; i<30; i++) {
            NSString *str = [NSString stringWithFormat:@"%d",i];
            [self.Array addObject:str];
        }
        
        [[NSUserDefaults standardUserDefaults] setObject:self.Array forKey:@"Array"];
        
    }
    
    //   [self setNavTitle];
    
    //   [self setNavBtn];
    
    [self.view addSubview:self.tableView];
    
    [self.tableView reloadData];
    
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 56)];
    // UIButton * tempButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    
    UINavigationItem * navTitle = [[UINavigationItem alloc] init];
    navTitle.title = @"Title";
    
    //[tempButton addTarget:self action:@selector(infoButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    // UIBarButtonItem * infoButton = [[UIBarButtonItem alloc] initWithCustomView:tempB4utton];
    //-----
    UIBarButtonItem *rBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)];
    self.navigationItem.rightBarButtonItem = rBtn;
    
    //In this case your button will be on the right side
    navTitle.rightBarButtonItem = rBtn;
    
    //Add NavigationBar on main view
    navBar.items = @[navTitle];
    [self.view addSubview:navBar];
    
}


- (void)add{
    [self.Array insertObject:@"add" atIndex:1];
    [[NSUserDefaults standardUserDefaults] setObject:self.Array forKey:@"Array"];
    [self.tableView reloadData];
}


- (UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _Array.count + 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"ShowUserInfoCell";
    UITableViewCell * cell = [_tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        // Create a cell to display an ingredient.
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell.
    cell.textLabel.text= self.Array[indexPath.row];
    //[NSString stringWithFormat:@"section:%ld row:%ld",(long)indexPath.section, (long)indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Title" message:@"AddressBook Title" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    
    [alertController addAction:okAction];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

#pragma mark -- cell左滑退出

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    [tableView setEditing:YES animated:YES];
    return UITableViewCellEditingStyleDelete;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定删除？" preferredStyle:UIAlertControllerStyleAlert];
        //        [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            [_Array removeObjectAtIndex:indexPath.row];
            
            [[NSUserDefaults standardUserDefaults] setObject:self.Array forKey:@"Array"];
            
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        }]];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
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

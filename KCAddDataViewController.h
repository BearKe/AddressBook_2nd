//
//  KCAddDataViewController.h
//  AddressBook_e
//
//  Created by KeX on 2017/4/23.
//  Copyright © 2017年 KeX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KCAddDataViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *Name;
@property (weak, nonatomic) IBOutlet UILabel *Telephone;
@property (weak, nonatomic) IBOutlet UIView *NameEnter;
@property (weak, nonatomic) IBOutlet UIView *TelephoneEnter;

@end

//
//  RegisterViewController.h
//  OC_Exec3
//
//  Created by simao on 15/10/18.
//  Copyright © 2015年 simao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *id;
- (IBAction)add:(UIButton *)sender;

@end

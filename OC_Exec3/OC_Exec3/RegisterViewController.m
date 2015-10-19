//
//  RegisterViewController.m
//  OC_Exec3
//
//  Created by simao on 15/10/18.
//  Copyright © 2015年 simao. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)add:(UIButton *)sender {
  
    NSString *nameText = self.name.text;
    NSString *idText = self.id.text;
    NSString *URL_TEST = @"http://192.168.1.47:8080/postreq_jsonresp.php";
    NSString *queryString = [NSString stringWithFormat:@"name=%@&id=%@",nameText, idText];
    
    NSData *formdata = [queryString dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL_TEST]];
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setHTTPBody:formdata];
    //[urlRequest setValue:@"application/json" forKey:@"accept"];
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"%@", json);
    }];
    
    
}
@end

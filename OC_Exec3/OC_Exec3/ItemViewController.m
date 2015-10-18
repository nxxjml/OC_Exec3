//
//  ItemViewController.m
//  OC_Exec3
//
//  Created by simao on 15/10/11.
//  Copyright © 2015年 simao. All rights reserved.
//

#import "ItemViewController.h"
//#import "ViewController.h"

@interface ItemViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // ViewController *vC;
   // [self doHttpGetParserJsonResp];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell"];
    cell.textLabel.text = @"Item1";
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"detail" sender:indexPath];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *destVc = segue.destinationViewController;
    NSDictionary *dict = [self doHttpGetParserJsonResp];
    //destVc.navigationItem.title = @"table view detail";
    NSLog(@"%@",dict[@"final"][@"in"]);
    destVc.navigationItem.title = dict[@"final"][@"in"];
    //NSLog(@"adf");
    //NSLog(@"%@", response);
    
    
}


//- (NSDictionary *)doHttpGetParserJsonResp:(NSDictionary *) resData {
- (NSDictionary *) doHttpGetParserJsonResp {
    NSString *URL_TEST = @"http://192.168.1.47:8080/index.php?name=json_test";
    // NSString *text1 = @"";
    //NSString *text = [text1 stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSString *url = URL_TEST;
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    urlRequest.HTTPMethod = @"GET";
    NSError *error = nil;
    [urlRequest setValue:@"application/json" forHTTPHeaderField:@"accept"];
    //NSLog(@"ajdf");
    //__block NSDictionary *tmpData;
    //send synchronouse request
    NSData *returnData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:nil error:nil];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingAllowFragments error:&error];
    return json;
    /*
    NSOperationQueue *queue = [NSOperationQueue mainQueue];
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"%@",dict);
        //NSLog(@"%@",[dict valueForKey:@"final"]);
        NSLog(@"%@", dict[@"final"][@"in"]);
        tmpData = [NSDictionary dictionaryWithDictionary:dict];
        
    }];
    resData = tmpData;
     */
    
    /*
     if (returnData == nil) {
     NSLog(@"send request failed: %@", error);
     return nil;
     }
     
     NSLog(@"print data");
     NSString *response = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
     NSLog(@"response is %@",response);
     NSDictionary *json = [NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingAllowFragments error:&error];
     NSLog(@"%@",[json valueForKey:@"final"]);
     return response; */
    
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

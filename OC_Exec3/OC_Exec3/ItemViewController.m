//
//  ItemViewController.m
//  OC_Exec3
//
//  Created by simao on 15/10/11.
//  Copyright © 2015年 simao. All rights reserved.
//

#import "ItemViewController.h"
//#import "ViewController.h"
#import "basicCellTableViewCell.h"
#import "ImageCell.h"

@interface ItemViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *dict;

@end

@implementation ItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // ViewController *vC;
   // [self doHttpGetParserJsonResp];
    self.dict = [self doHttpGetParserJsonResp];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dict.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imageCell"];
    
    cell.titleLabel.text = self.dict[indexPath.row][@"student"][@"id"];
    cell.subtitleLabel.text = self.dict[indexPath.row][@"student"][@"name"];
    
    NSString *baseUrl = @"http://192.168.1.47:8080/";
    NSString *imageType = @".jpg";
    NSString *imageFileName = [self.dict[indexPath.row][@"student"][@"id"] stringByAppendingString:imageType];
    NSString *url = [baseUrl stringByAppendingString:imageFileName];
    
    
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
   [cell.customImageView setImage: image];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"detail" sender:indexPath];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *destVc = segue.destinationViewController;
    //NSDictionary *dict = [self doHttpGetParserJsonResp];
    //destVc.navigationItem.title = @"table view detail";
    //NSArray *dict = [self doHttpGetParserJsonResp];
    //NSLog(@"%@",dict[@"final"][@"in"]);
    //destVc.navigationItem.title = dict[@"final"][@"in"];
    NSIndexPath * senderIndex = sender;
    
    NSLog(@"%@",self.dict);//[0][@"student"][@"id"]);
    destVc.navigationItem.title = self.dict[senderIndex.row][@"student"][@"name"];
    //NSLog(@"adf");
    //NSLog(@"%@", response);
    
    
}


//- (NSDictionary *)doHttpGetParserJsonResp:(NSDictionary *) resData {
//- (NSDictionary *) doHttpGetParserJsonResp {
- (NSArray *) doHttpGetParserJsonResp {
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
    
    //NSDictionary *json = [NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingAllowFragments error:&error];
    //return json;
    //NSLog(@"before convert");
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingAllowFragments error:&error];
    //NSLog(@"after");
    return jsonArray;
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

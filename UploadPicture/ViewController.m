//
//  ViewController.m
//  UploadPicture
//
//  Created by YouXianMing on 15/6/28.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "Networking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 获取数据
    UIImage *image  = [UIImage imageNamed:@"demo"];
    NSData *dataObj = UIImageJPEGRepresentation(image, 1.0);
    
    // 参数
    NSDictionary *paras = @{@"ContactName"        : @"Lilis",
                            @"ContactPhoneNumber" : @"15910514635",
                            @"LoseDetail"         : @"...",
                            @"address"            : @"",
                            @"gender"             : @"2",
                            @"verify"             : @"012460"};
    

    [Networking UploadDataWithUrlString:BASE_URL // 请更换网址
                             parameters:paras
                        timeoutInterval:nil
                            requestType:HTTPRequestType
                           responseType:JSONResponseType
              constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                  // 构造数据的地方
                  [formData appendPartWithFileData:dataObj name:@"upload" fileName:@"image1.jpg" mimeType:@""];
                  [formData appendPartWithFileData:dataObj name:@"upload" fileName:@"image2.jpg" mimeType:@""];
              }
                                success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                    
                                    // 请求头
                                    NSLog(@"%@", operation.request.allHTTPHeaderFields);
                                    
                                    // 服务器回复的头
                                    NSLog(@"%@", operation.response);
                                    
                                    NSLog(@"%@", responseObject);
                                }
                                failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                    
                                }];
}

@end

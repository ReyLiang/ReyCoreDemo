//
//  ReyUloadFileController.m
//  ReyCoreDemo
//
//  Created by Rey on 13-3-26.
//  Copyright (c) 2013年 Rey. All rights reserved.
//

#import "ReyUloadFileController.h"
#import "ReyShareRequest.h"
#import "ReyDownload.h"

@interface ReyUloadFileController ()

@end

@implementation ReyUloadFileController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIImage * img = [UIImage imageNamed:@"upomp_bypay_loading_bg.png"];
    
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:img,@"uploadImg", nil];
    
    NSMutableURLRequest * request = [ReyShareRequest getRequestWithURL:@"http://192.168.1.193:8080/testJee/appCommon/o_upload_image.jspx" parameber:dic method:ReyShareRequestMethodType_Multipart];
    
    
    [ReyDownload ReyDownloadWithDelegate:self
                                 request:request];
}

//-(void)DownloadFinished:(id)downloaded
//{
//    
//}


//13-01-30 由ReyDownloadManager需求产生.
-(void)DownloadFinished:(id)sender data:(id)downloaded
{
    NSLog(@"finished");
}
-(void)DownloadFailed:(NSError *)error
{
    NSLog(@"failed");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

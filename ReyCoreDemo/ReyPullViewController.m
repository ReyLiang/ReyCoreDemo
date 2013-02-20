//
//  ReyPullViewController.m
//  ReyCoreDemo
//
//  Created by Rey on 13-2-19.
//  Copyright (c) 2013年 Rey. All rights reserved.
//

#import "ReyPullViewController.h"
#import "ReyPullView.h"
#import "ReyCommon.h"
#import "ReyPullView_customMoveBtn.h"
#import "ReyPullView_multiMoveBtn.h"

@interface ReyPullViewController ()
    <ReyPullViewDelegate>

@end

@implementation ReyPullViewController

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
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    NSArray * imgArry = [NSArray arrayWithObjects:
                         [ReyCommon imageNamed:@"first"],
                         [ReyCommon imageNamed:@"first"],
                         [ReyCommon imageNamed:@"second"],
                         [ReyCommon imageNamed:@"second"],nil];
    
    
    //正常不可移动move
//    ReyPullView * pullView = [[ReyPullView alloc]
//                              initWithFrame:CGRectMake(0, 0, 320, 460)
//                              pullFromDirection:ReyPullViewFromDirectionRight
//                              pulledView:[self pulledView]
//                              moveBtnImgs:imgArry
//                              showPoint:CGPointMake(295, 0)];
//    
//    pullView.backgroundColor = [UIColor blueColor];
//    
//    pullView.delegate = self;
//    [self.view addSubview:pullView];
//    [pullView release];
    
//    //可以移动button位置.
//    ReyPullView_customMoveBtn * pullView2 = [[ReyPullView_customMoveBtn alloc]
//                              initWithFrame:CGRectMake(0, 0, 320, 460)
//                              pullFromDirection:ReyPullViewFromDirectionRight
//                              pulledView:[self pulledView]
//                              moveBtnImgs:imgArry
//                              showPoint:CGPointMake(295, 0) moveBtnOrigin:CGPointMake(295, 100)];
//    
//    pullView2.backgroundColor = [UIColor blueColor];
//    
//    pullView2.delegate = self;
//    [self.view addSubview:pullView2];
//    [pullView2 release];
    
    
    //2个Button
    NSArray * imgArry3 = [NSArray arrayWithObjects:
                         [ReyCommon imageNamed:@"first"],
                         [ReyCommon imageNamed:@"first"],
                         [ReyCommon imageNamed:@"second"],
                         [ReyCommon imageNamed:@"second"],
                         [ReyCommon imageNamed:@"first"],
                         [ReyCommon imageNamed:@"first"],
                         [ReyCommon imageNamed:@"second"],
                         [ReyCommon imageNamed:@"second"],nil];
    
    ReyPullView_multiMoveBtn * pullView3 = [[ReyPullView_multiMoveBtn alloc]
                                            initWithFrame:CGRectMake(0, 0, 320, 460)
                                            pullFromDirection:ReyPullViewFromDirectionRight
                                            pulledView:[self pulledView]
                                            moveBtnImgs:imgArry3
                                            showPoint:CGPointMake(295, 10)
                                            otherShowPoint:CGPointMake(295, 100)];
    pullView3.backgroundColor = [UIColor redColor];
    
    pullView3.delegate = self;
    [self.view addSubview:pullView3];
    [pullView3 release];
}

-(UIView *)pulledView
{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 150, 330)];
    view.backgroundColor = [UIColor blackColor];
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 110, 40)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"按钮1" forState:UIControlStateNormal];
    [view addSubview:btn];
    [btn release];
    
    UIButton * btn1 = [[UIButton alloc] initWithFrame:CGRectMake(20, 80, 110, 40)];
    btn1.backgroundColor = [UIColor redColor];
    [btn1 setTitle:@"按钮2" forState:UIControlStateNormal];
    [view addSubview:btn1];
    [btn1 release];
    
    return view;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

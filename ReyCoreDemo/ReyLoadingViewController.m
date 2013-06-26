//
//  ReyLoadingViewController.m
//  ReyCoreDemo
//
//  Created by Rey on 13-4-4.
//  Copyright (c) 2013年 Rey. All rights reserved.
//

#import "ReyLoadingViewController.h"

@interface ReyLoadingViewController ()

@end

@implementation ReyLoadingViewController

@synthesize m_breakLoadView,m_showImgView;

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
    
    UIImage * img = [UIImage imageNamed:@"load1.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:img];
    
    m_showImgView = [[UIImageView alloc] initWithImage:img];
    m_showImgView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:m_showImgView];
    
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
    btn.backgroundColor = [UIColor blackColor];
    [btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"加载" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    [m_showImgView release];
    [m_breakLoadView release];
    [super dealloc];
}

-(void)test
{
    if (!m_breakLoadView) {
        UIImage * img = [ReyCommon getImageFromView:m_showImgView];
        NSLog(@"%f,%f",img.size.width,img.size.height);
        m_breakLoadView = [[ReyBreakLoadView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height) loadingImage:[UIImage imageNamed:@"Loading"] superViewImg:img];
        [self.view addSubview:m_breakLoadView];
        
        [m_breakLoadView startLoading:1];
        
        
        
    }
    
    else
    {
//        UIImage * img2 = [UIImage imageNamed:@"load2.jpg"];
//        UIImageView * imgView = [[UIImageView alloc] initWithImage:img2];
//        imgView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
//        [self.view addSubview:imgView];
        UIImage * img = [ReyCommon getImageFromView:m_showImgView];
        
        NSLog(@"%f,%f",img.size.width,img.size.height);
        [self.view bringSubviewToFront:m_breakLoadView];
        
        [m_breakLoadView startLoading:1 superImage:img];
    }
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(test22) userInfo:nil repeats:NO];
    
    
    
}

-(void)test22
{
    m_showImgView.image = [UIImage imageNamed:@"load2.jpg"];
    [m_breakLoadView endLoading];
}

@end

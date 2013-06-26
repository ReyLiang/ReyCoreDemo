//
//  ReyFirstViewController.m
//  ReyCoreDemo
//
//  Created by Rey on 13-2-19.
//  Copyright (c) 2013年 Rey. All rights reserved.
//

#import "ReyFirstViewController.h"

@interface ReyFirstViewController ()

@end

@implementation ReyFirstViewController

@synthesize m_titlesArry,m_viewsArry;


#define TITLES @"ReyPullView",@"图片上传",@"加载界面",nil
#define VIEWS @"ReyPullViewController",@"ReyUloadFileController",@"ReyLoadingViewController",nil

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"视图";
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    m_titlesArry = [[NSArray alloc] initWithObjects:TITLES];
    m_viewsArry = [[NSArray alloc] initWithObjects:VIEWS];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    [m_titlesArry release];
    [m_viewsArry release];
    [super dealloc];
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",indexPath.description);
    NSString * className = [m_viewsArry objectAtIndex:indexPath.row];
    UIViewController *viewCtrl = [[NSClassFromString(className) alloc] initWithNibName:className bundle:nil];
    [self presentViewController:viewCtrl animated:YES completion:nil];
    [viewCtrl release];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [m_titlesArry count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ReyCoreDemo"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ReyCoreDemo"];
        
    }
    
    cell.textLabel.text = [m_titlesArry objectAtIndex:indexPath.row];
    
    return cell;
}


@end

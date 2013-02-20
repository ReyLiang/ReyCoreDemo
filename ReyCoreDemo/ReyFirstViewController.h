//
//  ReyFirstViewController.h
//  ReyCoreDemo
//
//  Created by Rey on 13-2-19.
//  Copyright (c) 2013年 Rey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReyFirstViewController : UIViewController
    <UITableViewDataSource,UITableViewDelegate>
{
    NSArray * m_titlesArry;
    NSArray * m_viewsArry;
}

@property (nonatomic, retain) NSArray * m_titlesArry;
@property (nonatomic, retain) NSArray * m_viewsArry;

@end

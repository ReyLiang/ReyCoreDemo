//
//  ReyLoadingViewController.h
//  ReyCoreDemo
//
//  Created by Rey on 13-4-4.
//  Copyright (c) 2013年 Rey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReyBreakLoadView.h"
#import <QuartzCore/QuartzCore.h>
#import "ReyCommon.h"

@interface ReyLoadingViewController : UIViewController
{
    UIImageView * m_showImgView;
    ReyBreakLoadView * m_breakLoadView;
}
@property (nonatomic , retain) UIImageView * m_showImgView;
@property (nonatomic , retain) ReyBreakLoadView * m_breakLoadView;
@end

//
//  ReyHpple.m
//  ReyCore
//
//  Created by Rey on 13-9-20.
//
//

#import "ReyHpple.h"

@implementation ReyHpple

@synthesize delegate;
@synthesize download;
//TODO: 自动释放类型..避免bad_access
+(id)startHppleWithURL:(NSURL *)url
                  postBody:(NSDictionary *)postBody
                  delegate:(id<ReyHppleDelegate>)aDelegate
{
    ReyHpple * paerser = [[ReyHpple alloc] initWithURL:url postBody:postBody delegate:aDelegate];
    paerser.isNeedReleaseSelf = YES;
    
    return paerser;
}

-(id)initWithURL:(NSURL *)url
        postBody:(NSDictionary *)postBody
        delegate:(id<ReyHppleDelegate>)aDelegate
{
    if (self =[super init]) {
		isFinished = NO;
		isFailed = NO;
        
        if (postBody) {
            download = [[ReyDownload_Post alloc] init];
            delegate = aDelegate;
            if (postBody) {
                NSArray * keys = [postBody allKeys];
                for (NSString * key in keys) {
                    [download addPostFieldWithKey:key value:[postBody valueForKey:key]];
                }
            }
        }
        else
        {
            download = [[ReyDownload alloc] init];
            delegate = aDelegate;
            
        }
		
		
        
		[download downloadWithURL:url delegate:self];
		
	}
	return self;
}

-(void)dealloc
{
    
    
    if (download) {
        [download release];
        download = nil;
    }

	[super dealloc];
	
	
}

#pragma mark -
#pragma mark ReyHppleDelegate
-(void)DownloadFinished:(id)downloaded
{
	if (![(NSData *)downloaded length]) {
		isFailed = YES;
        if (delegate && [delegate respondsToSelector:@selector(HppleFailed:)]) {
            [delegate HppleFailed:self];
        }
		return;
	}
	
    //	//测试接收
    //	NSString * comPath = [NSString stringWithFormat:@"Documents/1%@",category];
    //	NSString * path = [NSHomeDirectory() stringByAppendingPathComponent:comPath];
    //	NSData * data = [[NSData alloc] initWithData:downloaded];
    //	[data writeToFile:path atomically:NO];
    //	[data release];
    
    //    NSLog(@"%@",[NSString stringWithUTF8String:[downloaded bytes]]);
	
    if (delegate && [delegate respondsToSelector:@selector(HppleFinished:data:)]) {
        [delegate HppleFinished:self data:downloaded];
    }
	
    
	
}

-(void)DownloadFailed:(NSError *)error
{
	isFailed = YES;

    
    if ([delegate respondsToSelector:@selector(HppleFailed:)]) {
        [delegate HppleFailed:self];
    }
    
    [download release];
    download = nil;
    
    if (isNeedReleaseSelf) {
        [self release];
    }
    
    
}

@end

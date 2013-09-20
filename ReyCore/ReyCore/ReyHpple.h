//
//  ReyHpple.h
//  ReyCore
//
//  Created by Rey on 13-9-20.
//
//

#import <Foundation/Foundation.h>
#import "ReyDownload_Post.h"
#import "TFHpple.h"

@protocol ReyHppleDelegate;

@interface ReyHpple : NSObject
    <ReyDownloadDelegate>
{
    

	
	ReyDownload * download;
	
	//防止没有下载完成,把自己释放掉
	bool isFinished;
	
	//防止没有下载完成,把自己释放掉
	bool isFailed;
    
    //标识释放为自身释放类型
    bool isNeedReleaseSelf;
    
    //委托指针
    id<ReyHppleDelegate> delegate;
	
	
}

@property (nonatomic , retain) ReyDownload * download;

@property (nonatomic) bool isFinished;
@property (nonatomic) bool isFailed;
@property (nonatomic) bool isNeedReleaseSelf;

@property (nonatomic , assign) id<ReyHppleDelegate> delegate;

+(id)startHppleWithURL:(NSURL *)url
                  postBody:(NSDictionary *)postBody
                  delegate:(id<ReyHppleDelegate>)aDelegate;

-(id)initWithURL:(NSURL *)url
        postBody:(NSDictionary *)postBody
        delegate:(id<ReyHppleDelegate>)aDelegate;

@end

@protocol ReyHppleDelegate <NSObject>

-(void)HppleFinished:(ReyHpple *)hpple data:(id)parsedData;

-(void)HppleFailed:(ReyHpple *)hpple;

@end

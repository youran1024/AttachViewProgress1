//
//  HTAttachView.h
//  MyViewController
//
//  Created by Mr.Yang on 13-7-28.
//  Copyright (c) 2013年 Hunter. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 *	@类型：自绘制图形基类
 */
@interface HTCustomerAttachView : UIView
{
    @public
    UIColor *_fillColor;
    UIColor *_strokeColor;
    NSInteger _strokeWidth;
}
@property (nonatomic, retain)   UIColor *fillColor;
@property (nonatomic, retain)   UIColor *strokeColor;
@property (nonatomic, assign)   NSInteger strokeWidth;

@end

/*
 *	@类型：进度条基类
 */
@interface HTBaseProgressView : HTCustomerAttachView
{
    @public
    CGFloat _progressValue;
}
@property (nonatomic, assign) CGFloat progressValue;

@end

/*
 *	@类型：自定义进度条
 *  @样式：长条形
 */
@interface HTProgressView : HTBaseProgressView

@end

/*
 *	@类型：自定义进度条
 *  @样式：圆弧形，不填充
 */

@interface HTProgressArcView : HTBaseProgressView

@end

/*
 *	@类型：自定义进度条
 *  @样式：圆弧形，带填充
 */

@interface HTProgressArcFillView : HTBaseProgressView

@end


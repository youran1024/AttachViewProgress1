//
//  HTAttachView.m
//  MyViewController
//
//  Created by Mr.Yang on 13-7-28.
//  Copyright (c) 2013年 Hunter. All rights reserved.
//

#define HTATTACHVIEW_STROKECOLOR    [UIColor orangeColor]
#define HTATTACHVIEW_FILLCOLOR      [UIColor orangeColor]
#define HTATTACHVIEW_STROKEWIDTH    2.0f

#import "HTAttachView.h"

@implementation HTCustomerAttachView

- (void)dealloc
{
    [_strokeColor release];
    [_fillColor release];
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initVariables];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self initVariables];
    }
    return self;
}

- (void)initVariables
{
    _fillColor = HTATTACHVIEW_FILLCOLOR;
    _strokeColor = HTATTACHVIEW_STROKECOLOR;
    _strokeWidth = HTATTACHVIEW_STROKEWIDTH;
}

- (void)drawRect:(CGRect)rect
{
    self.backgroundColor = [UIColor clearColor];
}

@end

@implementation HTBaseProgressView

- (void)setProgressValue:(CGFloat)progressValue
{
    _progressValue = progressValue;
    [self setNeedsDisplay];
}

@end


@implementation HTProgressView

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    self.backgroundColor = [UIColor clearColor];
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSaveGState(contextRef);
    [self.fillColor setFill];
    [self.strokeColor setStroke];
    CGContextSetLineWidth(contextRef, _strokeWidth);
    
    CGRect fillRect = CGRectInset(rect, self->_strokeWidth, self->_strokeWidth);
    CGFloat radius= fillRect.size.height /  2.0f;
    
    CGMutablePathRef mutablePathRef = CGPathCreateMutable();
    CGPathMoveToPoint(mutablePathRef, NULL, CGRectGetMaxX(fillRect) - radius, _strokeWidth);
    CGPathAddArc(mutablePathRef, NULL, _strokeWidth + radius, _strokeWidth + radius , radius, -M_PI / 2.0, M_PI / 2.0, true);
    CGPathAddArc(mutablePathRef, NULL, CGRectGetMaxX(fillRect) - radius, _strokeWidth + radius , radius, M_PI / 2.0, -M_PI / 2.0, true);
    CGPathCloseSubpath(mutablePathRef);
    CGContextAddPath(contextRef, mutablePathRef);
    CGContextStrokePath(contextRef);
    CGContextAddPath(contextRef, mutablePathRef);
    CGContextClip(contextRef);
    CGContextFillRect(contextRef, CGRectMake(fillRect.origin.x, fillRect.origin.y, fillRect.size.width * _progressValue, fillRect.size.height));
    
    CGContextRestoreGState(contextRef);
    CGPathRelease(mutablePathRef);
}

@end

@implementation HTProgressArcView

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    [[UIColor redColor] setFill];
    [[UIColor whiteColor] setStroke];
    CGContextSetLineWidth(contextRef, 2.0f);
    
    CGRect arcRect = CGRectInset(rect, 2, 2);
    CGFloat radius = arcRect.size.height / 2.0f;
    
    CGContextAddArc(contextRef, CGRectGetMinX(arcRect) + arcRect.size.width / 2.0f, CGRectGetMinY(arcRect) + arcRect.size.height / 2, radius, M_PI, M_PI + 2 * M_PI * _progressValue, false);
    
    CGContextDrawPath(contextRef, kCGPathStroke);
}

@end

@implementation HTProgressArcFillView

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    [_fillColor setFill];
    [_strokeColor setStroke];
    CGContextSetLineWidth(contextRef, _strokeWidth);
    
    CGRect arcRect = CGRectInset(rect, 2, 2);
    CGFloat radius = arcRect.size.height / 2.0f;
    
    CGContextMoveToPoint(contextRef, CGRectGetMinX(arcRect) + arcRect.size.width / 2.0f, CGRectGetMinY(arcRect) + arcRect.size.height / 2);
    CGContextAddArc(contextRef, CGRectGetMinX(arcRect) + arcRect.size.width / 2.0f, CGRectGetMinY(arcRect) + arcRect.size.height / 2, radius, M_PI, M_PI + 2 * M_PI * _progressValue, false);
    
    if (_progressValue < 1.0) {
        CGContextClosePath(contextRef);
    }
    
    CGContextDrawPath(contextRef, kCGPathFillStroke);
}

@end
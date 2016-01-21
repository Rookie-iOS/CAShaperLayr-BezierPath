//
//  ZYView.m
//  Context
//
//  Created by Bingo on 16/1/20.
//  Copyright © 2016年 Bingo. All rights reserved.
//

#import "ZYView.h"

@implementation ZYView

- (void)drawRect:(CGRect)rect {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 5);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    
    // 实线
    const CGPoint point1[] = {CGPointMake(10, 40),CGPointMake(210, 40)};
    CGContextStrokeLineSegments(ctx, point1, 2);
    // 虚线
    const CGPoint point[] = {CGPointMake(10, 50),CGPointMake(210, 50)};
    const CGFloat lengths[] = {10,5};
    
    /**
     
     void CGContextSetLineDash (
         CGContextRef c,
         CGFloat phase,  代表起始绘制的位置，决定起始是绘制点，还是绘制空白
         const CGFloat *lengths, 数组，第一个元素代表绘制点的长度，第二个代表空白长度
         size_t count 数组中的个数，
     );
     
     插一嘴：举个栗子 lengths数组为 {10,5} 代表点需要绘制10个pt，空白需要绘制5个pt，
            若为{3,1,2},则 点长3pt，空长1pt，点长2pt，空长3pt，以此类推。。。。。
            结合 phase，若是phase = 10，那么就会先绘制5pt长的空白，若是phase = 3，
            那么就会先绘制7pt长度的实线 。。。。。。
     
     */
    
    CGContextSetLineDash(ctx, 10, lengths, 2);
    CGContextStrokeLineSegments(ctx, point, 2);
    
}

@end

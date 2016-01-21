//
//  ZYAnimationLayer.h
//  Context
//
//  Created by Bingo on 16/1/21.
//  Copyright © 2016年 Bingo. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <CoreText/CoreText.h>
#import <UIKit/UIKit.h>

@interface ZYAnimationLayer : CALayer

@property (nonatomic, retain) CAShapeLayer *pathLayer;

+(void)createAnimationLayerWithString:(NSString*)string andRect:(CGRect)rect andView:(UIView*)view andFont:(CTFontRef)font andStrokeColor:(UIColor*)color;

@end

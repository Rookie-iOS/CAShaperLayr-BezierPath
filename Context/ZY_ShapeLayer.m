//
//  ZY_ShapeLayer.m
//  ZYDrawText
//
//  Created by Bingo on 16/1/21.
//  Copyright © 2016年 Bingo. All rights reserved.
//

#import "ZY_ShapeLayer.h"

@implementation ZY_ShapeLayer

- (void)drawTextTest:(NSString *)content {
    
//    // 1. 获取文字路径
    CGMutablePathRef fontPath = CGPathCreateMutable();
    NSDictionary *fontAttr = @{NSFontAttributeName:[UIFont systemFontOfSize:30]};
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:content attributes:fontAttr];
    
    CTLineRef line = CTLineCreateWithAttributedString((__bridge CFAttributedStringRef)str);
    CFArrayRef runArray = CTLineGetGlyphRuns(line);
    for (int runIndex=0; runIndex<CFArrayGetCount(runArray); runIndex++) {
        CTRunRef run = CFArrayGetValueAtIndex(runArray, runIndex);
        CTFontRef fontRef = CFDictionaryGetValue(CTRunGetAttributes(run), NSFontAttributeName);
        for (int glayIndex = 0; glayIndex<CTRunGetGlyphCount(run); glayIndex++) {
            
            CFRange range = CFRangeMake(glayIndex, 1);
            CGGlyph glypg;
            CGPoint position;
            CTRunGetGlyphs(run, range, &glypg);
            CTRunGetPositions(run, range, &position);
            CGPathRef path = CTFontCreatePathForGlyph(fontRef, glypg, NULL);
            CGAffineTransform t = CGAffineTransformMakeTranslation(position.x, position.y);
            CGPathAddPath(fontPath, &t, path);
            CFRelease(path);
        }
    }
    CFRelease(line);

    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointZero];
    [path appendPath:[UIBezierPath bezierPathWithCGPath:fontPath]];
    CGPathRelease(fontPath);
    
    self.geometryFlipped = YES; // 翻转坐标
    self.path = path.CGPath;
    self.strokeColor = [UIColor redColor].CGColor;
    self.fillColor = nil;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 10.0f;
    animation.fromValue = @(0);
    animation.toValue = @(1);
    [self addAnimation:animation forKey:@"test"];
    
}

@end

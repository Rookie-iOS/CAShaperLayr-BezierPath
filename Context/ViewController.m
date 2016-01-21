//
//  ViewController.m
//  Context
//
//  Created by Bingo on 16/1/20.
//  Copyright © 2016年 Bingo. All rights reserved.
//

#import "ViewController.h"
#import "ZYView.h"
#import "ZYAnimationLayer.h"
#import "ZY_ShapeLayer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ZYView *ziv = [[ZYView alloc] initWithFrame:CGRectMake(10, 0, 300, 300)];
    ziv.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:ziv];
    
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    view.backgroundColor = [UIColor orangeColor];
    
    UITextField *res = [[UITextField alloc] initWithFrame:CGRectMake(10, 300, 300, 30)];
    res.borderStyle = UITextBorderStyleLine;
    res.inputView = view;
    res.inputAccessoryView = view;
    [self.view addSubview:res];
    
    
}

- (void)demoDraw{

    ZY_ShapeLayer *layer = [ZY_ShapeLayer layer];
    layer.frame = CGRectMake(10, 100, 300, 200);
    [layer drawTextTest:@"张扬"];
    [self.view.layer addSublayer:layer];
}

- (void)explame{

    for (id layer in self.view.layer.sublayers) {
        if([layer isKindOfClass:[ZYAnimationLayer class]])
        {
            [layer removeFromSuperlayer];
        }
    }
    //这个方法主要是笔运行特别选得那种效果的方法 只要一调用即可
    [ZYAnimationLayer createAnimationLayerWithString:@"张扬" andRect: CGRectMake(20.0f, -100.0f,
                                                                               CGRectGetWidth(self.view.layer.bounds) - 40.0f,
                                                                               CGRectGetHeight(self.view.layer.bounds) - 84.0f) andView:self.view andFont:CTFontCreateWithName(CFSTR("Arial"), 50.0f, NULL) andStrokeColor:[UIColor orangeColor]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  XYCSecomdViewController.m
//  KVO基本使用
//
//  Created by Yuan Le on 2018/10/18.
//  Copyright © 2018年 Yuan Le. All rights reserved.
//

#import "XYCSecomdViewController.h"
#import "XYCPerson.h"

@interface XYCSecomdViewController ()
@property (nonatomic,strong)XYCPerson* per;
@end

@implementation XYCSecomdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _per = [XYCPerson new];
    
    //kvo第一步
    [_per addObserver:self forKeyPath:@"firstName" options:NSKeyValueObservingOptionNew context:nil];
}

//kvo第二步
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"%@",change[@"new"]);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _per.firstName = @"cai";
    [self dismissViewControllerAnimated:YES completion:nil];

}

-(void)dealloc{
    //kvo第三步
    [_per removeObserver:self forKeyPath:@"firstName"];
}

@end


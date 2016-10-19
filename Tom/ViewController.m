//
//  ViewController.m
//  Tom
//
//  Created by AHJD-06 on 16/9/28.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ViewController.h"
/*
 未优化的定值帧时常（ms）
#define ANIMATION_DURATION 3
*/
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *tom;

//创建一个存储按钮的数组，减少按钮的方法数，利用下标区分按钮
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *allActionButtons;

@end

@implementation ViewController
//注意一个问题：需要播放的帧图片需要将图片放在附属文件中，由于是jpg格式的图片所以不能放在Assets.xcassets中
 /*数据 优化
  1.将按钮连线到同一个方法中，根据indexPath遍历点击的按钮
  2.将动作整合到一个方法中，根据按钮的不同，修改图片名称，动画的帧数以及帧时长
  3.将帧时常单独作为一个参数，以根据不同的动作修改不同的帧时常*/

- (IBAction)action:(UIButton *)sender {
    //获取按钮的下标
    NSInteger index = [self.allActionButtons indexOfObject:sender];
    //根据不同的下标，利用tom猫的动作方法，启动不同的动作
    switch (index) {
        case 0:
            [self tomActionWithName:@"eat" imageCount:40 animationDuration:3];
            break;
        case 1:
            [self tomActionWithName:@"cymbal" imageCount:12 animationDuration:3];
            break;
        case 2:
            [self tomActionWithName:@"scratch" imageCount:55 animationDuration:3.2];
            break;
        case 3:
            [self tomActionWithName:@"pie" imageCount:23 animationDuration:2.3];
            break;
        case 4:
            [self tomActionWithName:@"drink" imageCount:80 animationDuration:5];
            break;
        case 5:
            [self tomActionWithName:@"fart" imageCount:27 animationDuration:2.2];
            break;
        case 6:
            [self tomActionWithName:@"knockout" imageCount:80 animationDuration:5.5];
            break;
        case 7:
            [self tomActionWithName: @"stomach" imageCount:33 animationDuration:3.5];
            break;
        case 8:
            [self tomActionWithName:@"footRight" imageCount:29 animationDuration:2.5];
            break;
        case 9:
            [self tomActionWithName:@"footLeft" imageCount:29 animationDuration:2.5];
            break;
        case 10:
            [self tomActionWithName:@"angry" imageCount:25 animationDuration:3];
            break;
            
        default:
            break;
    }
}

//tom猫的动作方法，拥有三个参数，图片名称，动画的帧数以及帧时长
-(void)tomActionWithName:(NSString *)name imageCount:(NSInteger)count animationDuration:(CGFloat)animationDuration{
    //如果动画正在播放，则不重复播放（判断BOOl 类型的isAnimating值是否是真，是则返回空）
    if (self.tom.isAnimating ) {
        return;
    }
    //创建一个图片数组 根据图片的个数不同，添加到数组
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i<count; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%@_%02ld.jpg",name,(long)i];
        UIImage *image = [UIImage imageNamed:imageName];
        [array addObject:image];
    }
    //动画的图片来源
    self.tom.animationImages = array;
    //动画播放的帧时常
    self.tom.animationDuration = animationDuration;
    //动画的重复次数，设置为0，则无限次重复播放
    self.tom.animationRepeatCount = 1;
    //启动动画
    [self.tom startAnimating];
}



//以下代码为未数据优化的代码部分
/*
//吃鸟
- (IBAction)eatBird {
    if (self.tom.isAnimating ) {
        return;
    }
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i<40; i++) {
        NSString *imageName = [NSString stringWithFormat:@"eat_%02ld.jpg",(long)i];
        UIImage *image = [UIImage imageNamed:imageName];
        [array addObject:image];
    }
    self.tom.animationImages = array;
    self.tom.animationDuration = ANIMATION_DURATION;
    self.tom.animationRepeatCount = 1;
    [self.tom startAnimating];
    
}

//打铙钹
- (IBAction)cymbal {
    if (self.tom.isAnimating ) {
        return;
    }
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i<12; i++) {
        NSString *imageName = [NSString stringWithFormat:@"cymbal_%02ld.jpg",(long)i];
        UIImage *image = [UIImage imageNamed:imageName];
        [array addObject:image];
    }
    self.tom.animationImages = array;
    self.tom.animationDuration = ANIMATION_DURATION;
    self.tom.animationRepeatCount = 1;
    [self.tom startAnimating];
}

//爪子刮玻璃
- (IBAction)scratch {
    if (self.tom.isAnimating ) {
        return;
    }
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i<55; i++) {
        NSString *imageName = [NSString stringWithFormat:@"scratch_%02ld.jpg",(long)i];
        UIImage *image = [UIImage imageNamed:imageName];
        [array addObject:image];
    }
    self.tom.animationImages = array;
    self.tom.animationDuration = ANIMATION_DURATION;
    self.tom.animationRepeatCount = 1;
    [self.tom startAnimating];
}

//丢派饼
- (IBAction)pie {
    if (self.tom.isAnimating ) {
        return;
    }
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i<23; i++) {
        NSString *imageName = [NSString stringWithFormat:@"pie_%02ld.jpg",(long)i];
        UIImage *image = [UIImage imageNamed:imageName];
        [array addObject:image];
    }
    self.tom.animationImages = array;
    self.tom.animationDuration = ANIMATION_DURATION;
    self.tom.animationRepeatCount = 1;
    [self.tom startAnimating];
}

//喝牛奶
- (IBAction)drink {
    if (self.tom.isAnimating ) {
        return;
    }
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i<80; i++) {
        NSString *imageName = [NSString stringWithFormat:@"drink_%02ld.jpg",(long)i];
        UIImage *image = [UIImage imageNamed:imageName];
        [array addObject:image];
    }
    self.tom.animationImages = array;
    self.tom.animationDuration = ANIMATION_DURATION;
    self.tom.animationRepeatCount = 1;
    [self.tom startAnimating];
}

//放屁
- (IBAction)fart {
    if (self.tom.isAnimating ) {
        return;
    }
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i<27; i++) {
        NSString *imageName = [NSString stringWithFormat:@"fart_%02ld.jpg",(long)i];
        UIImage *image = [UIImage imageNamed:imageName];
        [array addObject:image];
    }
    self.tom.animationImages = array;
    self.tom.animationDuration = ANIMATION_DURATION;
    self.tom.animationRepeatCount = 1;
    [self.tom startAnimating];
}



//以下按钮均为透明按钮
//肚子
- (IBAction)stomach{
    if (self.tom.isAnimating ) {
        return;
    }
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i<33; i++) {
        NSString *imageName = [NSString stringWithFormat:@"stomach_%02ld.jpg",(long)i];
        UIImage *image = [UIImage imageNamed:imageName];
        [array addObject:image];
    }
    self.tom.animationImages = array;
    self.tom.animationDuration = ANIMATION_DURATION;
    self.tom.animationRepeatCount = 1;
    [self.tom startAnimating];
    
}
//左脚
- (IBAction)footLeft{
    if (self.tom.isAnimating ) {
        return;
    }
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i<29; i++) {
        NSString *imageName = [NSString stringWithFormat:@"footLeft_%02ld.jpg",(long)i];
        UIImage *image = [UIImage imageNamed:imageName];
        [array addObject:image];
    }
    self.tom.animationImages = array;
    self.tom.animationDuration = ANIMATION_DURATION;
    self.tom.animationRepeatCount = 1;
    [self.tom startAnimating];
}
//右脚
- (IBAction)footRight{
    if (self.tom.isAnimating ) {
        return;
    }
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i<29; i++) {
        NSString *imageName = [NSString stringWithFormat:@"footRight_%02ld.jpg",(long)i];
        UIImage *image = [UIImage imageNamed:imageName];
        [array addObject:image];
    }
    self.tom.animationImages = array;
    self.tom.animationDuration = ANIMATION_DURATION;
    self.tom.animationRepeatCount = 1;
    [self.tom startAnimating];
}
//尾巴（生气）
- (IBAction)angry{
    if (self.tom.isAnimating ) {
        return;
    }
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i<25; i++) {
        NSString *imageName = [NSString stringWithFormat:@"angry_%02ld.jpg",(long)i];
        UIImage *image = [UIImage imageNamed:imageName];
        [array addObject:image];
    }
    self.tom.animationImages = array;
    self.tom.animationDuration = ANIMATION_DURATION;
    self.tom.animationRepeatCount = 1;
    [self.tom startAnimating];
}
//头（敲晕）
- (IBAction)knockOut{
    if (self.tom.isAnimating ) {
        return;
    }
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i<80; i++) {
        NSString *imageName = [NSString stringWithFormat:@"knockout_%02ld.jpg",(long)i];
        UIImage *image = [UIImage imageNamed:imageName];
        [array addObject:image];
    }
    self.tom.animationImages = array;
    self.tom.animationDuration = ANIMATION_DURATION;
    self.tom.animationRepeatCount = 1;
    [self.tom startAnimating];
}
*/


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

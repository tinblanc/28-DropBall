//
//  ViewController.m
//  DropBall
//
//  Created by Tin Blanc on 4/8/16.
//  Copyright © 2016 Tin Blanc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIImageView *ball;
    NSTimer *timer;
    CGFloat ballRadius;
    CGFloat x, y, vellocityY, accellerateY, maxHeight; // accellerate: tốc độ rơi ( gia tốc )
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self addBall];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.016 // chu kỳ cập nhật lại ball
                                             target:self
                                           selector:@selector(dropBall)
                                           userInfo:nil
                                            repeats:true];

}

-(void) addBall {
    CGSize mainViewSize = self.view.bounds.size;
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ball.png"]];
    ballRadius = 32.0;
    x = mainViewSize.width * 0.5;
    y = ballRadius;
    
    vellocityY = 0.0; // vận tốc ban đầu
    accellerateY = 0.25; // tốc độ rơi
    
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    
    maxHeight = mainViewSize.height - ballRadius - statusNavigationBarHeight;
    
    ball.center = CGPointMake(x, y);
    [self.view addSubview:ball];
}

-(void) dropBall {
    vellocityY += accellerateY;
    y += vellocityY;
    if (y > maxHeight) {
        vellocityY = -vellocityY * 0.9; // hệ số damper
        y = maxHeight;
    }
    ball.center = CGPointMake(x, y);
    
}


@end

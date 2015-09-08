//
//  ViewController.m
//  RatingSlider
//
//  Created by Adusa on 15/9/1.
//  Copyright (c) 2015年 Adusa. All rights reserved.
//

#import "ViewController.h"
#import "StarSlider.h"
@interface ViewController ()

@end

@implementation ViewController
{
    StarSlider *_slider;
    UILabel *_countLabel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _slider=[[StarSlider alloc]initWithFrame:CGRectMake(40, 100, 24*8, 34)];
    [_slider addTarget:self action:@selector(handleStarSliderChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_slider];
    _countLabel=[[UILabel alloc]initWithFrame:CGRectMake(40, 200, 100, 40)];
    [self.view addSubview:_countLabel];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)handleStarSliderChanged:(StarSlider *)star
{
    
    _countLabel.text=[NSString stringWithFormat:@"%luStars",star.value];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

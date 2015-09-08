//
//  StarSlider.m
//  RatingSlider
//
//  Created by Adusa on 15/9/1.
//  Copyright (c) 2015年 Adusa. All rights reserved.
//

#import "StarSlider.h"
#define WIDTH 24.0f
#define OFF_ART	[UIImage imageNamed:@"Star-White-Half.png"]
#define ON_ART	[UIImage imageNamed:@"Star-White.png"]
@implementation StarSlider

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        float offsetCenter=WIDTH;
        for (int i=0; i<=5; i++) {
            UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, WIDTH, WIDTH)];
            imageView.image=OFF_ART;
            imageView.center=CGPointMake(offsetCenter, self.intrinsicContentSize.height/2.0f);
            offsetCenter+=WIDTH*1.5f;
            [self addSubview:imageView];
        }
    }
    self.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.25f];
    return self;
}
-(CGSize)intrinsicContentSize
{
    return  CGSizeMake(WIDTH *8.0f, 34.0f);
}

-(void)updateValueAtPoint:(CGPoint)p
{
    NSInteger newValue=0;
    UIImageView *changeView=nil;
    for (UIImageView *eachItem in [self subviews]) {
        if (p.x<eachItem.frame.origin.x) {
            eachItem.image=OFF_ART;
        }else
        {
            changeView=eachItem;
            eachItem.image=ON_ART;
            newValue++;
        }
    }
    
        if (self.value!=newValue) {
            self.value=newValue;
            [self sendActionsForControlEvents:UIControlEventValueChanged];
            [UIView animateWithDuration:0.15f animations:^{
                changeView.transform=CGAffineTransformMakeScale(1.5f, 1.5f);
            } completion:^(BOOL done){
                [UIView animateWithDuration:0.1f animations:^{
                    changeView.transform=CGAffineTransformIdentity;
                }];
            }];
        }
    
}

-(BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchPoint=[touch locationInView:self];
    [self sendActionsForControlEvents:UIControlEventTouchDown];
    [self updateValueAtPoint:touchPoint];
    return YES;
}

-(BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
CGPoint touchPoint=[touch locationInView:self];
    if (CGRectContainsPoint(self.bounds, touchPoint)) {
        [self sendActionsForControlEvents:UIControlEventTouchDragInside];
    }
    else
    {
        [self sendActionsForControlEvents:UIControlEventTouchDragOutside];
    }
    [self updateValueAtPoint:[touch locationInView:self]];
    return YES;
}

-(void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchPoint=[touch locationInView:self];
    if (CGRectContainsPoint(self.bounds, touchPoint)) {
        [self sendActionsForControlEvents:UIControlEventTouchUpInside];
    }
    else
    {
        [self sendActionsForControlEvents:UIControlEventTouchUpOutside];
    }
}

-(void)cancelTrackingWithEvent:(UIEvent *)event
{
    [self sendActionsForControlEvents:UIControlEventTouchCancel];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

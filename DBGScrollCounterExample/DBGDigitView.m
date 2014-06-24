//
//  DBGDigitView.m
//  DBGScrollCounterExample
//
//  Created by David Grandinetti on 11/13/13.
//  Copyright (c) 2013 David Grandinetti. All rights reserved.
//

#import "DBGDigitView.h"
#import "DBGDigitContentView.h"
#import <QuartzCore/QuartzCore.h>

@interface DBGDigitView () <UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) DBGDigitContentView *digitsView;

@end

@implementation DBGDigitView

- (instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    if (!self) {
        return nil;
    }
    
    self.scrollStyle = DBGDigitScrollStyleFlick;
    [self addViews];
    
    return self;
}

- (void)addViews {
    CGRect frame = CGRectMake(0, 0, 50, 90);
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.delegate = self;
    
    DBGDigitContentView *digitsView = [[DBGDigitContentView alloc] init];
    [scrollView addSubview:digitsView];
    self.digitsView = digitsView;
    
    scrollView.contentSize = CGSizeMake(50, 900);
    [self addSubview:scrollView];
    self.scrollView = scrollView;
    
    CGFloat height = frame.size.height;
    CGFloat width = frame.size.width;
    
    UIColor *whiteWithNoAlpha = [UIColor colorWithWhite: 1.0 alpha:0.0];
    UIColor *whiteWithFullAlpha = [UIColor colorWithWhite:1.0 alpha:1.0];
    
    NSArray *colors = [NSArray arrayWithObjects:
                       (id)whiteWithNoAlpha.CGColor, (id)whiteWithFullAlpha.CGColor, nil];
    
    CGPoint topPoint = CGPointMake(0.5, 1.0);
    CGPoint bottomPoint = CGPointMake(0.5, 0.0);
    
    UIView *topGradientView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 22)];

    CAGradientLayer *topGradient = [CAGradientLayer layer];
    topGradient.frame = CGRectMake(0, 0, width, 22);
    topGradient.colors = colors;
    topGradient.startPoint = topPoint;
    topGradient.endPoint = bottomPoint;
    [topGradientView.layer insertSublayer:topGradient atIndex:0];
    
    [self addSubview:topGradientView];

    UIView *bottomGradientView = [[UIView alloc] initWithFrame:CGRectMake(0, height-8, width, 8)];

    CAGradientLayer *bottomGradient = [CAGradientLayer layer];
    bottomGradient.frame = CGRectMake(0, 0, width, 8);
    bottomGradient.colors = colors;
    bottomGradient.startPoint = bottomPoint;
    bottomGradient.endPoint = topPoint;
    [bottomGradientView.layer insertSublayer:bottomGradient atIndex:0];
    
    [self addSubview:bottomGradientView];
}

- (void)scrollToDigit:(NSInteger)digit {
    CGFloat offset = 90.0 * digit;
    
    if (self.scrollStyle == DBGDigitScrollStyleFlick) {
        [UIView animateWithDuration:0.8
                              delay:0
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             [self.scrollView setContentOffset:CGPointMake(0, offset) animated:NO];
                         }
                         completion:^(BOOL finished) {
                             //nothing
                         }];
    } else if (self.scrollStyle == DBGDigitScrollStyleSpring) {
        [UIView animateWithDuration:0.8
                              delay:0
             usingSpringWithDamping:0.85
              initialSpringVelocity:0.5
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             [self.scrollView setContentOffset:CGPointMake(0, offset) animated:NO];
                         }
                         completion:^(BOOL finished) {
                             //nothing
                         }];
    }
}

@end

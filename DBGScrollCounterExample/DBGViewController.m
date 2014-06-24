//
//  DBGViewController.m
//  DBGScrollCounterExample
//
//  Created by David Grandinetti on 11/13/13.
//  Copyright (c) 2013 David Grandinetti. All rights reserved.
//

#import "DBGViewController.h"
#import "DBGDigitView.h"

@interface DBGViewController ()

@property (nonatomic, weak) IBOutlet DBGDigitView *onesDigitView;
@property (nonatomic, weak) IBOutlet DBGDigitView *tensDigitView;
@property (nonatomic, weak) IBOutlet DBGDigitView *hundredsDigitView;
@property (nonatomic, weak) IBOutlet DBGDigitView *oneThousandsDigitView;
@property (nonatomic, weak) IBOutlet DBGDigitView *tenThousandsDigitView;
@property (nonatomic, weak) IBOutlet DBGDigitView *hundredThousandsDigitView;
@property (nonatomic, weak) IBOutlet DBGDigitView *oneMillionsDigitView;
@property (nonatomic, weak) IBOutlet DBGDigitView *tenMillionsDigitView;
@property (nonatomic, weak) IBOutlet DBGDigitView *hundredMillionsDigitView;

@property (nonatomic) NSTimer *addNumberTimer;
@property (nonatomic) NSInteger number;

@end

@implementation DBGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // random between 1,000,000 and 10,000,000
    self.number = 1000000 + arc4random_uniform(9000000);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    if (self.addNumberTimer) {
        self.addNumberTimer = nil;
    }
    
    self.addNumberTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(addRandomNumber:) userInfo:nil repeats:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.addNumberTimer invalidate];
}

- (void)addRandomNumber:(NSTimer *)timer {
    self.number += 500 + arc4random_uniform(3000);
    NSInteger tmpNumber = self.number;
    NSLog(@"tmpNumber = %d", tmpNumber);
    
    if (![NSThread isMainThread]) {
        NSLog(@"You are NOT on the main thread, dummy");
    }
    
    [self.onesDigitView scrollToDigit:(tmpNumber %10)];
    tmpNumber = tmpNumber/10;
    [self.tensDigitView scrollToDigit:(tmpNumber %10)];
    tmpNumber = tmpNumber/10;
    [self.hundredsDigitView scrollToDigit:(tmpNumber %10)];
    tmpNumber = tmpNumber/10;
    
    [self.oneThousandsDigitView scrollToDigit:(tmpNumber %10)];
    tmpNumber = tmpNumber/10;
    [self.tenThousandsDigitView scrollToDigit:(tmpNumber %10)];
    tmpNumber = tmpNumber/10;
    [self.hundredThousandsDigitView scrollToDigit:(tmpNumber %10)];
    tmpNumber = tmpNumber/10;
    
    [self.oneMillionsDigitView scrollToDigit:(tmpNumber %10)];
    tmpNumber = tmpNumber/10;
    [self.tenMillionsDigitView scrollToDigit:(tmpNumber %10)];
    tmpNumber = tmpNumber/10;
    [self.hundredMillionsDigitView scrollToDigit:(tmpNumber %10)];
    tmpNumber = tmpNumber/10;
}

@end

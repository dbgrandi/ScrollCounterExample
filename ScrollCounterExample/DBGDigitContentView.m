//
//  DBGDigitsView.m
//  DBGScrollCounterExample
//
//  Created by David Grandinetti on 11/13/13.
//  Copyright (c) 2013 David Grandinetti. All rights reserved.
//

#import "DBGDigitContentView.h"

@implementation DBGDigitContentView

- (id)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, 50, 900);
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    [paragraphStyle setAlignment: NSTextAlignmentCenter];
    
    NSDictionary *fontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"AvenirNextCondensed-DemiBold" size: 80],
                                     NSForegroundColorAttributeName: [UIColor blackColor],
                                     NSParagraphStyleAttributeName: paragraphStyle};

    [@"0" drawInRect:CGRectMake(0, 90*0, 50, 90) withAttributes:fontAttributes];
    [@"1" drawInRect:CGRectMake(0, 90*1, 50, 90) withAttributes:fontAttributes];
    [@"2" drawInRect:CGRectMake(0, 90*2, 50, 90) withAttributes:fontAttributes];
    [@"3" drawInRect:CGRectMake(0, 90*3, 50, 90) withAttributes:fontAttributes];
    [@"4" drawInRect:CGRectMake(0, 90*4, 50, 90) withAttributes:fontAttributes];
    [@"5" drawInRect:CGRectMake(0, 90*5, 50, 90) withAttributes:fontAttributes];
    [@"6" drawInRect:CGRectMake(0, 90*6, 50, 90) withAttributes:fontAttributes];
    [@"7" drawInRect:CGRectMake(0, 90*7, 50, 90) withAttributes:fontAttributes];
    [@"8" drawInRect:CGRectMake(0, 90*8, 50, 90) withAttributes:fontAttributes];
    [@"9" drawInRect:CGRectMake(0, 90*9, 50, 90) withAttributes:fontAttributes];
}

@end

//
//  DBGDigitView.h
//  ScrollCounterExample
//
//  Created by David Grandinetti on 11/13/13.
//  Copyright (c) 2013 David Grandinetti. All rights reserved.
//

typedef enum {
    DBGDigitScrollStyleFlick = 1,
    DBGDigitScrollStyleSpring
} DBGDigitScrollStyle;

@interface DBGDigitView : UIView

@property (nonatomic) DBGDigitScrollStyle scrollStyle;

- (void)scrollToDigit:(NSInteger)digit;

@end

//
//  HMBaseView.m
//  LYHM
//
//  Created by chenxiaojie on 2019/8/5.
//  Copyright © 2019 chenxiaojie. All rights reserved.
//

#import "HMBaseView.h"

@implementation HMBaseView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.leftPadding = 15.0f;
        
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    HidenKeybord;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

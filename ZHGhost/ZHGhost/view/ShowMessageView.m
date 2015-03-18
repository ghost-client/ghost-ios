//
//  ShowMessageView.m
//  LogisticBsusines
//
//  Created by hangzhang on 15/1/19.
//  Copyright (c) 2015 物流商户端. All rights reserved.
//

#import "ShowMessageView.h"
#import "ZHFounction.h"
#import "ZHDefine.h"

@interface ShowMessageView ()


@property(nonatomic, strong) UILabel *messageLabel;


@end

@implementation ShowMessageView

+ (instancetype)share {
    static ShowMessageView *showMessageView = nil;
    if (showMessageView == nil) {
        showMessageView = [[ShowMessageView alloc] init];
    }

    return showMessageView;
}

- (instancetype)init {
    self = [super initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
    if (self) {
        
        noteView = [[UIView alloc] init];
        noteView.frame = CGRectMake(0, 0, SCREEN_WIDTH, ZHIOS7() + 44);
        noteView.backgroundColor = [UIColor colorWithRed:0.204 green:0.38 blue:0.769 alpha:1];
        [self addSubview:noteView];
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.41];
        [noteView addSubview:self.messageLabel];
    }
    return self;
}


- (void)setTitleLabelText:(NSString *)titleLabelText {
    _titleLabelText = [titleLabelText mutableCopy];
    self.messageLabel.text = titleLabelText;
}

- (void)showInView:(UIView *)view {


    [view addSubview:self];


    noteView.frame = CGRectMake(ZHFrameX(noteView), -ZHFrameHeight(noteView), SCREEN_WIDTH, ZHFrameHeight(noteView));
    [UIView animateWithDuration:0.3 animations:^{

        noteView.frame = CGRectMake(0, 0, SCREEN_WIDTH, ZHFrameHeight(noteView));
    }                completion:^(BOOL finished) {

        [self performSelector:@selector(hide) withObject:nil afterDelay:1];

    }];

}

- (void)hide {
    [self removeFromSuperview];

}

- (UILabel *)messageLabel {
    if (_messageLabel == nil) {
        _messageLabel = [[UILabel alloc] init];
        _messageLabel.frame = CGRectMake(0, ZHIOS7(), SCREEN_WIDTH, 44);
        _messageLabel.numberOfLines = 2;
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.backgroundColor = [UIColor clearColor];
        _messageLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _messageLabel.textColor = [UIColor whiteColor];

    }
    return _messageLabel;
}


@end

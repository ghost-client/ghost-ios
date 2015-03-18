//
// Created by hangzhang on 15/2/27.
// Copyright (c) 2015 物流商户端. All rights reserved.
//

#import "PanDeleteButton.h"
#import "ZHFounction.h"

@interface PanDeleteButton ()
@end

@implementation PanDeleteButton {

    CGRect _lookButtonOldFrame;
    CGFloat _currentMoveWidth;
    
    NSIndexPath *_deleteIndexPath;

    BOOL _canMove;
    UIPanGestureRecognizer *_panGesture;
    UIScrollView *_mainScrollView;

    UISwipeGestureRecognizer *_upSwipeGestureRecognizer;
    UISwipeGestureRecognizer *_downSwipeGestureRecognizer;

    BOOL _isScrollView;
    UIView *_deleteButton;
}


- (void)addPanDelete:(NSIndexPath *)indexPath {
    
    if (_panGesture== nil){
        _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panClick:)];


    }

    _panGesture.delegate=self;

    [self addGestureRecognizer:_panGesture];

    _lookButtonOldFrame = self.frame;
    _deleteIndexPath = indexPath;

    _canMove= YES;

    
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{

    if ([gestureRecognizer.view isKindOfClass:[self class]]){

        if (_isScrollView){
            return NO;
        } else{

            UIPanGestureRecognizer *panGestureRecognizer= (UIPanGestureRecognizer *) gestureRecognizer;

            return [panGestureRecognizer translationInView:self].y == 0;

        }



    } else{


        _isScrollView= YES;
        return YES;

    }

    return YES;

}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{

    _isScrollView= NO;



    return YES;
}



- (void)panClick:(UIPanGestureRecognizer *)panClick {

    //获取当前所在的位置
    float currentX = [panClick translationInView:self].x;



    switch (panClick.state) {


        case UIGestureRecognizerStateChanged: {





            if (currentX > 0) {

                if (ZHFrameX(self) > _lookButtonOldFrame.origin.x) {
                    return;
                }


            } else {

                //如果移动的距离超过了位置 则不继续执行
                if (abs((int) ((int) ZHFrameX(self) - _lookButtonOldFrame.origin.x)) > ZHFrameWidth(self.deleteButton)) {
                    return;
                }


            }
            //获取现在要移动的距离
            float moveLenght = currentX - _currentMoveWidth;

            self.frame = CGRectMake(ZHFrameX(self) + moveLenght, ZHFrameY(self), ZHFrameWidth(self), ZHFrameHeight(self));

            _currentMoveWidth = currentX;


        }
            break;
        case UIGestureRecognizerStateEnded: {


            [self changeLookButtonFrameIsEnd:YES];

        }
            break;

        case UIGestureRecognizerStateBegan: {


            _currentMoveWidth = currentX;


            

        }
            break;
        case UIGestureRecognizerStatePossible:
            break;
        case UIGestureRecognizerStateCancelled:
            break;
        case UIGestureRecognizerStateFailed:
            break;
    };


}
///-----------------------------------------------------
///@name 重新改变按钮的位置
///------------------------------------------------------
/**
* @param isEnd 是否是最后
*/
- (void)changeLookButtonFrameIsEnd:(BOOL)isEnd {

    if (isEnd) {

        if (YES) {

            [self willCannelDeleteCell];
        } else {

            __weak typeof(self) safeSelf = self;

            //设置自动的滚动
            if (abs((int) (ZHFrameX(self) - _lookButtonOldFrame.origin.x)) >= ZHFrameWidth(self.deleteButton) / 2) {


                [UIView animateWithDuration:.3 animations:^{

                    safeSelf.frame = CGRectMake(_lookButtonOldFrame.origin.x - ZHFrameWidth(safeSelf.deleteButton), ZHFrameY(safeSelf), ZHFrameWidth(safeSelf), ZHFrameHeight(safeSelf));


                }];


            } else {

                [self willCannelDeleteCell];

            }

        }

    }


}

///-----------------------------------------------------
///@name 即将要取消删除
///------------------------------------------------------
- (void)willCannelDeleteCell {
    __weak typeof(self) safeSelf = self;
    

    [UIView animateWithDuration:.3 animations:^{

        safeSelf.frame = _lookButtonOldFrame;
    }];

}

- (void)addDeleteButtonInSuperView:(UIView *)superView {

    NSParameterAssert(!self.superview);

    [superView addSubview:self.deleteButton];

}

- (void)setDeleteButtonClickShowMessage:(NSString *)message {

}

- (void)setCannelEdit {
    [self willCannelDeleteCell];

}

- (void)setIsCanEdit:(BOOL)isEdit {
}






- (UIView *)deleteButton {
    if (_deleteButton == nil) {
        _deleteButton = [[UIView alloc] initWithFrame:CGRectMake(ZHFrameNextX(self) - ZHFrameHeight(self), ZHFrameY(self), ZHFrameHeight(self), ZHFrameHeight(self))];

    }
    return _deleteButton;
}


- (void)setIndexPath:(NSIndexPath *)indexPath {

    _deleteIndexPath=indexPath;
}
@end
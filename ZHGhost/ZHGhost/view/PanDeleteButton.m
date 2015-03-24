//
// Created by hangzhang on 15/2/27.
// Copyright (c) 2015 物流商户端. All rights reserved.
//

#import "PanDeleteButton.h"
#import "ZHFounction.h"



@implementation PanDeleteButton {

    CGRect _lookButtonOldFrame;
    CGFloat _currentMoveWidth;
    
    NSIndexPath *_deleteIndexPath;

    BOOL _canMove;
    UIPanGestureRecognizer *_panGesture;
    UIScrollView *_mainScrollView;



    BOOL _isScrollView;
    UIButton *_deleteButton;
    PanDeleteButtonDeleteComplete _deleteComplete;
    PanDeleteButtonDeleteComplete _panClickComplete;
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

        if (abs((int) _currentMoveWidth)< ZHFrameWidth(self.deleteButton)) {

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

- (void)setCannelEdit {
    [self willCannelDeleteCell];

}

- (void)setIsCanEdit:(BOOL)isEdit
{
}

- (void)setDeleteButtonWidth:(float)width {

    self.deleteButton.frame= CGRectMake(ZHFrameWidth(self)-width, ZHFrameY(self.deleteButton), width, ZHFrameHeight(self.deleteButton));

}

- (void)setPanDeleteComplete:(PanDeleteButtonDeleteComplete)complete {

    _deleteComplete=complete;


}

- (void)setPanClickComplete:(PanDeleteButtonDeleteComplete)complete {
    
    _panClickComplete=complete;

    [self addTarget:self action:@selector(panButtonClick:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)panButtonClick:(id)panButtonClick {

    if (_panClickComplete){
        _panClickComplete(_deleteIndexPath);
    }
}


- (UIButton *)deleteButton {
    if (_deleteButton == nil) {
        _deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];

        _deleteButton.frame= CGRectMake(ZHFrameWidth(self)- ZHFrameHeight(self), 0, ZHFrameHeight(self), ZHFrameHeight(self));


        [_deleteButton setBackgroundColor:[UIColor redColor]];

        [_deleteButton setTitle:@"删除" forState:UIControlStateNormal];
        [_deleteButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteButton;
}

- (void)deleteButtonClick {

    ZHAlertView(@"确定要删除吗", self);

}

#pragma mark UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    [alertView dismissWithClickedButtonIndex:buttonIndex animated:YES];

    if (buttonIndex==1){


        if (_deleteComplete){
            _deleteComplete(_deleteIndexPath);
        }

    }

}



- (void)setIndexPath:(NSIndexPath *)indexPath {

    _deleteIndexPath=indexPath;
}
@end
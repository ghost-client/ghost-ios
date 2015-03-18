//
// Created by hangzhang on 15/2/27.
// Copyright (c) 2015 物流商户端. All rights reserved.
//

#import <UIKit/UIKit.h>
///-----------------------------------------------------
///@name 给UIButton统一的加上删除的功能
///------------------------------------------------------
@interface PanDeleteButton : UIButton <UIGestureRecognizerDelegate>

///-----------------------------------------------------
///@name 增加拖动删除事件
///------------------------------------------------------
@property (nonatomic, assign, readonly)CGRect deleteButtonFrame;//获取删除按钮的frame


@property(nonatomic, strong) UIView *deleteButton;

///@name 给按钮设置拖动删除的事件
-(void)addPanDelete:(NSIndexPath *)indexPath;

///@name 设置删除按钮的图片
-(void)setDeleteButtonBackgroundImage:(UIImage *)image;

///@name 本试图添加在父试图之前一定要执行此方法 否则无法执行添加删除按钮的功能
-(void)addDeleteButtonInSuperView:(UIView *)superView;
///@name 设置点击删除按钮提示的文字
-(void)setDeleteButtonClickShowMessage:(NSString *)message;
///@name 设置索引所在的位置
- (void)setIndexPath:(NSIndexPath *)indexPath;
///@name 设置恢复试图位置
-(void)setCannelEdit;
///@name 设置可以不可以编辑
-(void)setIsCanEdit:(BOOL)isEdit;
///-----------------------------------------------------
///@name block complete
///------------------------------------------------------




@end
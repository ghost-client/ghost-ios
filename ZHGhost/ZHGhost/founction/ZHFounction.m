//
//  ZHFounction.m
//  LogisticBsusines
//
//  Created by hangzhang on 14/12/21.
//  Copyright (c) 2014 物流商户端. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHDefine.h"
#import "AFHTTPRequestOperationManager.h"

FOUNDATION_EXPORT CGFloat NumberSize(void){

    int width  =[UIScreen mainScreen].bounds.size.width;


    if(width==320){
        return 320/320.f;
    } else if (width==375){

        return 375/320.f;
    } else if (width==414){
        return 414/320.f;

    }


    return 1.0;





}

#pragma mark -获取UIView试图的坐标

FOUNDATION_EXPORT float ZHFrameX(UIView *view){
    return view.frame.origin.x;
}
FOUNDATION_EXPORT float ZHFrameY(UIView *view){
    return view.frame.origin.y;
}
FOUNDATION_EXPORT float ZHFrameWidth(UIView *view){
    return view.frame.size.width;
}
FOUNDATION_EXPORT float ZHFrameHeight(UIView * view){
    return view.frame.size.height;
}

FOUNDATION_EXPORT float ZHFrameNextX(UIView *view){
    return ZHFrameX(view)+ ZHFrameWidth(view);
}
FOUNDATION_EXPORT float ZHFrameNextY(UIView *view){
    return ZHFrameY(view)+ ZHFrameHeight(view);
}
/**
* 根据手机屏幕的不同加载不同的图片
*/
FOUNDATION_EXPORT NSString *ZHLoadImageName(NSString *name){

    int screenHeight= (int) SCREEN_HEIGHT;

    /**
    * 考虑如果手机的背景是一张图片的话，有以下几种情况
    * 手机是3GS会加载一张原图比如名字叫做image.png大小是320x480
    * 手机是4,4S会加载一张@2x的图片,比如名字叫做image@2x.png，大小是640x960
    * 手机是5,5c,5s会加载一张@2x的图片，比如名字叫做image5@2x.png 大小是640x1136
    * 手机是6会加载一张@2x的图片，比如名字叫做image6@2x.png大小事750x1334
    * 手机是6+会加载一张@3x的图片，比如名字叫做image6_@3x.png 大小是1242x2208
    * 比如现在图片齐全已经存在image.png image@2x.png image5@2x.png image6@2x.png image6_@3x.png
    * 现在我们通过这个方法给之前我们赋值好比这样
    * [UIImage imageNamed:ZHLoadImageName:(@"image")];
    * 这样在不同的屏幕就会加载对应的图片了
    *
    */

    if (screenHeight==480){

        name=name;

    } else if (screenHeight==568){
        name=[NSString stringWithFormat:@"%@5",name];

    } else if (screenHeight==667){
        name=[NSString stringWithFormat:@"%@6",name];
    } else if(screenHeight==736){
        name=[NSString stringWithFormat:@"%@6_",name];

    }

    return name;



}
FOUNDATION_EXPORT float ZHSystemVersion(void){

    return [[UIDevice currentDevice].systemVersion floatValue];

}

FOUNDATION_EXPORT float ZHIOS7(void){


   if (ZHSystemVersion()>6.9){

       return 20.f;
   }

    return 0.f;


}

FOUNDATION_EXPORT void   ZHAddLineView(CGRect rect,UIColor *bgColor,UIView *superView){

    UIView *view= [[UIView alloc] initWithFrame:rect];


    view.backgroundColor=bgColor;

    [superView addSubview:view];

}

FOUNDATION_EXPORT void MoveViewToTop(UIView * view,float moveLenght)
{
    if(moveLenght<=0)
    {
        return;
    }
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.3];
    view.frame=CGRectMake(view.frame.origin.x, view.frame.origin.y-moveLenght, view.frame.size.width, view.frame.size.height);
    [UIView commitAnimations];


}
FOUNDATION_EXPORT void MoveViewToFoot(UIView * view,float moveLenght)
{
    if(moveLenght<=0)
    {
        return;
    }
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.3];
    view.frame=CGRectMake(view.frame.origin.x, view.frame.origin.y+moveLenght, view.frame.size.width, view.frame.size.height);
    [UIView commitAnimations];

}

FOUNDATION_EXPORT CGSize LabelSizeWithFont(NSString *string,UIFont *font,float defaultWidth,BOOL isGetWidth)
{
   float version= ZHSystemVersion();


    CGSize size;

    if (isGetWidth){


        size= CGSizeMake(MAX_HEIGHT_OR_WIDTH, defaultWidth);

    } else{

        size= CGSizeMake(defaultWidth, MAX_HEIGHT_OR_WIDTH);

    }

    if(version<=7.0){


        CGSize size1=[string sizeWithFont:font constrainedToSize:size];


        return size1;



    } else{



        CGRect rect=[string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];

         CGSize  size2= CGSizeMake(rect.size.width, rect.size.height);

        return size2;

    }


    return CGSizeMake(defaultWidth, defaultWidth);


}

FOUNDATION_EXPORT float  ScreenSizeWithSizes(float screen4,float screen5,float screen6,float scrren6plu){


    int screenHeight= (int) SCREEN_HEIGHT;

    if (screenHeight==480){


        return screen4;

    } else if (screenHeight==568){

        return screen5;

    } else if (screenHeight==667){

        return screen6;


    } else if (screenHeight==736){

        return scrren6plu;
    }

    return 0;


}

FOUNDATION_EXPORT BOOL isResponseSuccess(NSDictionary *dictionary){


    return [dictionary[@"isSuccess"] boolValue];

}

FOUNDATION_EXPORT void SetAFHttpManger(AFHTTPRequestOperationManager *manager ,BOOL isSetSessionNo){


    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    if (isSetSessionNo){

        manager.requestSerializer=[AFHTTPRequestSerializer serializer];


       // [manager.requestSerializer setValue:[ZHShareData share].sessionNO forHTTPHeaderField:@"sessionNo"];

    }

}

FOUNDATION_EXPORT NSString *StringFromArrayItem(NSArray *array){
NSString *string=@"";
    for (NSUInteger i = 0; i < array.count; ++i) {

        if (i==0){
            string=[NSString stringWithFormat:@"%@%@",string,array[i]];
        } else{
            string=[NSString stringWithFormat:@"%@,%@",string,array[i]];
        }
    }


    return string;



}


FOUNDATION_EXPORT NSString *smallImageFromBigString(NSString *bigString){

    NSArray *imageTypes=@[@"png",@"jpeg",@"jpg"];

    for(NSString * string in imageTypes){

        NSString *bigImageType=[bigString substringWithRange:NSMakeRange(bigString.length-string.length, string.length)];

        if (![bigImageType isEqualToString:string]){

            break;

        } else{
            NSMutableString *mutableString= [[NSMutableString alloc] initWithString:bigString];

            [mutableString insertString:@"_small" atIndex:bigString.length-string.length-1];

            return mutableString;

        }


    }

    return nil;


}

void ZHAlertView(NSString *title, id target) {

    UIAlertView *alertView= [[UIAlertView alloc] initWithTitle:@"提示" message:title delegate:target cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];

    [alertView show];

}

NSUInteger ZHUINT(float floatNumber) {
    return (NSUInteger) floatNumber;
}

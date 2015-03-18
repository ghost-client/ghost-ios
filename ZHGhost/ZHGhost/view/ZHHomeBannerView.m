//
//  ZHHomeBannerView.m
//  LogisticBsusines
//
//  Created by hangzhang on 14/12/25.
//  Copyright (c) 2014年 物流商户端. All rights reserved.
//

#import "ZHHomeBannerView.h"
#import "ZHFounction.h"
#import "ZHDefine.h"
#define MAX_TIMER_DATE 2

@interface ZHHomeBannerView ()

@property (nonatomic, strong)UIScrollView *bannerScroolView;//轮播的试图

@property (nonatomic, strong)UIPageControl *pageControl;

@end
@implementation ZHHomeBannerView{

   NSMutableArray * ImageViewArray; //存放轮播试图
    
    
    NSTimer *bannerTimer;
    
    int currentBannerIndex;
    
    UIView * lineView;


};

-(void)setFrame:(CGRect)frame{

    
    super.frame=frame;
    
    lineView.frame=CGRectMake(0, ZHFrameHeight(self)-1, ZHFrameWidth(self), 1);

    self.bannerScroolView.frame= CGRectMake(10, 0, frame.size.width-20, frame.size.height-20);

    
    
}

-(instancetype)init{


    
    
    self=[super init];
    
    if(self){
    
        
        lineView=[[UIView alloc]initWithFrame:CGRectMake(0, ZHFrameHeight(self)-1, ZHFrameWidth(self), 1)];
        lineView.backgroundColor=[UIColor colorWithRed:0.827f green:0.827f blue:0.827f alpha:1.00f];

        [self addSubview:lineView];
        ImageViewArray=[NSMutableArray array];

        [self addSubview:self.bannerScroolView];

    [self addSubview:self.pageControl];


    
    }
    
    return self;
}




- (void)setBannerImages:(NSArray *)bannerImages {

    _bannerImages=bannerImages;




    self.pageControl.numberOfPages=bannerImages.count;

    self.pageControl.currentPage=0;

    CGSize size=[self.pageControl sizeForNumberOfPages:bannerImages.count];

    self.pageControl.frame= CGRectMake((ZHFrameWidth(self)-size.width)/2, ZHFrameHeight(self)-20, size.width, 20);

    self.pageControl.currentPageIndicatorTintColor= DEFINE_BLUE_COLOR;
    self.pageControl.pageIndicatorTintColor=[UIColor grayColor];

     [self addBanberImage];


}

-(void)addBanberImage{


    //移除之前的试图


    for(UIImageView *imageView in ImageViewArray){

        [imageView removeFromSuperview];

    }
    for (int i = 0; i < self.bannerImages.count; ++i) {

        UIImageView *imageView= [[UIImageView alloc] init];

        
        imageView.frame=CGRectMake(0+ZHFrameWidth(self.bannerScroolView)*i, 0, ZHFrameWidth(self.bannerScroolView), ZHFrameHeight(self.bannerScroolView));
        
        
        imageView.image=self.bannerImages[i];
        
        
        [self.bannerScroolView addSubview:imageView];
        [ImageViewArray addObject:imageView];


    }

    self.bannerScroolView.contentSize=CGSizeMake(ZHFrameWidth(self.bannerScroolView)*self.bannerImages.count, ZHFrameHeight(self.bannerScroolView));
    
    

    
    if(self.bannerImages.count>1){
    
    
        
        [self startBannerTime];
    }
    
    
    








}
-(void)startBannerTime{
    
    if(bannerTimer==nil){
    
    
         bannerTimer= [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeInterval:MAX_TIMER_DATE sinceDate:[NSDate date]] interval:MAX_TIMER_DATE target:self selector:@selector(bannerTimeAction) userInfo:nil repeats:YES];

         [[NSRunLoop mainRunLoop] addTimer:bannerTimer forMode:NSDefaultRunLoopMode];
    }



   // [bannerTimer fire];
    
    
    
    
    
    
    
    
    


    
}
-(void)bannerTimeAction{
    

     currentBannerIndex++;

     if (currentBannerIndex==self.bannerImages.count){



         currentBannerIndex=0;
     }

    [self.bannerScroolView scrollRectToVisible:CGRectMake(ZHFrameWidth(self.bannerScroolView)*currentBannerIndex, 0, ZHFrameWidth(self.bannerScroolView), ZHFrameHeight(self.bannerScroolView)) animated:YES];
    
    


    self.pageControl.currentPage=currentBannerIndex;
    
    


}

-(void)swipeGestureRecognizerClick:(UISwipeGestureRecognizer*)swipeGestureRecognizer{


    [self stopBannerTime];


    if (swipeGestureRecognizer.direction==UISwipeGestureRecognizerDirectionLeft){


        [self gotoNextBanner:YES];


    } else if (swipeGestureRecognizer.direction==UISwipeGestureRecognizerDirectionRight){

        [self gotoNextBanner:NO];




    }

}

-(void)gotoNextBanner:(BOOL)isNext{


    if (isNext){

        currentBannerIndex++;
    } else{

        currentBannerIndex--;
    }
    if (currentBannerIndex==self.bannerImages.count){
        currentBannerIndex=0;
    } else if (currentBannerIndex<0){

        currentBannerIndex=self.bannerImages.count-1;

    }
  [self.bannerScroolView scrollRectToVisible:CGRectMake(ZHFrameWidth(self.bannerScroolView)*currentBannerIndex, 0, ZHFrameWidth(self.bannerScroolView), ZHFrameHeight(self.bannerScroolView)) animated:YES];




    self.pageControl.currentPage=currentBannerIndex;


    [self stopBannerTime];


}

-(void)stopBannerTime{


    [bannerTimer invalidate];
    
}
- (UIScrollView *)bannerScroolView {

    if(_bannerScroolView== nil){

        _bannerScroolView= [[UIScrollView alloc] init];

        _bannerScroolView.frame= CGRectMake(10, 0, ZHFrameWidth(self)-20, ZHFrameHeight(self)-20);

        _bannerScroolView.delegate=self;
        _bannerScroolView.pagingEnabled= YES;

        UISwipeGestureRecognizer *swipeGestureRecognizer= [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestureRecognizerClick:)];
        swipeGestureRecognizer.direction= UISwipeGestureRecognizerDirectionRight|UISwipeGestureRecognizerDirectionLeft;


        [_bannerScroolView addGestureRecognizer:swipeGestureRecognizer];



    }

    return _bannerScroolView;
}
- (UIPageControl *)pageControl {

    if (_pageControl== nil){

        _pageControl= [[UIPageControl alloc] init];


    }
    return _pageControl;
}


@end

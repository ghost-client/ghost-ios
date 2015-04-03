//
//  SelectTypeView.m
//  LogisticBsusines
//
//  Created by hangzhang on 15/1/6.
//  Copyright (c) 2015 物流商户端. All rights reserved.
//

#import <JSONKit/JSONKit.h>
#import "SelectTypeView.h"
#import "ZHFounction.h"
#import "ZHDefine.h"


#define SELECT_PICKER_VIEW_DEFAULT_HEIGHT 216

@interface SelectTypeView () <UIPickerViewDataSource, UIPickerViewDelegate>

@property(nonatomic, strong) UIPickerView *pickerView;

@property(nonatomic, strong) UIButton *dismissButton;;

@end

@implementation SelectTypeView {


    UIView *selectView;

    NSString *currentSelectString;

    NSArray *adressTypeWidths;

    BOOL _isTimeType;

    NSMutableArray *_sectionArray;

    NSMutableArray *_rowsArray;
    int _timeDay;
}


+ (instancetype)share {

    static SelectTypeView *selectTypeView = nil;
    if (selectTypeView == nil) {
        selectTypeView = [[SelectTypeView alloc] init];



    }

    [selectTypeView  initParment];


    return selectTypeView;
}

-(void)initParment {

    [self setSelectTimeType:NO];
    _sectionArray=[NSMutableArray array];

    _rowsArray=[NSMutableArray array];
}

- (instancetype)init {

    self = [super init];
    if (self) {

        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.41];

        self.frame = [UIApplication sharedApplication].keyWindow.bounds;


        selectView = [[UIView alloc] init];
        selectView.frame = CGRectMake(0, ZHFrameHeight(self) - SELECT_PICKER_VIEW_DEFAULT_HEIGHT - 42, ZHFrameWidth(self), SELECT_PICKER_VIEW_DEFAULT_HEIGHT + 42);

        selectView.backgroundColor = [UIColor colorWithRed:0.976f green:0.976f blue:0.976f alpha:1.00f];

        [selectView addSubview:self.dismissButton];

        [selectView addSubview:self.pickerView];

        [self addSubview:selectView];

        ZHAddLineView(CGRectMake(0, 0, SCREEN_WIDTH, 1), [UIColor colorWithRed:0.600f green:0.600f blue:0.600f alpha:1.00f], selectView);


        ZHAddLineView(CGRectMake(0, 43, SCREEN_WIDTH, 1), [UIColor colorWithRed:0.600f green:0.600f blue:0.600f alpha:1.00f], selectView);

        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];

        [self addGestureRecognizer:tapGestureRecognizer];


    }
    return self;
}

- (void)show:(UIView *)view {



    selectView.frame = CGRectMake(0, ZHFrameHeight(self), SCREEN_WIDTH, SELECT_PICKER_VIEW_DEFAULT_HEIGHT);


    [view addSubview:self];
    __weak typeof(self) safeSelf = self;

    [UIView animateWithDuration:.3 animations:^{

        selectView.frame = CGRectMake(0, ZHFrameHeight(self) - ZHFrameHeight(selectView), SCREEN_WIDTH, SELECT_PICKER_VIEW_DEFAULT_HEIGHT);


    }completion:^(BOOL complete){

        if (complete){
            [safeSelf autoScroolViewToCurrentTime];
        }

    }];





}

- (void)autoScroolViewToCurrentTime {
    if (_isTimeType){


        if (_timeDay){

            [self.pickerView selectRow:_timeDay inComponent:0 animated:YES];

            _sectionArray[0]=@(_timeDay);
        }

        NSIndexPath *indexPath=[self timeTypeIndexPath];
        if (_sectionArray.count>indexPath.section){
            NSArray *array=_rowsArray[1];
            if (array.count>indexPath.row){
                [self.pickerView selectRow:indexPath.row inComponent:indexPath.section animated:YES];

                _sectionArray[indexPath.section]=@(indexPath.row);

            }
        }




    }
}

-(NSIndexPath *)timeTypeIndexPath{


    int row=0;
    NSDate *date=[NSDate date];
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh_CN"]];
    [dateFormatter setDateFormat:@"HH"];
    int hh =[[dateFormatter stringFromDate:date] integerValue];

    [dateFormatter setDateFormat:@"mm"];

    int mm=[[dateFormatter stringFromDate:date] integerValue]+30;

    if (mm>60){
        hh++;
    }

    if (hh >=0 && hh <6){
        row=0;
    } else if (hh >=6 && hh <8){
        row=1;
    }else if (hh >=8 && hh <10){
        row=2;
    }else if (hh >=10 && hh <12){
        row=3;
    }else if (hh >=12 && hh <14){
        row=4;
    }else if (hh >=14 && hh <16){
        row=5;
    }else if (hh >=16 && hh <18){
        row=6;
    }else if (hh >=18 && hh <24){
        row=7;
    }


    return [NSIndexPath indexPathForRow:row inSection:1];
}
- (void)hide {

    [UIView animateWithDuration:0.3 animations:^{
        selectView.frame = CGRectMake(0, ZHFrameHeight(self), SCREEN_WIDTH, SELECT_PICKER_VIEW_DEFAULT_HEIGHT);


    }                completion:^(BOOL finished) {

        [self removeFromSuperview];
    }];


}

- (UIButton *)dismissButton {

    if (_dismissButton == nil) {

        _dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];

        _dismissButton.frame = CGRectMake(ZHFrameWidth(selectView) - 80, 1, 80, 40);

        [_dismissButton setTitle:@"确定" forState:UIControlStateNormal];

        _dismissButton.layer.borderColor=[UIColor colorWithRed:0.878 green:0.875 blue:0.843 alpha:1].CGColor;
        _dismissButton.layer.borderWidth=1;
        _dismissButton.layer.masksToBounds= YES;
        _dismissButton.layer.cornerRadius=20;

        [_dismissButton addTarget:self action:@selector(dismissButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _dismissButton;
}

- (void)dismissButtonClick {


    if (_isTimeType) {


        NSIndexPath *indexPath = [self timeTypeIndexPath];

        NSParameterAssert(_sectionArray.count > 0);

        int section = [_sectionArray[0] integerValue];

        if (section >= indexPath.section) {

            if (_sectionArray.count > 1) {
                int row = [_sectionArray[1] intValue];
                if (row < indexPath.row) {
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"预约时间必须大约当前的时间" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];

                    [alertView show];

                    return;
                }

            }

        }

    }



    [self hide];

    NSString *string=@"";

    for (int i = 0; i < _sectionArray.count; ++i) {


        int row=[self.pickerView selectedRowInComponent:i];

        string=[NSString stringWithFormat:@"%@%@",string,[self stringFromPickerView:self.pickerView titleForRow:row forComponent:i]];

    }

    currentSelectString=string;


    if (self.didSelectRowWithComponmentBlock) {

        self.didSelectRowWithComponmentBlock(currentSelectString);
    }


}


- (UIPickerView *)pickerView {

    if (_pickerView == nil) {

        _pickerView = [[UIPickerView alloc] init];

        _pickerView.frame = CGRectMake(0, 42, SCREEN_WIDTH, SELECT_PICKER_VIEW_DEFAULT_HEIGHT);

        _pickerView.dataSource = self;

        _pickerView.delegate = self;

        _pickerView.showsSelectionIndicator = YES;

    }
    return _pickerView;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {

    int sections = [self.dataDictionary[DATA_MODEL_SECTIONS_KEY] intValue];


    return sections;


}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {

    if (_rowsArray.count>component){
         NSArray *array=_rowsArray[component];

    return array.count;
    }

    return 0;


}



// returns width of column and height of row for each component.
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {

    int sections = [self.dataDictionary[DATA_MODEL_SECTIONS_KEY] intValue];

    if (adressTypeWidths.count==3){


        return [adressTypeWidths[component] floatValue];

    }


    return (CGFloat) (ZHFrameWidth(self.pickerView) / sections);

}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {

    return 44;

}


- (NSString *)stringFromPickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {

    NSArray *array=_rowsArray[component];

    NSDictionary *dictionary=array[row];

    return dictionary[DATA_MODEL_TITLE_KEY];


}

- (void)setIsSelectAdress:(BOOL)isSelectAdress {
    _isSelectAdress = isSelectAdress;
    
    NSString *string = [[NSString alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"geojson"] encoding:NSUTF8StringEncoding error:nil];
    
    NSArray *array = [string objectFromJSONString];

    adressDictionary = @{

            @"sections" : @3,
            @"array" : array

    };


    adressTypeWidths=@[@(78* NumberSize()),@(97* NumberSize()),@(136* NumberSize())];


    self.dataDictionary = adressDictionary;





}

- (void)setSelectTimeType:(BOOL)timeType {

    _isTimeType= timeType;

}


- (void)setDataDictionary:(NSDictionary *)dataDictionary {
    _dataDictionary = dataDictionary;

    int sections = [dataDictionary[DATA_MODEL_SECTIONS_KEY] intValue];
    [_sectionArray removeAllObjects];

    for (int j = 0; j < sections; ++j) {

        [_sectionArray addObject:@(0)];

        [_rowsArray addObject:[self arrayWithIndex:j]];


    }





    NSString *string = @"";

    for (int i = 0; i < sections; ++i) {

        int selectRow = [self.pickerView selectedRowInComponent:i];

        string = [NSString stringWithFormat:@"%@%@", string, [self stringFromPickerView:self.pickerView titleForRow:selectRow forComponent:i]];

    }

    currentSelectString = string;

    [self.pickerView reloadAllComponents];


}

-(NSArray *)arrayWithIndex:(NSInteger)index{
    NSArray *array= nil;

    if (_rowsArray.count>index-1){

        NSArray *array1=_rowsArray[index-1];

        int rowIndex= [_sectionArray[index-1] integerValue];

        NSDictionary *dictionary=array1[rowIndex];

        array=dictionary[DATA_MODEL_ARRAY_KEY];


    } else{

        array=self.dataDictionary[DATA_MODEL_ARRAY_KEY];
    }

    NSParameterAssert(array);

    return array;




}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {


    if (_isTimeType){
        NSIndexPath *indexPath=[self timeTypeIndexPath];
        if (indexPath.section>=component){
            if (indexPath.row>row){

                [pickerView selectRow:indexPath.row inComponent:indexPath.section  animated:YES];

                _sectionArray[indexPath.section]=@(indexPath.row);




                return;

            }
        }
    }

    _sectionArray[(NSUInteger) component] = @(row);

    for (int j = 0; j < _sectionArray.count; ++j) {
        _rowsArray[j] = [self arrayWithIndex:j];
    }


    [self.pickerView reloadAllComponents];

    int sections = [self.dataDictionary[DATA_MODEL_SECTIONS_KEY] intValue];


    NSString *string = @"";

    for (int i = 0; i < sections; ++i) {

        int selectRow = [pickerView selectedRowInComponent:i];

        string = [NSString stringWithFormat:@"%@%@", string, [self stringFromPickerView:pickerView titleForRow:selectRow forComponent:i]];

    }

    currentSelectString = string;


}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view; {

    int sections = [self.dataDictionary[DATA_MODEL_SECTIONS_KEY] intValue];

    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor clearColor];


    float labelWidth= [adressTypeWidths[(NSUInteger) component] floatValue];

    float labelY=2;

    for (int i = 0; i < component; ++i) {

        labelY=labelY+[adressTypeWidths[(NSUInteger) i] floatValue]+2*i;

    }


    label.frame = CGRectMake(labelY, 0, labelWidth, 44);

    label.font = [UIFont systemFontOfSize:13];

    label.numberOfLines=2;

    label.lineBreakMode=NSLineBreakByTruncatingTail;

    label.textAlignment = NSTextAlignmentCenter;

    label.textColor = [UIColor blackColor];

    label.text = [self stringFromPickerView:pickerView titleForRow:row forComponent:component];

    label.backgroundColor = [UIColor clearColor];

    return label;


}


- (void)setCurrentDayNumber:(int)i {

    _timeDay=i;

}
@end

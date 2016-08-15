//
//  ViewController.m
//  dataPicker
//
//  Created by 曾鹏浩 on 16/4/1.
//  Copyright © 2016年 曾鹏浩. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //1.创建时间选择器
    UIDatePicker *datePicker=[[UIDatePicker alloc] init];
    //2.设置只显示日期
    datePicker.datePickerMode=UIDatePickerModeDate;
    //3.设置日期为中文
    datePicker.locale=[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    
    [datePicker addTarget:self action:@selector(test:) forControlEvents:UIControlEventValueChanged];
    
    self.inputTextField.inputView=datePicker;
    
    //2.创建工具条
    UIToolbar *toolbar=[[UIToolbar alloc] init];
    toolbar.backgroundColor=[UIColor redColor];
    toolbar.frame=CGRectMake(0, 0, 320, 44);
    //给工具条添加按钮
    UIBarButtonItem *item0=[[UIBarButtonItem alloc] initWithTitle:@"上一个" style:UIBarButtonItemStylePlain target:self action:@selector(previousBtnClick)];
    UIBarButtonItem *item3=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *item1=[[UIBarButtonItem alloc] initWithTitle:@"下一个" style:UIBarButtonItemStylePlain target:self action:@selector(previousBtnClick)];
    UIBarButtonItem *item2=[[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(previousBtnClick)];
    
    toolbar.items=@[item0,item1,item3,item2];
    
    //inputAccessoryView辅助视图
    self.inputTextField.inputAccessoryView=toolbar;
    
    
    /*
    //1.创建View
    UIView *view=[[UIView alloc] init];
    view.backgroundColor=[UIColor blueColor];
    view.frame=CGRectMake(0, 480-162-44, 320, 162+44);
    
    //2.创建工具条
    UIToolbar *toolbar=[[UIToolbar alloc] init];
    toolbar.backgroundColor=[UIColor redColor];
    toolbar.frame=CGRectMake(0, 0, 320, 44);
    [view addSubview:toolbar];
    //给工具条添加按钮
    UIBarButtonItem *item0=[[UIBarButtonItem alloc] initWithTitle:@"上一个" style:UIBarButtonItemStylePlain target:self action:@selector(previousBtnClick)];
    UIBarButtonItem *item3=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *item1=[[UIBarButtonItem alloc] initWithTitle:@"下一个" style:UIBarButtonItemStylePlain target:self action:@selector(previousBtnClick)];
    UIBarButtonItem *item2=[[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(previousBtnClick)];
    
    toolbar.items=@[item0,item1,item3,item2];

    //3.创建时间选择器
    UIDatePicker *datePicker=[[UIDatePicker alloc] init];
    //设置只显示日期
    datePicker.datePickerMode=UIDatePickerModeDate;
    //设置日期为中文
    datePicker.locale=[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    datePicker.frame=CGRectMake(0, 44, 320, 162);
    [view addSubview:datePicker];
    
    self.inputTextField.inputView=view;
     */
    
}

//把选择的时间传到文本框里
-(void)test:(UIDatePicker *)picker
{
    NSDate *selectDate=picker.date;
    NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
    formatter.dateFormat=@"yyy-MM-dd";
    NSString *stringDate=[formatter stringFromDate:selectDate];
    self.inputTextField.text=stringDate;
}


-(void)previousBtnClick
{
    NSLog(@"...");
}

@end

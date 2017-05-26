//
//  ViewController.m
//  RunTime
//
//  Created by 包磊 on 17/4/6.
//  Copyright © 2017年 baolei. All rights reserved.
//

#import "ViewController.h"
#import "objc/runtime.h"
#import "objc/message.h"
@interface ViewController ()
{

    NSInteger num;

}

@property (nonatomic ,strong) UILabel * label;
@property NSString * str;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self TestRunTime];
    
}
-(void)TestRunTime{
   
    // 获得类名
    id classObject = objc_getClass([@"ViewController" UTF8String]);
    
    unsigned int count = 0;
    unsigned int icount = 0;
    
    //获得属性列表->根据类名获取属性列表和属性的个数->获得仅仅是property声明的属性
    objc_property_t * properties = class_copyPropertyList(classObject, &count);
    
    //获得属性列表包括@interface大括号里面的和property声明的的变量
    Ivar * ivars = class_copyIvarList(classObject, &icount);
    
    for (int i = 0; i< count; i++) {
        
        objc_property_t property = properties[i];
        
        NSString * propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        
        /*
         
         2017-04-06 14:34:34.791 RunTime[15636:3881551] 属性名:label
         2017-04-06 14:34:34.791 RunTime[15636:3881551] 属性名:str
         */
        
    }
    
    
    for (int i = 0; i < icount ; i++) {
        
        
        NSString * ivarName = [NSString stringWithCString:ivar_getName(ivars[i]) encoding:NSUTF8StringEncoding];
        
       /*
        
        2017-04-06 14:37:27.808 RunTime[15668:3893763] 属性名:num
        2017-04-06 14:37:27.809 RunTime[15668:3893763] 属性名:_label
        2017-04-06 14:37:27.809 RunTime[15668:3893763] 属性名:_str
        */
    }


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

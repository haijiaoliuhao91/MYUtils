//
//  main.m
//  MYSampleCode
//
//  Created by sunjinshuai on 2017/11/15.
//  Copyright © 2017年 MYSampleCode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "TestClass+AssociatedObject.h"
#import "TestClass.h"
#import "Runtime.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        NSString *className = [Runtime fetchClassName:[TestClass class]];
        NSLog(@"测试类的类名为：%@\n", className);
        
        NSArray *ivarList = [Runtime fetchIvarList:[TestClass class]];
        NSLog(@"\n获取TestClass的成员变量列表:%@", ivarList);
        
        NSArray *propertyList = [Runtime fetchPropertyList:[TestClass class]];
        NSLog(@"\n获取TestClass的属性列表:%@", propertyList);
        
        NSArray *methodList = [Runtime fetchMethodList:[TestClass class]];
        NSLog(@"\n获取TestClass的方法列表：%@", methodList);
        
        NSArray *protocolList = [Runtime fetchProtocolList:[TestClass class]];
        NSLog(@"\n获取TestClass的协议列表：%@", protocolList);
        
        TestClass *testClass = [[TestClass alloc] init];
        testClass.dynamicAddProperty = @"我是动态添加的属性";
        NSLog(@"%@", testClass.dynamicAddProperty);
        
        // 方法交换
        [testClass method1];
        
        // 测试消息转发
        [testClass performSelector:@selector(method3:) withObject:@"测试消息转发"];
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

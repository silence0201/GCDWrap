# GCDWrap
![Language](https://img.shields.io/badge/language-objc-orange.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)  

GCDWrap:一个基于`Objective-C`语言`GCD`的简单封装

### 导入
将项目中`GCDWrap`文件夹拖到项目里  

或者使用`Pod`安装

	pod 'GCDWrap', '~> 0.1.0'	

### 使用
1. 导入头文件

	```objective-c
	#import "GCDWrap.h"
	```
	
2. 根据对应信息,使用相应的类,对应关系如下

	`SIQueue`         ---> 队列  
	`SIGroup`         ---> 队列组  
	`SIMacro`         ---> 宏  
	`SISemaphore`     ---> 信号量  
	`SITimer`         ---> 定时器
	
### 使用
查看文件[GCDWrapTest](GCDWrapTest/GCDWrapTest.m)

## GCDWrap
GCDWrap is available under the MIT license. See the LICENSE file for more info.
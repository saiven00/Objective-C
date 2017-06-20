//
//  XACommonDefine.h
//  XAHealth
//
//  Created by 刘少毅 on 2017/6/20.
//  Copyright © 2017年 XingYang. All rights reserved.
//

#ifndef XACommonDefine_h
#define XACommonDefine_h

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kTabbarHeight 49
#define kNavHeight 64

#define XAColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define XARGBColor(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// 随机色
#define XARandomColor XAColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#endif /* XACommonDefine_h */

//
//  QDCommen.h
//  QiDianDemo
//
//  Created by iShareme on 15/10/13.
//  Copyright © 2015年 iShareme. All rights reserved.
//

#ifndef QDCommen_h
#define QDCommen_h

#define QDColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define QDColorWithAlpha(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]


#ifdef DEBUG
#define QDLog(...) NSLog(__VA_ARGS__)
#else
#define QDLog(...)
#endif


#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

#define QDSCREENW [UIScreen mainScreen].bounds.size.width
#define QDSCREENH [UIScreen mainScreen].bounds.size.height

//拉伸尺寸(根据5s的屏幕高度)
#define QDSTRETCHEDSIZEH(s) [UIScreen mainScreen].bounds.size.height *((s)/568.0)
//拉伸尺寸(根据5s的屏幕宽度)
#define QDSTRETCHEDSIZEW(s) [UIScreen mainScreen].bounds.size.width *((s)/320.0)







//字体
#define QDFONT10 [UIFont systemFontOfSize:10]
#define QDFONT11 [UIFont systemFontOfSize:11]
#define QDFONT12 [UIFont systemFontOfSize:12]
#define QDFONT13 [UIFont systemFontOfSize:13]
#define QDFONT14 [UIFont systemFontOfSize:14]
#define QDFONT15 [UIFont systemFontOfSize:15]
#define QDFONT16 [UIFont systemFontOfSize:16]
#define QDFONT17 [UIFont systemFontOfSize:17]
#define QDFONT20 [UIFont systemFontOfSize:20]
//表单默认字体
#define QD_Default_Font QDFONT14

#endif /* QDCommen_h */

//
//  UIScrollView+Empty.h
//  YeShengApp
//
//  Created by 段庆烨 on 2019/7/31.
//  Copyright © 2019 Gioures. All rights reserved.
//
typedef void(^TapBlock)(void);
#import <UIKit/UIKit.h>
#import "UIScrollView+EmptyDataSet.h"


@interface EmptyView : NSObject<DZNEmptyDataSetSource , DZNEmptyDataSetDelegate>

@property (nonatomic, strong)  UIImage * img;
@property (nonatomic, assign)  BOOL  allowShow;
@property (nonatomic, assign)  CGFloat  verticalOffset;
@property (nonatomic, copy)  TapBlock  tap;
-(instancetype)initWithImage:(UIImage *)img verticalOffSet:(CGFloat )vertical tap:(TapBlock)tap;
@end


@interface UIScrollView (Empty)
@property (nonatomic, strong)  EmptyView * empty;
@end



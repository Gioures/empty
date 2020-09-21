//
//  UIScrollView+Empty.m
//  YeShengApp
//
//  Created by 段庆烨 on 2019/7/31.
//  Copyright © 2019 Gioures. All rights reserved.
//

#import "UIScrollView+Empty.h"
#import <objc/runtime.h>

@implementation EmptyView


-(instancetype)initWithImage:(UIImage *)img verticalOffSet:(CGFloat )vertical tap:(TapBlock)tap{
    if (self == [super init]) {
        self.img = img;
        self.verticalOffset = vertical;
        self.tap = tap;
    }
    return self;
}

-(CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView{
    if (self.verticalOffset) {
         return self.verticalOffset;
    }else{
        return 0;
    }
}

-(UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
    if (self.img) {
        return self.img;
    }else{
        return [UIImage imageNamed:@"plachehould3"];
    }
}

-(BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView{
    return self.allowShow;
}

-(void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view{
    if (self.tap) {
        self.tap();
    }
}
@end



@implementation UIScrollView (Empty)


- (void)setEmpty:(EmptyView *)empty{
    self.emptyDataSetDelegate = empty;
    self.emptyDataSetSource = empty;
    objc_setAssociatedObject(self, @selector(empty), empty, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(EmptyView *)empty{
    return objc_getAssociatedObject(self, @selector(empty));
}


@end

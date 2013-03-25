//
//  UIView+_swizzle.m
//  weatherApp
//
//  Created by BKTurley on 3/25/13.
//  Copyright (c) 2013 BKTurley. All rights reserved.
//

#import "UIView+swizzle.h"
#import "JRSwizzle.h"

@implementation UIView (swizzle)
+ (void) swizzle
{
	[UIView jr_swizzleMethod:@selector(initWithFrame:) withMethod:@selector(initWithFrame_swizzle:) error:nil];
}

- (id) initWithFrame_swizzle:(CGRect) frame
{
        //swizzle to origional implementation
	[UIView jr_swizzleMethod:@selector(initWithFrame:) withMethod:@selector(initWithFrame_swizzle:) error:nil];
    
        //get a default UIView
	id result = [self initWithFrame:frame];
    
        //add our label subview
    UILabel* fooLabel = [[UILabel alloc] initWithFrame:CGRectZero];

    fooLabel.text = [[result class] description];
    fooLabel.font = [UIFont systemFontOfSize:9];
    fooLabel.alpha = .5;
    fooLabel.backgroundColor = [UIColor clearColor];
    [fooLabel sizeToFit];
    [result addSubview:fooLabel];
    
    
        //swizzle back to overridden implementaion
	[UIView jr_swizzleMethod:@selector(initWithFrame:) withMethod:@selector(initWithFrame_swizzle:) error:nil];

    
        //[result setBackgroundColor:[UIColor blueColor]];
    
	return result;
}

@end

//
//  main.m
//  weatherApp
//
//  Created by BKTurley on 1/11/13.
//  Copyright (c) 2013 BKTurley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+swizzle.h"
#import "WAAppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        #ifdef LAYOUT
        [UIView swizzle];
        #endif

        return UIApplicationMain(argc, argv, nil, NSStringFromClass([WAAppDelegate class]));
    }
}

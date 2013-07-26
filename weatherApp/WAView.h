//
//  WAView.h
//  weatherApp
//
//  Created by BKTurley on 2/5/13.
//  Copyright (c) 2013 BKTurley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WARootViewController.h"

#define fetchButtonTappedNote @"fetchButtonTappedNote"


@interface WAView : UIView
@property UILabel *lowtemplabel;
@property UILabel *curtemplabel;
@property UILabel *hightemplabel;
- (id)initWithFrame:(CGRect)frame andViewController:(WARootViewController*)VC;

@end

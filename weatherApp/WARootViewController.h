//
//  WARootViewController.h
//  weatherApp
//
//  Created by BKTurley on 1/13/13.
//  Copyright (c) 2013 BKTurley. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kWeatherRequestReadyNotification @"kWeatherRequestReadyNotification"

#define viewShouldUpdateNote @"viewShouldUpdateNote"
#define WADao_fetchWeathDataNote @"WADao_fetchWeathDataNote"


@interface WARootViewController : UIViewController

-(void)fetchButtonTapped;
-(void) updateView;


@end

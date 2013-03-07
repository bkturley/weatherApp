//
//  WAModel.h
//  weatherApp
//
//  Created by BKTurley on 2/5/13.
//  Copyright (c) 2013 BKTurley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WADao.h"

#define modelRequestReadyNote @"modelRequestReadyNote"

@interface WAModel : NSObject
@property float lowtemp;
@property NSDecimalNumber* hightemp;
@property NSDecimalNumber* avgtemp;
-(void) updateWeatherFromServer;
@end

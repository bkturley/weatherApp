//
//  WADao.h
//  weatherApp
//
//  Created by BKTurley on 2/5/13.
//  Copyright (c) 2013 BKTurley. All rights reserved.
//

#import <Foundation/Foundation.h>

#define doaRequestReadyNote @"doaRequestReadyNote"

@interface WADao : NSObject
@property NSDecimalNumber* lowtemp;
@property NSDecimalNumber* hightemp;
@property NSDecimalNumber* avgtemp;

-(void)refreshDataFromServer;
@end

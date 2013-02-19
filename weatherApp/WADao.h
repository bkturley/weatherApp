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
@property NSString* lowtemp;
@property NSString* hightemp;
@property NSString* avgtemp;

-(void)refreshDataFromServer;
@end

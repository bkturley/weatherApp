//
//  WAModel.m
//  weatherApp
//
//  Created by BKTurley on 2/5/13.
//  Copyright (c) 2013 BKTurley. All rights reserved.
//

#import "WAModel.h"
#import "WADao.h"

@interface WAModel()
@property WADao* dao;
@end

@implementation WAModel

-(id)init{
    self = [super init];
    if(self){
            self.dao = [[WADao alloc] init];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fetchWeatherData) name:doaRequestReadyNote object:nil];
    }
    return  self;
}
-(void) fetchWeatherData{
    self.lowtemp = [self.dao.lowtemp floatValue];
    NSLog(@"self.dao.lowtemp");
    NSLog(self.dao.lowtemp);
    NSLog([NSString stringWithFormat:@"%@",self.dao.lowtemp]); //YES!!!!
    self.hightemp = [self.dao.hightemp floatValue];
    self.avgtemp = [self.dao.avgtemp floatValue];
    [[NSNotificationCenter defaultCenter] postNotificationName:modelRequestReadyNote object:nil];
}
-(void) updateWeatherFromServer{
    [self.dao refreshDataFromServer];
}




@end

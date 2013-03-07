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
@property (nonatomic, strong) WADao* dao;
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
    NSDecimal *kelvinOffset = (__bridge NSDecimal *)([NSDecimalNumber decimalNumberWithString:@"273.15"]);
//    self.lowtemp = [self.dao.lowtemp decimalNumberBySubtracting:kelvinOffset];
    self.lowtemp = [self.dao.lowtemp floatValue];
//    self.hightemp = [self.dao.hightemp decimalNumberBySubtracting:kelvinOffset];
    self.hightemp = self.dao.hightemp;
//    self.avgtemp = [self.dao.avgtemp decimalNumberBySubtracting:kelvinOffset];
    self.avgtemp = self.dao.avgtemp;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:modelRequestReadyNote object:nil];
}
-(void) updateWeatherFromServer{
    [self.dao refreshDataFromServer];
}

@end

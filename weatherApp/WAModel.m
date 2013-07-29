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
@property (nonatomic, strong) WARootViewController* VC;
@property (nonatomic, strong) WADao* dao;
@end

@implementation WAModel

-(id)initWithVC:(WARootViewController*)VC{
    self = [super init];
    if(self){
        self.VC = VC;
        self.dao = [[WADao alloc] initWithModel:self];
    
    }
    return  self;
}

-(void) fetchWeatherData{
    
    self.lowtemp = self.dao.lowtemp;

    self.hightemp = self.dao.hightemp;

    self.avgtemp = self.dao.avgtemp;
    
    //TODO tell VC to update view
    
    [self.VC updateView];
    
}

-(void) updateWeatherFromServer{
    
    [self.dao refreshDataFromServer];

}


@end

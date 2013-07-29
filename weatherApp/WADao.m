//
//  WADao.m
//  weatherApp
//
//  Created by BKTurley on 2/5/13.
//  Copyright (c) 2013 BKTurley. All rights reserved.
//

#import "WADao.h"
#import "WADefines.h"
#import "WARootViewController.h"
#import "WAModel.h"

@interface WADao()
@property (nonatomic, strong) WAModel* model;
@end

@implementation WADao

-(id)initWithModel:(WAModel*)model{
    self = [super init];
    if(self){
        
        self.model = model;
        
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshDataFromServer) name:WADao_fetchWeathDataNote object:nil];
    }
    return self;
}

-(void)refreshDataFromServer{
        // kick off the server request on a separate thread
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
            // fetch JSON data
        NSData* data = [NSData dataWithContentsOfURL:kLatestWeatherURL];
        
            //consume the JSON data on the main thread
        [self performSelectorOnMainThread:@selector(readJsonResponseAndSaveToProperties:)
                               withObject:data waitUntilDone:YES];
    });
}


- (void)readJsonResponseAndSaveToProperties:(NSData *)responseData {
    
    
    //parse out the json data
    if (responseData == nil){ //if no network connection
        [[NSNotificationCenter defaultCenter] postNotificationName:kFailedFetchNotification object:nil];
        return;
    }
    
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData
                          options:kNilOptions
                          error:&error];
    
    //log entire json response
    NSArray* list = [json objectForKey:@"list"];
    //NSLog(@"list: %@", list);
    
    //save low, high and avg temps to properties
    self.lowtemp = [[[[json objectForKey:@"list"]valueForKey:@"main"]valueForKey:@"temp_min"] objectAtIndex:0];
    
    self.avgtemp = [[[[json objectForKey:@"list"]valueForKey:@"main"]valueForKey:@"temp"] objectAtIndex:0];
    
    self.hightemp = [[[[json objectForKey:@"list"]valueForKey:@"main"]valueForKey:@"temp_max"] objectAtIndex:0];
    
    [self.model fetchWeatherData];
    
}

@end

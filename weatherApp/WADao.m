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

@implementation WADao

-(id)init{
    self = [super init];
    if(self){
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshDataFromServer) name:WADao_fetchWeathDataNote object:nil];
    }
    return self;
}

-(void)refreshDataFromServer
{
        // kick off the server request on a separate thread
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
            // fetch JSON data
        NSData* data = [NSData dataWithContentsOfURL:kLatestWeatherURL];
        
            //consume the data on the main thread
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
    
    //NSArray* list = [json objectForKey:@"list"];
    //NSLog(@"list: %@", list);
    
    //save low, high and avg temps to properties
    self.lowtemp = [NSString stringWithFormat:@"%@",[[[json objectForKey:@"list"]valueForKey:@"main"]valueForKey:@"temp_min"]];
    
    self.avgtemp = [NSString stringWithFormat:@"%@",[[[json valueForKey:@"list"]valueForKey:@"main"]valueForKey:@"temp"]];
    
    self.hightemp = [NSString stringWithFormat:@"%@",[[[json objectForKey:@"list"]valueForKey:@"main"]valueForKey:@"temp_max"]];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:doaRequestReadyNote object:nil];
    
}

@end

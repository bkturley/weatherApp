
#import "WADefines.h"
#import "WARootViewController.h"
#import "WAView.h"
#import "WAModel.h"

#import <SystemConfiguration/CaptiveNetwork.h>


@interface WARootViewController ()

@property WAView* WAView;
@property WAModel* WAModel;

@end

@implementation WARootViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.WAView = [[WAView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
        self.view = self.WAView;
        self.WAModel = [[WAModel alloc] init];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fetchButtonTapped) name:fetchButtonTappedNote object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateView) name:doaRequestReadyNote object:nil];
    }
    return self;
}

-(void) updateView{
    self.WAView.lowtemplabel.text =  [NSString stringWithFormat: @"%.2f", self.WAModel.lowtemp];
    self.WAView.curtemplabel.text =  [NSString stringWithFormat: @"%.2f", self.WAModel.avgtemp];
    self.WAView.hightemplabel.text =  [NSString stringWithFormat: @"%.2f", self.WAModel.hightemp];
}

-(void)fetchButtonTapped{
        [self.WAModel updateWeatherFromServer];}

@end


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
        
        self.WAView = [[WAView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]
                                  andViewController:self];
        self.view = self.WAView;
        
        self.WAModel = [[WAModel alloc] initWithVC:self];
        
    }
    return self;
}

-(void) updateView{
    self.WAView.lowtemplabel.text = [NSString stringWithFormat:@"%@",self.WAModel.lowtemp];
    self.WAView.curtemplabel.text =  [NSString stringWithFormat:@"%@",self.WAModel.avgtemp];
    self.WAView.hightemplabel.text =  [NSString stringWithFormat:@"%@",self.WAModel.hightemp];
}

-(void)fetchButtonTapped{
    [self.WAModel updateWeatherFromServer];
}


@end

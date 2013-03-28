//
//  WAView.m
//  weatherApp
//
//  Created by BKTurley on 2/5/13.
//  Copyright (c) 2013 BKTurley. All rights reserved.
//

#import "WAView.h"

@interface WAView()
@property UIButton* fetchButton;
@end

@implementation WAView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.frame = frame;
        self.backgroundColor = [UIColor lightGrayColor];
        
        //hightemplabel
        self.hightemplabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.hightemplabel.backgroundColor = [UIColor redColor];
        self.hightemplabel.text = @"high";
        [self addSubview:self.hightemplabel];
        
        //curtemplabel
        self.curtemplabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.curtemplabel.backgroundColor = [UIColor yellowColor];
        self.curtemplabel.text = @"cur";
        [self addSubview:self.curtemplabel];
        
        //lowtemplabel
        self.lowtemplabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.lowtemplabel.backgroundColor = [UIColor blueColor];
        self.lowtemplabel.text = @"low";
        [self addSubview:self.lowtemplabel];
        
        //fetch button
        self.fetchButton = [[UIButton alloc] initWithFrame:CGRectZero];
        self.fetchButton.backgroundColor = [UIColor whiteColor];
        [self.fetchButton addTarget:self action:@selector(fetchButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.fetchButton];
        
        //lat UITextField
        UITextField *lattitudeInputTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, 120, 60, 44)];
        lattitudeInputTextField.backgroundColor = [UIColor whiteColor];
        [self addSubview:lattitudeInputTextField];
        
            //lon UITextField
        UITextField *longitudeInputTextField = [[UITextField alloc] initWithFrame:CGRectMake(75, 120, 60, 44)];
        longitudeInputTextField.backgroundColor = [UIColor whiteColor];
        [self addSubview:longitudeInputTextField];

    }
    return self;
}

-(void)viewDidLoad{
        //add observers
}


-(void)layoutSubviews{
    int tempLabelWidth = 120;
    int centerX = self.bounds.size.width/2;
    self.hightemplabel.frame = CGRectMake( centerX - tempLabelWidth/2 , 50, tempLabelWidth, 50);
    self.curtemplabel.frame = CGRectMake(centerX - tempLabelWidth/2 , 100, tempLabelWidth, 50);
    self.lowtemplabel.frame = CGRectMake(centerX - tempLabelWidth/2 , 150, tempLabelWidth, 50);
    self.fetchButton.frame = CGRectMake(centerX - tempLabelWidth/2 , 210, 75, 50);
    [self.fetchButton setFrame:CGRectMake(centerX - tempLabelWidth/2 , 210, 75, 50)];

}

-(void)fetchButtonTapped{
    [[NSNotificationCenter defaultCenter] postNotificationName:fetchButtonTappedNote object:nil];
}

@end

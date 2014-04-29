//
//  ViewController.h
//  Yolo Bear
//
//  Created by Dylan Hurd on 4/27/14.
//  Copyright (c) 2014 Because. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"
#import "CoreLocation/CoreLocation.h"
#import "LightManager.h"

@interface MasterViewController : UIViewController <CLLocationManagerDelegate>

@property (nonatomic, strong) BaseView* view;
@property (nonatomic, strong) UILabel *beaconLabel;
@property (nonatomic, strong) UIImageView *leaf;
@property (nonatomic, strong) UITextView *funFact;
@property (nonatomic, strong) UIButton *leafButton;
@property (nonatomic, strong) NSArray *funFacts;

@property (strong, nonatomic) CLBeaconRegion *beaconRegion;
@property (strong, nonatomic) CLLocationManager *locationManager;

@property (strong, nonatomic) LightManager* lightManager;

@end

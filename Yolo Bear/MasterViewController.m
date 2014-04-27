//
//  ViewController.m
//  Yolo Bear
//
//  Created by Dylan Hurd on 4/27/14.
//  Copyright (c) 2014 Because. All rights reserved.
//

#import "MasterViewController.h"
#import <CoreLocation/CoreLocation.h>


@interface MasterViewController () <CLLocationManagerDelegate>

@property CLLocationManager *locationManager;
@property NSMutableDictionary *beacons;
@property NSMutableDictionary *rangedRegions;
@property NSArray* supportedProximityUUIDs;

@end

@implementation MasterViewController

- (void) loadView
{
	self.view = [[BaseView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    self.beacons = [[NSMutableDictionary alloc] init];
    
    self.supportedProximityUUIDs = @[[[NSUUID alloc] initWithUUIDString:@"E2C56DB5-DFFB-48D2-B060-D0F5A71096E0"],
                                 [[NSUUID alloc] initWithUUIDString:@"5A4BCFCE-174E-4BAC-A814-092E77F6B7E5"],
                                 [[NSUUID alloc] initWithUUIDString:@"74278BDA-B644-4520-8F0C-720EAF059935"]];
    
    self.rangedRegions = [[NSMutableDictionary alloc] init];
    
    for (NSUUID *uuid in self.supportedProximityUUIDs)
    {
        CLBeaconRegion *region = [[CLBeaconRegion alloc] initWithProximityUUID:uuid identifier:[uuid UUIDString]];
        self.rangedRegions[region] = [NSArray array];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Location manager delegate

- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    /*
     CoreLocation will call this delegate method at 1 Hz with updated range information.
     Beacons will be categorized and displayed by proximity.  A beacon can belong to multiple
     regions.  It will be displayed multiple times if that is the case.  If that is not desired,
     use a set instead of an array.
     */
}




@end

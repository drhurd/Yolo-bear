//
//  ViewController.m
//  Yolo Bear
//
//  Created by Dylan Hurd on 4/27/14.
//  Copyright (c) 2014 Because. All rights reserved.
//

#import "MasterViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "BaseView.h"


@interface MasterViewController () <CLLocationManagerDelegate>

@end

@implementation MasterViewController

NSDictionary *funFact1;
NSDictionary *funFact2;
bool fact1 = false;

- (void) loadView
{
	self.view = [[BaseView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Initialize iBeacon Stuff
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self initRegion];
    
    // Initialize Light Manager
	self.lightManager = [[LightManager alloc] init];
	
	
    // Initialize label
    self.beaconLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 230, 300, 300)];
    self.beaconLabel.text = @"Out in the Wild";
    self.beaconLabel.textColor = [UIColor colorWithRed:127.0/255.0f green:127.0/255.0f blue:127.0/255.0f alpha:1.0];
    [self.beaconLabel setFont:[UIFont fontWithName:@"GillSans-Light" size:20]];
    [self.beaconLabel setTextAlignment:UITextAlignmentCenter];
    
    [self.view addSubview:self.beaconLabel];
    
    
    self.leaf = [[UIImageView alloc] initWithFrame:CGRectMake(20, 460, 70, 70)];
    self.leaf.image = [UIImage imageNamed:@"leaf"];
    self.leaf.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.view addSubview:self.leaf];
    
    
    self.funFact = [[UITextView alloc] initWithFrame:CGRectMake(100, 470, 200, 200)];
    self.funFact.text = @"A heavy coat of dust on a light bulb can block up to half of the light.";
    self.funFact.editable = NO;

    [self.view addSubview:self.funFact];
    
    
    NSURL *blogURL = [NSURL URLWithString:@"https://googledrive.com/host/0B0qN8FOnENW3UF9aYjVodWtrNnc/goGreen.html"];
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURL];
    NSError *error = nil;

    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    self.funFacts = [dataDictionary objectForKey:@"posts"];
    
    
    // Set labels from JSON data
    funFact1 = [self.funFacts objectAtIndex:0];
    self.funFact.text = [funFact1 valueForKey:@"body"];
    
    funFact2 = [self.funFacts objectAtIndex:1];
    self.funFact.text = [funFact2 valueForKey:@"body"];
    
    
    // Set leaf button
    self.leafButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.leafButton setTitle:@" " forState:UIControlStateNormal];
    [self.leafButton setFrame:CGRectMake(20, 460, 70, 70)];
    [self.leafButton addTarget: self action: @selector( displayFact: ) forControlEvents: UIControlEventTouchDown];
    
    [self.view addSubview:self.leafButton];
}


- (void)displayFact:(UIButton*)sender
{
    if (!fact1) {
        self.funFact.text = [funFact1 valueForKey:@"body"];
        fact1 = true;
    } else {
        self.funFact.text = [funFact2 valueForKey:@"body"];
        fact1 = false;
    }
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}


- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Location manager delegate

//iBeacon Code Below
-(void) initRegion {
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"E2C56DB5-DFFB-48D2-B060-D0F5A71096E0"];
    self.beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid identifier:@"Light Room"];
    self.beaconRegion.notifyEntryStateOnDisplay = NO;
    [self.locationManager startMonitoringForRegion:self.beaconRegion];
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
}


- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
    
    // Turn light on
    [self.lightManager toggleLightStatus];
    
    // Send notification
    UILocalNotification *ntf = [[UILocalNotification alloc] init];
    ntf.alertBody = @"Entering the Bear Cave";
    ntf.soundName = UILocalNotificationDefaultSoundName;
    [[UIApplication sharedApplication] presentLocalNotificationNow:ntf];
    
    
    // Update label
    self.beaconLabel.text = @"Welcome to the Bear Cave";
    
    
}


-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    
    [self.locationManager stopRangingBeaconsInRegion:self.beaconRegion];
    

    // Turn light off
	[self.lightManager toggleLightStatus];
    
    // Send notification
    UILocalNotification *ntf = [[UILocalNotification alloc] init];
    ntf.alertBody = @"Exiting the Bear Cave";
    ntf.soundName = UILocalNotificationDefaultSoundName;
    [[UIApplication sharedApplication] presentLocalNotificationNow:ntf];
    
    
    // Update label
    self.beaconLabel.text = @"Out in the Wild";
    
}


-(void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region {
    CLBeacon *beacon = [[CLBeacon alloc] init];
    beacon = [beacons lastObject];
    
}




@end

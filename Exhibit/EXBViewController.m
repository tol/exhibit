//
//  EXBViewController.m
//  Exhibit
//
//  Created by srussell on 2/21/14.
//  Copyright (c) 2014 Happy Hour Devs. All rights reserved.
//

#import <ESTBeaconManager.h>

#import "EXBViewController.h"
#import "EXBBeaconService.h"

@interface EXBViewController () <ESTBeaconManagerDelegate>
@property (nonatomic, strong) ESTBeaconManager* beaconManager;
@property (nonatomic, strong) ESTBeaconRegion *beaconRegion;
@property (nonatomic, strong) EXBBeaconService *beaconService;
@end

@implementation EXBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.beaconManager = [[ESTBeaconManager alloc] init];
    self.beaconManager.delegate = self;
    self.beaconManager.avoidUnknownStateBeacons = YES;
    
    self.beaconRegion = [[ESTBeaconRegion alloc] initWithProximityUUID: ESTIMOTE_PROXIMITY_UUID
                                                            identifier: @"EstimoteSampleRegion"];
    self.beaconRegion.notifyEntryStateOnDisplay = true;
    
    _beaconService = [[EXBBeaconService alloc] init];
    [self.beaconManager startRangingBeaconsInRegion:self.beaconRegion];
}

-(void)beaconManager:(ESTBeaconManager *)manager
     didRangeBeacons:(NSArray *)beacons
            inRegion:(ESTBeaconRegion *)region
{
    //NSLog([NSString stringWithFormat:@"We're looking at %d beacons", [beacons count]]);
    [self.beaconService processBeacons:beacons];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

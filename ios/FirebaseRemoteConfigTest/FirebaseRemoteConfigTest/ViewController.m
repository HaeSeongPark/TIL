//
//  ViewController.m
//  FirebaseRemoteConfigTest
//
//  Created by rhino Q on 28/06/2019.
//  Copyright © 2019 rhino Q. All rights reserved.
// https://firebase.google.com/docs/remote-config/ios?authuser=0
// https://firebase.google.com/docs/remote-config/use-config-ios?hl=ko

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
NSString *const kIsNowEventPeriod = @"isNowEventPeriod";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupRemoteConfig];
    [self fetchConfig];
}

-(void)setupRemoteConfig
{
    // [START get_remote_config_instance]
    self.remoteConfig = [FIRRemoteConfig remoteConfig];
    // [END get_remote_config_instance]
    
    // Create a Remote Config Setting to enable developer mode, which you can use to increase
    // the number of fetches available per hour during development. See Best Practices in the
    // README for more information.
    // [START enable_dev_mode]
    FIRRemoteConfigSettings *remoteConfigSettings = [[FIRRemoteConfigSettings alloc] initWithDeveloperModeEnabled:YES];
    self.remoteConfig.configSettings = remoteConfigSettings;
    // [END enable_dev_mode]
    
    // Set default Remote Config parameter values. An app uses the in-app default values until you
    // update any values that you want to change in the Firebase console. See Best Practices in the
    // README for more information.
    // [START set_default_values]
    [self.remoteConfig setDefaultsFromPlistFileName:@"RemoteConfigDefaults"];
    // [END set_default_values]
}

-(void)fetchConfig
{
    //TODO: - 캐시 유효기간 적절히 수정하기 60 // 1분으로?
    long expirationDuration = 60 * 60 ; // 1시간
    // If your app is using developer mode, expirationDuration is set to 0, so each fetch will
    // retrieve values from the Remote Config service.
    if (self.remoteConfig.configSettings.isDeveloperModeEnabled) {
        expirationDuration = 0;
    }
    
    
    // [START fetch_config_with_callback]
    // TimeInterval is set to expirationDuration here, indicating the next fetch request will use
    // data fetched from the Remote Config service, rather than cached parameter values, if cached
    // parameter values are more than expirationDuration seconds old. See Best Practices in the
    // README for more information.
    [self.remoteConfig fetchWithExpirationDuration:expirationDuration completionHandler:^(FIRRemoteConfigFetchStatus status, NSError *error) {
        if (status == FIRRemoteConfigFetchStatusSuccess) {
            NSLog(@"Config fetched!");
            [self.remoteConfig activateFetched];
        } else {
            NSLog(@"Config not fetched");
            NSLog(@"Error %@", error.localizedDescription);
        }
        [self log];
    }];
    // [END fetch_config_with_callback]
}

-(void)log
{
    if(self.remoteConfig[kIsNowEventPeriod].boolValue) {
        NSLog(@"is now event period");
    } else {
        NSLog(@"is not now event period");
    }
}


@end

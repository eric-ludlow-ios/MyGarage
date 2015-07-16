//
//  CarController.m
//  MyGarage
//
//  Created by TRM on 7/15/15.
//  Copyright (c) 2015 MottApplications. All rights reserved.
//

#import "CarController.h"

static NSString *carsKey = @"carsKey";

@implementation CarController

+ (CarController *)sharedInstance {
    static CarController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [CarController new];
        sharedInstance.cars = @[];
        [sharedInstance loadsFromDefaults];
    });
    
    return sharedInstance;
}

- (Car *)createCar {
    NSMutableArray *mutableCars = [self.cars mutableCopy];
    
    Car *car = [Car new];
    
    [mutableCars addObject:car];
    
    self.cars = mutableCars;
    
    return car;
}

- (void)deleteCar:(Car *)car {
    if (!car) {
        return;
    }
    
    NSMutableArray *mutableCars = [self.cars mutableCopy];
    
    [mutableCars removeObject:car];
    
    self.cars = mutableCars;
    
    [self savesToDefaults];
}

- (void)savesToDefaults {
    
    NSMutableArray *carDictionariesArray = [NSMutableArray new];
    
    for (Car *car in self.cars) {
        [carDictionariesArray addObject:[car carDictionary]];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:carDictionariesArray forKey:carsKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)loadsFromDefaults {
    
    NSArray *carDictionariesArray = [[NSUserDefaults standardUserDefaults] objectForKey:carsKey];
    
    NSMutableArray *carModelObjects = [NSMutableArray new];
    
    for (NSDictionary *carDictionary in carDictionariesArray) {
        Car *car = [[Car alloc] initWithDictionary:carDictionary];
        [carModelObjects addObject:car];
    }
    
    self.cars = carModelObjects;
}

@end

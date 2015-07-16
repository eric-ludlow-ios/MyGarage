//
//  CarController.m
//  vowels
//
//  Created by TRM on 7/15/15.
//  Copyright (c) 2015 MottApplications. All rights reserved.
//

#import "CarController.h"

@implementation CarController

+ (CarController *)sharedInstance {
    static CarController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [CarController new];
        sharedInstance.cars = @[];
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
}



@end

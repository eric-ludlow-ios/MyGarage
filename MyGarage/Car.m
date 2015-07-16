//
//  Car.m
//  MyGarage
//
//  Created by TRM on 7/15/15.
//  Copyright (c) 2015 MottApplications. All rights reserved.
//

#import "Car.h"

static const NSString *modelKey = @"model";
static const NSString *makeKey = @"make";
static const NSString *yearKey = @"year";
static const NSString *topSpeedKey = @"topSpeed";
static const NSString *conditionKey = @"condition";
static const NSString *numberOfDoorsKey = @"numberOfDoors";
static const NSString *isConvertableKey = @"isConvertable";

@implementation Car

- (NSDictionary *)carDictionary {
    
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    
    if (self.model) {
        [dictionary setObject:self.model forKey:modelKey];
    }
    if (self.make) {
        [dictionary setObject:self.make forKey:makeKey];
    }
    if (self.year) {
        [dictionary setObject:self.year forKey:yearKey];
    }
    if (self.topSpeed) {
        [dictionary setObject:self.topSpeed forKey:topSpeedKey];
    }
    if (self.condition) {
        [dictionary setObject:self.condition forKey:conditionKey];
    }
    if (self.numberOfDoors) {
        [dictionary setObject:self.numberOfDoors forKey:numberOfDoorsKey];
    }
    //BOOL needs to set if true and set if false
    if (self.isConvertable) {
        [dictionary setObject:@1 forKey:isConvertableKey];
    } else {
        [dictionary setObject:@0 forKey:isConvertableKey];
    }
    
    return dictionary;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self) {
        self.model = dictionary[modelKey];
        self.make = dictionary[makeKey];
        self.year = dictionary[yearKey];
        self.topSpeed = dictionary[topSpeedKey];
        self.condition = dictionary[conditionKey];
        self.numberOfDoors = dictionary[numberOfDoorsKey];
        
        if ([dictionary[isConvertableKey] isEqualToNumber:@1]) {
            self.isConvertable = YES;
        } else {
            self.isConvertable = NO;
        }
    }
    
    return self;
}


- (void)go {
    NSLog(@"The %@ goes \"Vroom! Vroom!\"", self);
}

- (void)stop {
    NSLog(@"The %@ goes \"Errrrrr!\"", self);
}

- (void)honk {
    NSLog(@"The %@ goes \"Beep! Beep!\"", self);
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ %@ %@", self.year, self.make, self.model];
}

@end

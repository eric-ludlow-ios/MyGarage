//
//  Car.m
//  vowels
//
//  Created by TRM on 7/15/15.
//  Copyright (c) 2015 MottApplications. All rights reserved.
//

#import "Car.h"

@implementation Car

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

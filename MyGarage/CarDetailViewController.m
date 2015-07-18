//
//  CarDetailViewController.m
//  MyGarage
//
//  Created by TRM on 7/15/15.
//  Copyright (c) 2015 MottApplications. All rights reserved.
//

#import "CarDetailViewController.h"

@interface CarDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *carMethodStringLabel;

@end

@implementation CarDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.car.description;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goButtonTapped {
    self.carMethodStringLabel.text = [self.car go];
}

- (IBAction)stopButtonTapped {
    self.carMethodStringLabel.text = [self.car stop];
}

- (IBAction)honkButtonTapped {
    self.carMethodStringLabel.text = [self.car honk];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

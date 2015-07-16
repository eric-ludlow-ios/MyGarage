//
//  CarListViewController.m
//  MyGarage
//
//  Created by TRM on 7/15/15.
//  Copyright (c) 2015 MottApplications. All rights reserved.
//

//ViewControllers
#import "CarListViewController.h"
#import "CarDetailViewController.h"
#import "CarEntryViewController.h"

//Model Controllers
#import "CarController.h"

//Model Objects
#import "Car.h"


@interface CarListViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CarListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Car *car1 = [[CarController sharedInstance] createCar];
    car1.year = @"2010";
    car1.make = @"Honda";
    car1.model = @"Civic Si";
    
    Car *car2 = [[CarController sharedInstance] createCar];
    car2.year = @"2001";
    car2.make = @"Toyota";
    car2.model = @"Tacoma";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [CarController sharedInstance].cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    
    Car *car = [CarController sharedInstance].cars[indexPath.row];
    
    cell.textLabel.text = car.description;
    
    return cell;
}

#pragma mark - Segue Methods
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"cellTapped"]) {
        UITableViewCell *cell = sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        Car *car = [CarController sharedInstance].cars[indexPath.row];
        
        CarDetailViewController *carDetailViewController = segue.destinationViewController;
        carDetailViewController.car = car;
    }
}

- (IBAction)unwindToListViewController:(UIStoryboardSegue *)segue {
    if ([segue.identifier isEqualToString:@"saveNewCar"]) {
        CarEntryViewController *carEntryViewController = segue.sourceViewController;
        Car *newCar = [[CarController sharedInstance] createCar];
        newCar.year = carEntryViewController.yearTextField.text;
        newCar.make = carEntryViewController.makeTextField.text;
        newCar.model = carEntryViewController.modelTextField.text;
    } else if ([segue.identifier isEqualToString:@"cancelNewCar"]) {
        //Do nothing. But maybe something in the future.
    }
}



@end

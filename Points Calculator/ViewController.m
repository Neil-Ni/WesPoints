//
//  ViewController.m
//  Points Calculator
//
//  Created by Lisa Sy on 9/24/11.
//  Copyright (c) 2011 Wesleyan University. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize PointsTextFields= _PointsTextField;
@synthesize MealsTextFields= _MealsTextFields;
@synthesize CurrentDate= _CurrentDate;
@synthesize DaysLeft=_DaysLeft;
@synthesize SpendingRatePerDay=_SpendingRatePerDay;
@synthesize IdealSpendingRatePerDay=_IdealSpendingRatePerDay;
@synthesize WeeksLeft=_WeeksLeft;
@synthesize SpendingRatePerWeek=_SpendingRatePerWeek;
@synthesize IdealSpendingRatePerWeek=_IdealSpendingRatePerWeek;

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    
    //POINTS TEXT FIELD
    if (theTextField == self.PointsTextFields) {
        [theTextField resignFirstResponder];
        double mydouble = [self.PointsTextFields.text doubleValue];
        Points = (float)(mydouble);
        
        //leftoverpoints/dayspast
        
        self.SpendingRatePerDay.text = [NSString stringWithFormat:@"%f", Points/(float)dayspast];
        //totalpoints/dayspast
        self.IdealSpendingRatePerDay = [NSString stringWithFormat:@"%f", Points/(float)(dayspast+daysmore)];
    }
    //MEALS TEXT FIELD
    if (theTextField == self.MealsTextFields) {
        [theTextField resignFirstResponder];
        double mydouble2 = [self.MealsTextFields.text doubleValue];
        Meals = (int)(mydouble2 + (mydouble2>0 ? 0.5 : -0.5));
        
        //leftoverpoints/dayspast
        
        self.SpendingRatePerWeek.text = [NSString stringWithFormat:@"%f", Meals/(float)dayspast];
        self.IdealSpendingRatePerWeek.text = [NSString stringWithFormat:@"%f", Meals/(float)(dayspast+daysmore)];
    }
    return YES;
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    NSDate *now = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM/dd/yyyy"];
    NSString *dateString = [dateFormat stringFromDate: now];
    NSLog(@"date: %@", dateString); 
    //prints out on the terminal right away
    self.CurrentDate.text = dateString;

    
    NSDate *schoolstarts = [dateFormat dateFromString:@"09/05/2011"];
    NSDate *schoolends = [dateFormat dateFromString:@"12/18/2011"];
    NSInteger datenow = [[NSCalendar currentCalendar] ordinalityOfUnit:(NSDayCalendarUnit) inUnit:(NSEraCalendarUnit) forDate:now];
    NSInteger dateschoolends = [[NSCalendar currentCalendar] ordinalityOfUnit:(NSDayCalendarUnit) inUnit:(NSEraCalendarUnit) forDate:schoolends];
    
    self.DaysLeft.text = [NSString stringWithFormat:@"%d",dateschoolends-datenow];
    
    NSInteger dateschoolstarts = [[NSCalendar currentCalendar] ordinalityOfUnit:(NSDayCalendarUnit) inUnit:(NSEraCalendarUnit) forDate:schoolstarts];
        //This converts the DATE from format [MM/dd/yyyy] to INTEGER to be counted.
    
    dayspast = datenow - dateschoolstarts;
    daysmore = dateschoolends - datenow;
    NSLog(@"dayspast: %d", dayspast);
    NSLog(@"daysmore: %d", daysmore);
    
    self.WeeksLeft.text = [NSString stringWithFormat:@"%f",(dateschoolends-datenow)/7.0];
                          
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{

    [self setCurrentDate:nil];
    [self setDaysLeft:nil];
    [self setSpendingRatePerDay:nil];
    [self setIdealSpendingRatePerDay:nil];
    [self setWeeksLeft:nil];
    [self setSpendingRatePerWeek:nil];
    [self setIdealSpendingRatePerWeek:nil];
    [self setPointsTextFields:nil];
    [self setMealsTextFields:nil];
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end

//
//  ViewController.m
//  point calculator
//
//  Created by Tzu-Yang Ni on 9/23/11.
//  Copyright (c) 2011 yoseka. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize Picker=_Picker;
@synthesize PointsTextField=_PointsTextField;
@synthesize MealsTextFieds=_MealsTextFiends;
@synthesize CurrentDate=_CurrentDate;
@synthesize DaysLeft=_DaysLeft;

@synthesize SpendingRatePerDay=_SpendingRatePerDay;
@synthesize IdeaSpendingRatePerDay=_IdeaSpendingRatePerDay;
@synthesize Label=_Label;
@synthesize IdealPerDayLabel=_IdealPerDayLabel;
@synthesize SpendingPerDayLabel=_SpendingPerDayLabel;
@synthesize WeeksLeft=_WeeksLeft;
@synthesize Switch=_Switch;
@synthesize Mealplans=_Mealplans; 


- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
   
    //theTextField.keyboardType = UIKeyboardTypeNumberPad; 
    
    if (theTextField == self.PointsTextField) {
        [theTextField setKeyboardType:UIKeyboardTypeNumberPad];
        [theTextField resignFirstResponder];
        double mydouble = [self.PointsTextField.text doubleValue];
        Points = (float)(mydouble);
        self.Switch.on = NO;
        self.Label.text = @"Points";
         
        if(Points > 1582){
            
            self.IdeaSpendingRatePerDay.text = [NSString stringWithFormat:@"%0.1f", (Points)/(float)daysmore];
            self.SpendingRatePerDay.text =0; 
            self.IdealPerDayLabel.text = @"Points/Day";
            self.SpendingPerDayLabel.text = @"Points/Day";
        }
        if( PointsFromMealPlan != 0 && Points < PointsFromMealPlan){
            
            self.SpendingRatePerDay.text = [NSString stringWithFormat:@"%0.1f", (PointsFromMealPlan-Points)/(float)dayspast];
            self.IdeaSpendingRatePerDay.text = [NSString stringWithFormat:@"%0.1f", (Points)/(float)daysmore];
            self.IdealPerDayLabel.text = @"Points/Day";
            self.SpendingPerDayLabel.text = @"Points/Day";
        }
        if( Points == 0){
            
            self.SpendingRatePerDay.text = @" :("; 
            self.IdeaSpendingRatePerDay.text = 0;
            self.IdealPerDayLabel.text = 0;
            self.SpendingPerDayLabel.text = 0;
            
        } 
        i++; 
      
    }
    
    if (theTextField == self.MealsTextFieds) {
        [theTextField setKeyboardType:UIKeyboardTypeNumberPad];
        [theTextField resignFirstResponder];
        double mydouble2 = [self.MealsTextFieds.text doubleValue];
        Meals = (int)(mydouble2 + (mydouble2>0 ? 0.5 : -0.5));
        self.Switch.on = YES;
        self.Label.text = @"Meals"; 
        if(MealsFromMealPlan !=0 && Meals < MealsFromMealPlan){
            self.SpendingRatePerDay.text =  [NSString stringWithFormat:@"%0.1f", (MealsFromMealPlan-Meals)/(float)dayspast];
            self.IdeaSpendingRatePerDay.text =  [NSString stringWithFormat:@"%0.1f", (Meals)/(float)daysmore];
            self.IdealPerDayLabel.text = @"Meals/Day";
            self.SpendingPerDayLabel.text = @"Meals/Day";
        }        
        if(Meals ==0){
            self.SpendingRatePerDay.text = @":(";
            self.IdeaSpendingRatePerDay.text = 0; 
            self.IdealPerDayLabel.text = 0;
            self.SpendingPerDayLabel.text = 0;
        }
        y++;
    }
    return YES; 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}
- (void)viewDidLoad
{
    //these are the objects added to the Picker's rows. here I use NSMutableArray to save the objects for later Picker to display

    Mealplans = [[NSMutableArray alloc] init];
    [Mealplans addObject:@"Plan A 1582 points"];
    [Mealplans addObject:@"Plan B 105 meals 723 points"];
    [Mealplans addObject:@"Plan C 135 meals 508 points"];
    [Mealplans addObject:@"Plan D 165 meals 293 points"];
    [Mealplans addObject:@"Plan E 210 meals 107 points"];
//default    
    [self.Picker selectRow:1 inComponent:0 animated:NO];
    PointsFromMealPlan = 723; MealsFromMealPlan=105; 
    
    
    NSDate *now = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM/dd/yyyy"];
    NSString *dateString = [dateFormat stringFromDate:now];
    NSLog(@"date: %@", dateString);
    self.CurrentDate.text = dateString;
    
 //   NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:self: userInfo:<#(id)#> repeats:<#(BOOL)#> repeats:<#(BOOL)#> 
    //NSInvocation* invoc = [NSInvocation initWithTarget:view:setNeedsDisplay:nil];
    //NSTimer  *timer = [NSTimer scheduledTimerWithTimeInterval:0.03 invocation: repeats:YES];
    
    //setting the dates for schoolends/starts 
    NSDate *schoolstarts = [dateFormat dateFromString:@"09/05/2011"];
    
    NSDate *schoolends = [dateFormat dateFromString:@"12/18/2011"];
    
    //formating the date into integer using Day as a unit so later we could find out the difference between dates in integer form
    NSInteger datenow =[[NSCalendar currentCalendar] ordinalityOfUnit:NSDayCalendarUnit
                                                                inUnit: NSEraCalendarUnit forDate:now];
    NSInteger dateschoolends = [[NSCalendar currentCalendar] ordinalityOfUnit:NSDayCalendarUnit
                                                               inUnit: NSEraCalendarUnit forDate:schoolends];
    
    
    self.DaysLeft.text = [NSString stringWithFormat:@"%d Days left",dateschoolends-datenow]; 
    
    NSInteger datesschoolstarts = [[NSCalendar currentCalendar] ordinalityOfUnit:NSDayCalendarUnit
                                                               inUnit: NSEraCalendarUnit forDate:schoolstarts];
    dayspast =  datenow - datesschoolstarts; 
    daysmore =  dateschoolends - datenow;
    NSLog(@"dayspast: %d", dayspast);
    NSLog(@"daysmore: %d", daysmore);

    self.WeeksLeft.text = [NSString stringWithFormat:@"%0.1f Weeks left",(dateschoolends-datenow)/7.];
    
    //set all the texts to 0, so we don't show anything when it the screen starts
    
   // self.IdealSpendingRatePerDay.text =0;
     //  self.SpendingRatePerDay.text =0;
    self.SpendingRatePerDay.text =0;
    self.IdeaSpendingRatePerDay.text=0;    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


// the following four functions are for setting up PickerView 
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [Mealplans count];
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {

    return [Mealplans objectAtIndex:row];
}

//this function shows what happen if user choose one of the objects in the picker
- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    //everytime the user choose different meal plan from the picker, it would give different values of Meals and Points from the Mealplan first.
    //then assigning different values, it would caluculate the ideal rate of spending first.
    
    //the if statements check to see if the user already have Points and Meals input from the textfields before. If the user has, then it would update the spendingrate right at this steps. 
    
    if(row==0){
         PointsFromMealPlan = 1582; MealsFromMealPlan =0;
    }
    if(row==1){
        PointsFromMealPlan = 723; MealsFromMealPlan=105; 
    }
    if(row==2){
        PointsFromMealPlan = 508; MealsFromMealPlan=135; 
    }
    if(row==3){
        PointsFromMealPlan = 293; MealsFromMealPlan=165; 
    }
    if(row==4){
        PointsFromMealPlan = 107; MealsFromMealPlan=210; 
    }
    if(Points > PointsFromMealPlan){
    //    PointsFromMealPlan = Points;
    }
    if(i>y){
        self.Switch.on = NO;
        self.Label.text = @"Points";
        double mydouble = [self.PointsTextField.text doubleValue];
        Points = (float)(mydouble);
        if( PointsFromMealPlan != 0 && Points < PointsFromMealPlan){
        
            self.SpendingRatePerDay.text = [NSString stringWithFormat:@"%0.1f", (PointsFromMealPlan-Points)/(float)dayspast];
            self.IdeaSpendingRatePerDay.text = [NSString stringWithFormat:@"%0.1f", (Points)/(float)daysmore];
            NSLog(@"Points: %f",(Points));
            NSLog(@"Points/daysmore: %d",daysmore);
            self.IdealPerDayLabel.text = @"Points/Day";
            self.SpendingPerDayLabel.text = @"Points/Day";
        }
        if( Points == 0){
    
            self.SpendingRatePerDay.text = @" :("; 
            self.IdeaSpendingRatePerDay.text = 0;
            self.IdealPerDayLabel.text = 0;
            self.SpendingPerDayLabel.text = 0;
        } 
    }
    if(i<=y){
        self.Switch.on = YES;
        self.Label.text = @"Meals";
        double mydouble2 = [self.MealsTextFieds.text doubleValue];
        Meals = (int)(mydouble2 + (mydouble2>0 ? 0.5 : -0.5));
        if(MealsFromMealPlan !=0 && Meals < MealsFromMealPlan){
        self.SpendingRatePerDay.text =  [NSString stringWithFormat:@"%0.1f", (MealsFromMealPlan-Meals)/(float)dayspast];
        self.IdeaSpendingRatePerDay.text =  [NSString stringWithFormat:@"%0.1f", (Meals)/(float)daysmore];
        self.IdealPerDayLabel.text = @"Meals/Day";
        self.SpendingPerDayLabel.text = @"Meals/Day";
        }
        if(Meals ==0){
        self.SpendingRatePerDay.text = @":(";
        self.IdeaSpendingRatePerDay.text = 0;
        self.IdealPerDayLabel.text = 0;
        self.SpendingPerDayLabel.text = 0;
    }
    }
    NSLog(@"Selected Color: %@. Index of selected color: %i", [Mealplans objectAtIndex:row], row);
}


- (IBAction)ChangeView:(id)sender {
    
    if(self.Switch.on){
        self.Label.text = @"Meals";
        NSLog(@"Meals: %d", Meals);
        double mydouble2 = [self.MealsTextFieds.text doubleValue];
        Meals = (int)(mydouble2 + (mydouble2>0 ? 0.5 : -0.5));
        if(MealsFromMealPlan !=0 && Meals < MealsFromMealPlan){
            self.SpendingRatePerDay.text =  [NSString stringWithFormat:@"%0.1f", (MealsFromMealPlan-Meals)/(float)dayspast];
            self.IdeaSpendingRatePerDay.text =  [NSString stringWithFormat:@"%0.1f", (Meals)/(float)daysmore];
            self.IdealPerDayLabel.text = @"Meals/Day";
            self.SpendingPerDayLabel.text = @"Meals/Day";
            
        }        
        if(Meals ==0){
            self.SpendingRatePerDay.text = @" :(";
            self.IdeaSpendingRatePerDay.text = 0;
            self.IdealPerDayLabel.text = 0;
            self.SpendingPerDayLabel.text = 0;
        }
    }
    else{
        self.Label.text = @"Points";
        NSLog(@"Points: %f", Points);
        double mydouble = [self.PointsTextField.text doubleValue];
        Points = (float)(mydouble);
        if(Points > 1582){
            self.IdeaSpendingRatePerDay.text = [NSString stringWithFormat:@"%0.1f", (Points)/(float)daysmore];
            self.SpendingRatePerDay.text =0;
            self.IdealPerDayLabel.text = @"Points/Day";
            self.SpendingPerDayLabel.text = 0;
        }
        if( PointsFromMealPlan != 0 && Points < PointsFromMealPlan){
            self.SpendingRatePerDay.text = [NSString stringWithFormat:@"%0.1f", (PointsFromMealPlan-Points)/(float)dayspast];
            self.IdeaSpendingRatePerDay.text = [NSString stringWithFormat:@"%0.1f", (Points)/(float)daysmore];
            self.IdealPerDayLabel.text = @"Points/Day";
            self.SpendingPerDayLabel.text = @"Points/Day";
        }
        if( Points == 0){
            self.SpendingRatePerDay.text = @" :("; 
            self.IdeaSpendingRatePerDay.text = 0;
            self.IdealPerDayLabel.text = 0;
            self.SpendingPerDayLabel.text = 0;
        }        
        
    }
    
    
}


- (void)viewDidUnload
{
    [self setPointsTextField:nil];
    [self setMealsTextFieds:nil];
    [self setCurrentDate:nil];
    [self setDaysLeft:nil];
    [self setWeeksLeft:nil];
    [self setPicker:nil];
    [self setSpendingRatePerDay:nil];
    [self setIdeaSpendingRatePerDay:nil];
    [self setSwitch:nil];
    [self setLabel:nil];
    [self setIdealPerDayLabel:nil];
    [self setSpendingPerDayLabel:nil];
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

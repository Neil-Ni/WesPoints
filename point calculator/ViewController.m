//
//  ViewController.m
//  point calculator
//
//  Created by Tzu-Yang Ni on 9/23/11.
//  Copyright (c) 2011 yoseka. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize PointsTextField=_PointsTextField;
@synthesize MealsTextFieds=_MealsTextFiends;
@synthesize SpendingRatePerDay=_SpendingRatePerDay;
@synthesize IdeaSpendingRatePerDay=_IdeaSpendingRatePerDay;
@synthesize SpendingRatePerWeek=_SpendingRatePerWeek;
@synthesize IdealSpendingRatePerWeek=_IdealSpendingRatePerWeek;
@synthesize SpendingPerWeekLabel=_SpendingPerWeekLabel;
@synthesize IdealPerWeekLabel=_IdealPerWeekLabel;
@synthesize Label=_Label;
@synthesize IdealPerDayLabel=_IdealPerDayLabel;
@synthesize SpendingPerDayLabel=_SpendingPerDayLabel;
@synthesize MealsPlanPicker=_MealsPlanPicker;
@synthesize Switch=_Switch;
@synthesize meals=_meals;
@synthesize points=_points;
@synthesize Dateinformation=_Dateinformation;
@synthesize Mealplans=_Mealplans; 
@synthesize timer=_timer;

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
   
    //theTextField.keyboardType = UIKeyboardTypeNumberPad; 
    
    if (theTextField == self.PointsTextField) {
         [theTextField resignFirstResponder];
        double mydouble = [self.PointsTextField.text doubleValue];
        Points = (float)(mydouble);
        self.Switch.on = NO;
        self.Label.text = [NSString stringWithFormat:@"out of %0.0f", PointsFromMealPlan];

        
        if( PointsFromMealPlan != 0 && Points < PointsFromMealPlan){
            
            self.SpendingRatePerDay.text = [NSString stringWithFormat:@"%0.1f", (PointsFromMealPlan-Points)/(float)dayspast];
            self.IdeaSpendingRatePerDay.text = [NSString stringWithFormat:@"%0.1f", (Points)/(float)daysmore];
            self.SpendingRatePerWeek.text = [NSString stringWithFormat:@"%0.1f", 7*(PointsFromMealPlan-Points)/(float)dayspast];
            self.IdealSpendingRatePerWeek.text = [NSString stringWithFormat:@"%0.1f", 7*(Points)/(float)daysmore];
            
            if((PointsFromMealPlan-Points)/(float)dayspast >(Points)/(float)daysmore){
                self.IdeaSpendingRatePerDay.textColor = [UIColor redColor]; 
            }
            
            if((PointsFromMealPlan-Points)/(float)dayspast <(Points)/(float)daysmore){
                self.IdeaSpendingRatePerDay.textColor = [UIColor greenColor]; 
            }
            
            self.IdealPerDayLabel.text = @"Points/Day";
            self.SpendingPerDayLabel.text = @"Points/Day";
            self.IdealPerWeekLabel.text = @"Points/Week"; 
            self.SpendingPerWeekLabel.text = @"Points/Week";
        }
        if( Points == 0){
            
            self.IdeaSpendingRatePerDay.text = @":(";
            self.IdeaSpendingRatePerDay.textColor = [UIColor blackColor];
            self.SpendingRatePerDay.text = 0;
            self.IdealSpendingRatePerWeek.text = 0;
            self.SpendingRatePerWeek.text = 0;
            self.IdealPerDayLabel.text = 0;
            self.SpendingPerDayLabel.text = 0;
            self.IdealPerWeekLabel.text = 0; 
            self.SpendingPerWeekLabel.text = 0;
            
        } 
        i++; 
      
    }
    
    if (theTextField == self.MealsTextFieds) {
        [theTextField resignFirstResponder];
        double mydouble2 = [self.MealsTextFieds.text doubleValue];
        Meals = (int)(mydouble2 + (mydouble2>0 ? 0.5 : -0.5));
        self.Switch.on = YES;
        self.Label.text = [NSString stringWithFormat:@"out of %d", MealsFromMealPlan]; 
        if(MealsFromMealPlan !=0 && Meals < MealsFromMealPlan){
            self.SpendingRatePerDay.text =  [NSString stringWithFormat:@"%0.1f", (MealsFromMealPlan-Meals)/(float)dayspast];
            self.IdeaSpendingRatePerDay.text =  [NSString stringWithFormat:@"%0.1f", (Meals)/(float)daysmore];
            self.SpendingRatePerWeek.text =  [NSString stringWithFormat:@"%0.1f", 7*(MealsFromMealPlan-Meals)/(float)dayspast];
            self.IdealSpendingRatePerWeek.text =  [NSString stringWithFormat:@"%0.1f", 7*(Meals)/(float)daysmore];
            
            if((MealsFromMealPlan-Meals)/(float)dayspast >(Meals)/(float)daysmore){
                self.IdeaSpendingRatePerDay.textColor = [UIColor redColor]; 
            }
            
            if((MealsFromMealPlan-Meals)/(float)dayspast <(Meals)/(float)daysmore){
                self.IdeaSpendingRatePerDay.textColor = [UIColor greenColor]; 
            }
            
            self.IdealPerDayLabel.text = @"Meals/Day";
            self.SpendingPerDayLabel.text = @"Meals/Day";
            self.IdealPerWeekLabel.text = @"Meals/Week"; 
            self.SpendingPerWeekLabel.text = @"Meals/Week";
        }        
        if(Meals ==0){
            self.IdeaSpendingRatePerDay.text = @":(";
            self.IdeaSpendingRatePerDay.textColor = [UIColor blackColor];
            self.SpendingRatePerDay.text = 0;
            self.IdealSpendingRatePerWeek.text = 0;
            self.SpendingRatePerWeek.text = 0;
            self.IdealPerDayLabel.text = 0;
            self.SpendingPerDayLabel.text = 0;
            self.IdealPerWeekLabel.text = 0; 
            self.SpendingPerWeekLabel.text = 0;
            
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

    PointsFromMealPlan = 723; MealsFromMealPlan=105;
    self.meals.hidden=YES;
    self.MealsTextFieds.hidden=YES;
    self.Switch.on = NO;
    self.Label.text = [NSString stringWithFormat:@"out of %0.0f", PointsFromMealPlan];
    
    NSDate *now = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM/dd/yyyy"];
    NSString *dateString = [dateFormat stringFromDate:now];
    NSLog(@"date: %@", dateString);
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(time) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];

 
    //setting the dates for schoolends/starts 
    NSDate *schoolstarts = [dateFormat dateFromString:@"09/05/2011"];
    
    NSDate *schoolends = [dateFormat dateFromString:@"12/18/2011"];
    
    NSDate *fallbreakstarts = [dateFormat dateFromString:@"10/22/2011"];
    
    
    NSDate *fallbreakends = [dateFormat dateFromString:@"10/26/2011"];
    
    
    NSDate *thanksgivingbreakstarts = [dateFormat dateFromString:@"11/23/2011"];
    
    
    NSDate *thanksgivingbreakends = [dateFormat dateFromString:@"11/28/2011"];
    
    
    NSInteger datenow =[[NSCalendar currentCalendar] ordinalityOfUnit:NSDayCalendarUnit
                                                                inUnit: NSEraCalendarUnit forDate:now];
    
    NSInteger datesschoolstarts = [[NSCalendar currentCalendar] ordinalityOfUnit:NSDayCalendarUnit
                                  inUnit: NSEraCalendarUnit forDate:schoolstarts];
    
    NSInteger dateschoolends = [[NSCalendar currentCalendar] ordinalityOfUnit:NSDayCalendarUnit
                                  inUnit: NSEraCalendarUnit forDate:schoolends];
    
    NSInteger datefallbreakstarts = [[NSCalendar currentCalendar] ordinalityOfUnit:NSDayCalendarUnit
                                  inUnit: NSEraCalendarUnit forDate:fallbreakstarts];
    
    
    NSInteger datefallbreakends = [[NSCalendar currentCalendar] ordinalityOfUnit:NSDayCalendarUnit
                                  inUnit: NSEraCalendarUnit forDate:fallbreakends];
    
    
    NSInteger datethanksgivingstarts = [[NSCalendar currentCalendar] ordinalityOfUnit:NSDayCalendarUnit
                                  inUnit: NSEraCalendarUnit forDate:thanksgivingbreakstarts];
    
    
    NSInteger datethanksgivingends = [[NSCalendar currentCalendar] ordinalityOfUnit:NSDayCalendarUnit
                                  inUnit: NSEraCalendarUnit forDate:thanksgivingbreakends];
    
    //days count before fall break starts.
    if(datenow < datefallbreakstarts){
        dayspast =  datenow - datesschoolstarts; 
        daysmore =  dateschoolends - datethanksgivingends + (datethanksgivingstarts - datefallbreakends) + (datefallbreakstarts- datenow);
    }
    //days count during fall break
    if( datenow >= datefallbreakstarts && datenow < datefallbreakends){
        dayspast =  datenow - datesschoolstarts - (datenow- datefallbreakstarts); 
        daysmore =  dateschoolends - datethanksgivingends + (datethanksgivingstarts - datefallbreakends);
        
    }
    //days count after fall break and before thanksgiving 
    if( datenow >= datefallbreakends && datenow < datethanksgivingstarts){
        dayspast =  datenow - datefallbreakends - (datefallbreakstarts- datesschoolstarts);
        daysmore =  dateschoolends - datethanksgivingends + datethanksgivingstarts - datenow;
        
    }
    //days count during thanksgiving break
    if (datenow >= datethanksgivingstarts && datenow < datethanksgivingends){
        dayspast = datenow - datesschoolstarts - (datenow - datethanksgivingstarts) - (datefallbreakends - datefallbreakstarts);
        daysmore = dateschoolends - datethanksgivingends;
    }
    //days count after thanksgiving break and before winter break
    if (datenow >= datethanksgivingends){
        dayspast = datenow - datesschoolstarts - (datethanksgivingends - datethanksgivingstarts) - (datefallbreakends - datefallbreakstarts);
        daysmore = dateschoolends - datenow;
    }
    
    NSLog(@"dayspast: %d", dayspast);
    NSLog(@"daysmore: %d", daysmore);

    self.Dateinformation.text = [NSString stringWithFormat:@"%@    %d Days left    %0.1f Weeks left", dateString, dateschoolends-datenow-4-5, (dateschoolends-datenow)/7.];
    //set all the texts to 0, so we don't show anything when it the screen starts
    
    self.SpendingRatePerDay.text =0;
    self.IdeaSpendingRatePerDay.text = 0;
    self.IdealSpendingRatePerWeek.text = 0;
    self.SpendingRatePerWeek.text = 0;
    self.IdealPerDayLabel.text = 0;
    self.SpendingPerDayLabel.text = 0;
    self.IdealPerWeekLabel.text = 0; 
    self.SpendingPerWeekLabel.text = 0;
    
    [super viewDidLoad];
	
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [Mealplans count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifer = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifer];
    
    if(cell == nil) {
        cell = [UITableViewCell alloc];
    }
    
    cell.textLabel.text = @"Hello World";
    cell.textLabel.font = [UIFont fontWithName:@"ChalkboardSE-Regular" size:14];
    NSString *cellValue = [Mealplans objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    
    return cell;
}

-(void)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

   // [self.MealsPlanPicker scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES]; 
    
      [tv deselectRowAtIndexPath:indexPath animated:YES];
  //  [self.MealsPlanPicker setContentOffset:self.MealsPlanPicker.contentOffset animated:YES];
    
    
    if(indexPath.row==0){
        PointsFromMealPlan = 1582; MealsFromMealPlan =0;
    }
    if(indexPath.row==1){
        PointsFromMealPlan = 723; MealsFromMealPlan=105; 
    }
    if(indexPath.row==2){
        PointsFromMealPlan = 508; MealsFromMealPlan=135; 
    }
    if(indexPath.row==3){
        PointsFromMealPlan = 293; MealsFromMealPlan=165; 
    }
    if(indexPath.row==4){
        PointsFromMealPlan = 107; MealsFromMealPlan=210; 
    }
    if(Points > PointsFromMealPlan){
        //    PointsFromMealPlan = Points;
    }
    if(i==y && i==0 && y==0 && z%2==0){
        self.Switch.on = NO;
        self.Label.text = [NSString stringWithFormat:@"out of %0.0f", PointsFromMealPlan];
    }
    if(i==y && i==0 && y==0 && z%2==1){
        self.Switch.on = YES;
        self.Label.text = [NSString stringWithFormat:@"out of %d", MealsFromMealPlan];
    }
    if(self.Switch.on == NO){
        //self.Switch.on = NO;
        self.Label.text = [NSString stringWithFormat:@"out of %0.0f", PointsFromMealPlan];
        double mydouble = [self.PointsTextField.text doubleValue];
        Points = (float)(mydouble);
        if(i>0){
        if( PointsFromMealPlan != 0 && Points < PointsFromMealPlan){
            
            self.SpendingRatePerDay.text = [NSString stringWithFormat:@"%0.1f", (PointsFromMealPlan-Points)/(float)dayspast];
            self.IdeaSpendingRatePerDay.text = [NSString stringWithFormat:@"%0.1f", (Points)/(float)daysmore];
            self.SpendingRatePerWeek.text = [NSString stringWithFormat:@"%0.1f", 7*(PointsFromMealPlan-Points)/(float)dayspast];
            self.IdealSpendingRatePerWeek.text = [NSString stringWithFormat:@"%0.1f", 7*(Points)/(float)daysmore];
            
            if((PointsFromMealPlan-Points)/(float)dayspast >(Points)/(float)daysmore){
                self.IdeaSpendingRatePerDay.textColor = [UIColor redColor]; 
            }
            
            if((PointsFromMealPlan-Points)/(float)dayspast <(Points)/(float)daysmore){
                self.IdeaSpendingRatePerDay.textColor = [UIColor greenColor]; 
            }
        
            NSLog(@"Points: %f",(Points));
            NSLog(@"Points/daysmore: %d",daysmore);
            self.IdealPerDayLabel.text = @"Points/Day";
            self.SpendingPerDayLabel.text = @"Points/Day";
            self.IdealPerWeekLabel.text = @"Points/Week"; 
            self.SpendingPerWeekLabel.text = @"Points/Week";
        }
        if( Points == 0){
            
            self.IdeaSpendingRatePerDay.text = @":("; 
            self.IdeaSpendingRatePerDay.textColor = [UIColor blackColor];
            self.SpendingRatePerDay.text = 0;
            self.IdealSpendingRatePerWeek.text = 0;
            self.SpendingRatePerWeek.text = 0;
            self.IdealPerDayLabel.text = 0;
            self.SpendingPerDayLabel.text = 0;
            self.IdealPerWeekLabel.text = 0; 
            self.SpendingPerWeekLabel.text = 0;
        } 
        }
    }
    if(self.Switch.on == YES){
        //self.Switch.on = YES;
        self.Label.text = [NSString stringWithFormat:@"out of %d", MealsFromMealPlan];
        double mydouble2 = [self.MealsTextFieds.text doubleValue];
        Meals = (int)(mydouble2 + (mydouble2>0 ? 0.5 : -0.5));
        if(y>0){
        if(MealsFromMealPlan !=0 && Meals < MealsFromMealPlan){
            self.SpendingRatePerDay.text =  [NSString stringWithFormat:@"%0.1f", (MealsFromMealPlan-Meals)/(float)dayspast];
            self.IdeaSpendingRatePerDay.text =  [NSString stringWithFormat:@"%0.1f", (Meals)/(float)daysmore];
            self.SpendingRatePerWeek.text =  [NSString stringWithFormat:@"%0.1f", 7*(MealsFromMealPlan-Meals)/(float)dayspast];
            self.IdealSpendingRatePerWeek.text =  [NSString stringWithFormat:@"%0.1f", 7*(Meals)/(float)daysmore];

            
            if((MealsFromMealPlan-Meals)/(float)dayspast >(Meals)/(float)daysmore){
                self.IdeaSpendingRatePerDay.textColor = [UIColor redColor]; 
            }
            
            if((MealsFromMealPlan-Meals)/(float)dayspast <(Meals)/(float)daysmore){
                self.IdeaSpendingRatePerDay.textColor = [UIColor greenColor]; 
            }
            
            self.IdealPerDayLabel.text = @"Meals/Day";
            self.SpendingPerDayLabel.text = @"Meals/Day";
            self.IdealPerWeekLabel.text = @"Meals/Week"; 
            self.SpendingPerWeekLabel.text = @"Meals/Week";
        }
        if(Meals ==0){
            self.IdeaSpendingRatePerDay.text = @":(";
            self.IdeaSpendingRatePerDay.textColor = [UIColor blackColor];
            
            self.SpendingRatePerDay.text = 0;
            self.IdealSpendingRatePerWeek.text = 0;
            self.SpendingRatePerWeek.text = 0;
            self.IdealPerDayLabel.text = 0;
            self.SpendingPerDayLabel.text = 0;
            self.IdealPerWeekLabel.text = 0; 
            self.SpendingPerWeekLabel.text = 0;
        }
        }
    }
    
}
- (IBAction)ChangeView:(id)sender {
    
    if(self.Switch.on){
        self.meals.hidden=NO;
        self.MealsTextFieds.hidden=NO;
        self.points.hidden=YES;
        self.PointsTextField.hidden=YES; 
        self.Label.text = [NSString stringWithFormat:@"out of %d", MealsFromMealPlan];
        NSLog(@"Meals: %d", Meals);
        double mydouble2 = [self.MealsTextFieds.text doubleValue];
        Meals = (int)(mydouble2 + (mydouble2>0 ? 0.5 : -0.5));
        if(y>0){
        if(MealsFromMealPlan !=0 && Meals < MealsFromMealPlan){
            self.SpendingRatePerDay.text =  [NSString stringWithFormat:@"%0.1f", (MealsFromMealPlan-Meals)/(float)dayspast];
            self.IdeaSpendingRatePerDay.text =  [NSString stringWithFormat:@"%0.1f", (Meals)/(float)daysmore];
            self.SpendingRatePerWeek.text =  [NSString stringWithFormat:@"%0.1f", 7*(MealsFromMealPlan-Meals)/(float)dayspast];
            self.IdealSpendingRatePerWeek.text =  [NSString stringWithFormat:@"%0.1f", 7*(Meals)/(float)daysmore];

            if((MealsFromMealPlan-Meals)/(float)dayspast >(Meals)/(float)daysmore){
                self.IdeaSpendingRatePerDay.textColor = [UIColor redColor]; 
            }
            
            if((MealsFromMealPlan-Meals)/(float)dayspast <(Meals)/(float)daysmore){
                self.IdeaSpendingRatePerDay.textColor = [UIColor greenColor]; 
            }
            
            self.IdealPerDayLabel.text = @"Meals/Day";
            self.SpendingPerDayLabel.text = @"Meals/Day";
            self.IdealPerWeekLabel.text = @"Meals/Week"; 
            self.SpendingPerWeekLabel.text = @"Meals/Week";
        }        
        if(Meals ==0){
            self.IdeaSpendingRatePerDay.text = @":(";
            self.IdeaSpendingRatePerDay.textColor = [UIColor blackColor];
            self.SpendingRatePerDay.text = 0;
            self.IdealSpendingRatePerWeek.text = 0;
            self.SpendingRatePerWeek.text = 0;
            self.IdealPerDayLabel.text = 0;
            self.SpendingPerDayLabel.text = 0;
            self.IdealPerWeekLabel.text = 0; 
            self.SpendingPerWeekLabel.text = 0;
        }
        }
        
    }
    else{
        self.meals.hidden=YES;
        self.MealsTextFieds.hidden=YES;
        self.points.hidden=NO;
        self.PointsTextField.hidden=NO;
        self.Label.text = [NSString stringWithFormat:@"out of %0.0f", PointsFromMealPlan]; 
        NSLog(@"Points: %f", Points);
        double mydouble = [self.PointsTextField.text doubleValue];
        Points = (float)(mydouble);
        if(i>0){
        if( PointsFromMealPlan != 0 && Points < PointsFromMealPlan){
            self.SpendingRatePerDay.text = [NSString stringWithFormat:@"%0.1f", (PointsFromMealPlan-Points)/(float)dayspast];
            self.IdeaSpendingRatePerDay.text = [NSString stringWithFormat:@"%0.1f", (Points)/(float)daysmore];
            self.SpendingRatePerWeek.text = [NSString stringWithFormat:@"%0.1f", 7*(PointsFromMealPlan-Points)/(float)dayspast];
            self.IdealSpendingRatePerWeek.text = [NSString stringWithFormat:@"%0.1f", 7*(Points)/(float)daysmore];
            
            if((PointsFromMealPlan-Points)/(float)dayspast >(Points)/(float)daysmore){
                self.IdeaSpendingRatePerDay.textColor = [UIColor redColor]; 
            }
            
            if((PointsFromMealPlan-Points)/(float)dayspast <(Points)/(float)daysmore){
                self.IdeaSpendingRatePerDay.textColor = [UIColor greenColor]; 
            }
            
            
            self.IdealPerDayLabel.text = @"Points/Day";
            self.SpendingPerDayLabel.text = @"Points/Day";
            self.IdealPerWeekLabel.text = @"Points/Week"; 
            self.SpendingPerWeekLabel.text = @"Points/Week";
        }
        if( Points == 0){
            self.IdeaSpendingRatePerDay.text = @":("; 
            self.IdeaSpendingRatePerDay.textColor = [UIColor blackColor];
            self.SpendingRatePerWeek.text = 0;
            self.SpendingRatePerWeek.text = 0;
            self.IdealPerDayLabel.text = 0;
            self.SpendingPerDayLabel.text = 0;
            self.IdealPerWeekLabel.text = 0; 
            self.SpendingPerWeekLabel.text = 0;
        }        
        
    }
    }
    z++;
}


-(void)time{
    Dateinformation.center = CGPointMake(Dateinformation.center.x-3.5, Dateinformation.center.y);
    if(Dateinformation.center.x < Dateinformation.bounds.size.width/2 ){
        Dateinformation.center = CGPointMake(320+Dateinformation.bounds.size.width/2, Dateinformation.center.y); 
    }
}


- (void)viewDidUnload
{
    [self setPointsTextField:nil];
    [self setMealsTextFieds:nil];
    [self setSpendingRatePerDay:nil];
    [self setIdeaSpendingRatePerDay:nil];
    [self setSwitch:nil];
    [self setLabel:nil];
    [self setIdealPerDayLabel:nil];
    [self setSpendingPerDayLabel:nil];
    [self setMealsPlanPicker:nil];
    [self setDateinformation:nil];
    [self setPoints:nil];
    [self setMeals:nil];
    [self setSpendingRatePerWeek:nil];
    [self setIdealSpendingRatePerWeek:nil];
    [self setSpendingPerWeekLabel:nil];
    [self setIdealPerWeekLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
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

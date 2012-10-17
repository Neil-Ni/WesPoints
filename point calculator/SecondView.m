//
//  SecondView.m
//  point calculator
//
//  Created by Tzu-Yang Ni on 2/1/12.
//  Copyright (c) 2012 Wesleyan iOS Application Development. All rights reserved.
//

#import "SecondView.h"
#import "MealsPlan.h"
#import "AppDelegate.h"

@implementation SecondView

@synthesize IdeaSpendingRatePerDay=_IdeaSpendingRatePerDay;
@synthesize IdealSpendingRatePerWeek=_IdealSpendingRatePerWeek;
@synthesize IdealPerWeekLabel=_IdealPerWeekLabel;
@synthesize Label=_Label;
@synthesize IdealPerDayLabel=_IdealPerDayLabel;
@synthesize breakview=_breakview;
@synthesize meals=_meals;
@synthesize points=_points;
@synthesize Dateinformation=_Dateinformation;
@synthesize timer=_timer;
@synthesize Segmentcontrol=_Segmentcontrol;
@synthesize PointsTextField=_PointsTextField;
@synthesize MealsTextFields=_MealsTextFields;

#pragma mark - View lifecycle



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

/*
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if(theTextField == self.PointsTextField){
        
        [theTextField resignFirstResponder];
        
        double mydouble = [self.PointsTextField.text doubleValue];
        Points = (float)(mydouble);
        self.Segmentcontrol.selectedSegmentIndex =0;
        self.Label.text = [NSString stringWithFormat:@"out of %0.0f points", PointsFromMealPlan];
        
        if(Points > PointsFromMealPlan){
            //self.IdeaSpendingRatePerDay.text = 0;
            self.IdeaSpendingRatePerDay.text = [NSString stringWithFormat:@"%0.1f", (Points)/(float)daysmore];
            
            //self.IdealSpendingRatePerWeek.text = 0;
            self.IdealSpendingRatePerWeek.text = [NSString stringWithFormat:@"%0.1f", 7*(Points)/(float)daysmore];
            
            //self.IdealPerDayLabel.text = 0;
            //self.IdealPerWeekLabel.text = 0; 
            self.IdeaSpendingRatePerDay.textColor = [UIColor colorWithRed:7/256.0 green:176/256.0 blue:75/256.0 alpha:1.0];
            self.IdealSpendingRatePerWeek.textColor = [UIColor colorWithRed:7/256.0 green:176/256.0 blue:75/256.0 alpha:1.0];
            self.IdealPerDayLabel.text = @"Points/Day";
            self.IdealPerWeekLabel.text = @"Points/Week"; 
            
        }
        if( PointsFromMealPlan != 0 && Points < PointsFromMealPlan){
            
            self.IdeaSpendingRatePerDay.text = [NSString stringWithFormat:@"%0.1f", (Points)/(float)daysmore];
            
            
            self.IdealSpendingRatePerWeek.text = [NSString stringWithFormat:@"%0.1f", 7*(Points)/(float)daysmore];
            
            
            if((PointsFromMealPlan-Points)/(float)dayspast >(Points)/(float)daysmore){
                self.IdeaSpendingRatePerDay.textColor = [UIColor redColor];
                self.IdealSpendingRatePerWeek.textColor = [UIColor redColor];
                
            }
            if((PointsFromMealPlan-Points)/(float)dayspast <(Points)/(float)daysmore){
                self.IdeaSpendingRatePerDay.textColor = [UIColor colorWithRed:7/256.0 green:176/256.0 blue:75/256.0 alpha:1.0];
                self.IdealSpendingRatePerWeek.textColor = [UIColor colorWithRed:7/256.0 green:176/256.0 blue:75/256.0 alpha:1.0];
            }
            
            self.IdealPerDayLabel.text = @"Points/Day";
            self.IdealPerWeekLabel.text = @"Points/Week"; 
         }
        if( Points == 0){
            
            self.IdeaSpendingRatePerDay.text = 0;
            self.IdealSpendingRatePerWeek.text = 0;
            self.IdealPerDayLabel.text = 0;
            self.IdealPerWeekLabel.text = 0; 
            
        } 
        i++;
    }
    
    if (theTextField == self.MealsTextFields) {
        [theTextField resignFirstResponder];
        double mydouble2 = [self.MealsTextFields.text doubleValue];
        Meals = (int)(mydouble2 + (mydouble2>0 ? 0.5 : -0.5));
        self.Segmentcontrol.selectedSegmentIndex =1;
        self.Label.text = [NSString stringWithFormat:@"out of %d meals", MealsFromMealPlan]; 
        
        if(Meals > MealsFromMealPlan){
            //self.IdeaSpendingRatePerDay.text = 0;
            self.IdeaSpendingRatePerDay.text =  [NSString stringWithFormat:@"%0.1f", (Meals)/(float)daysmore];
            
            self.IdealSpendingRatePerWeek.text =  [NSString stringWithFormat:@"%0.1f", 7*(Meals)/(float)daysmore];
            
            self.IdeaSpendingRatePerDay.textColor = [UIColor colorWithRed:7/256.0 green:176/256.0 blue:75/256.0 alpha:1.0];
            self.IdealSpendingRatePerWeek.textColor = [UIColor colorWithRed:7/256.0 green:176/256.0 blue:75/256.0 alpha:1.0];
            self.IdealPerDayLabel.text = @"Meals/Day";
            self.IdealPerWeekLabel.text = @"Meals/Week"; 
            
        }
        if(MealsFromMealPlan !=0 && Meals < MealsFromMealPlan){
            self.IdeaSpendingRatePerDay.text =  [NSString stringWithFormat:@"%0.1f", (Meals)/(float)daysmore];
            
            self.IdealSpendingRatePerWeek.text =  [NSString stringWithFormat:@"%0.1f", 7*(Meals)/(float)daysmore];
            
            if((MealsFromMealPlan-Meals)/(float)dayspast >(Meals)/(float)daysmore){
                self.IdeaSpendingRatePerDay.textColor = [UIColor redColor];
                self.IdealSpendingRatePerWeek.textColor = [UIColor redColor];
                
            }
            
            if((MealsFromMealPlan-Meals)/(float)dayspast <(Meals)/(float)daysmore){
                self.IdeaSpendingRatePerDay.textColor = [UIColor colorWithRed:7/256.0 green:176/256.0 blue:75/256.0 alpha:1.0];
                self.IdealSpendingRatePerWeek.textColor = [UIColor colorWithRed:7/256.0 green:176/256.0 blue:75/256.0 alpha:1.0];
            }
            
            self.IdealPerDayLabel.text = @"Meals/Day";
            self.IdealPerWeekLabel.text = @"Meals/Week"; 
        }        
        if(Meals ==0){
            self.IdeaSpendingRatePerDay.text = 0;
            self.IdealSpendingRatePerWeek.text = 0;
            self.IdealPerDayLabel.text = 0;
            self.IdealPerWeekLabel.text = 0; 
            
        }
        y++;
    }
    return YES; 
}*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (void)viewDidLoad
{
    
    
    
    AppDelegate *appdelegate = [[UIApplication sharedApplication] delegate];
    PointsFromMealPlan = appdelegate.Points;
    MealsFromMealPlan= appdelegate.Meals;
    NSLog(@"ppoints: %0.0f", PointsFromMealPlan);
    NSLog(@"mmeals: %d", MealsFromMealPlan);
    self.meals.hidden=YES;
    self.MealsTextFields.hidden=YES;
    if (MealsFromMealPlan == 0 && PointsFromMealPlan ==0){
        PointsFromMealPlan = 1582;
    }
    
    
    if (MealsFromMealPlan ==0){
        self.Segmentcontrol.hidden =YES;
    }
    self.Segmentcontrol.selectedSegmentIndex =0; 
    self.Label.text = [NSString stringWithFormat:@"out of %0.0f points", PointsFromMealPlan];
    
    
    
    NSDate *now = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM/dd/yyyy"];
    NSString *dateString = [dateFormat stringFromDate:now];
    NSLog(@"date: %@", dateString);
    
    //NSDate *now = [dateFormat dateFromString:@"03/13/2012"];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(time) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
//spring'12    
//    NSDate *schoolstarts = [dateFormat dateFromString:@"01/26/2012"];
//    NSDate *schoolends = [dateFormat dateFromString:@"05/14/2012"];
//    NSDate *springbreakstarts = [dateFormat dateFromString:@"03/09/2012"];
//    NSDate *springbreakends = [dateFormat dateFromString:@"03/26/2012"];
    
//fall'12
    NSDate *schoolstarts = [dateFormat dateFromString:@"09/04/2012"];
    NSDate *schoolends = [dateFormat dateFromString:@"12/16/2012"];

    NSDate *thanksgivingbreakstarts = [dateFormat dateFromString:@"10/12/2012"];
    NSDate *thanksgivingbreakends = [dateFormat dateFromString:@"10/17/2012"];
    
    NSDate *fallbreakstarts = [dateFormat dateFromString:@"11/20/2012"];
    NSDate *fallbreakends = [dateFormat dateFromString:@"11/26/2012"];

    
    
    NSInteger datenow =[[NSCalendar currentCalendar] ordinalityOfUnit:NSDayCalendarUnit
                                                               inUnit: NSEraCalendarUnit forDate:now];
    
    NSInteger datesschoolstarts = [[NSCalendar currentCalendar] ordinalityOfUnit:NSDayCalendarUnit
                                                                          inUnit: NSEraCalendarUnit forDate:schoolstarts];
    
    NSInteger dateschoolends = [[NSCalendar currentCalendar] ordinalityOfUnit:NSDayCalendarUnit
                                                                       inUnit: NSEraCalendarUnit forDate:schoolends];
    
    NSInteger datethanksgivingbreakstarts = [[NSCalendar currentCalendar] ordinalityOfUnit:NSDayCalendarUnit
                                                                              inUnit: NSEraCalendarUnit forDate:thanksgivingbreakstarts];
    
    NSInteger datethanksgivingbreakends = [[NSCalendar currentCalendar] ordinalityOfUnit:NSDayCalendarUnit
                                                                            inUnit: NSEraCalendarUnit forDate:thanksgivingbreakends];
    
    NSInteger datefallbreakstarts = [[NSCalendar currentCalendar] ordinalityOfUnit:NSDayCalendarUnit
                                                                              inUnit: NSEraCalendarUnit forDate:fallbreakstarts];
    
    NSInteger datefallbreakends = [[NSCalendar currentCalendar] ordinalityOfUnit:NSDayCalendarUnit
                                                                            inUnit: NSEraCalendarUnit forDate:fallbreakends];
    
    NSInteger thanksgivingduration = datethanksgivingbreakends - datethanksgivingbreakstarts;
    NSInteger fallbrekaduration = datefallbreakends - datefallbreakstarts;    
    
    if (datenow < datesschoolstarts){
        datenow = datesschoolstarts;
    }
    
    //days count before thanksgiving break starts.
    if(datenow < datethanksgivingbreakstarts){
        dayspast =  datenow - datesschoolstarts; 
        daysmore =  dateschoolends - datenow - fallbrekaduration - thanksgivingduration;
    }
    //days count during thanksgiving break
    if( datenow >= datefallbreakstarts && datenow < datefallbreakends){
        //open a new view
        self.breakview.hidden = NO;
        self.breakview.image = [UIImage imageNamed:@"wespoints_springbreak.jpg"];
        dayspast =  datefallbreakstarts - datesschoolstarts; 
        daysmore =  dateschoolends - datefallbreakends - thanksgivingduration;
        
    }
    //days count after thanksgiving break and before school ends
    if (datenow >= datethanksgivingbreakends && datenow < datefallbreakstarts){
        dayspast = datenow - datesschoolstarts - fallbrekaduration;
        daysmore = dateschoolends - datenow - thanksgivingduration;
    }
    
    if (datenow >= datethanksgivingbreakstarts && datenow < datethanksgivingbreakends) {
        self.breakview.hidden = NO;
        self.breakview.image = [UIImage imageNamed:@"wespoints_springbreak.jpg"];
        dayspast =  datethanksgivingbreakstarts - datesschoolstarts - fallbrekaduration; 
        daysmore =  dateschoolends - datethanksgivingbreakends;
        
    }
    if (datenow >= datethanksgivingbreakends && datenow < dateschoolends) {
        dayspast =  datenow - datesschoolstarts - thanksgivingduration - fallbrekaduration; 
        daysmore = dateschoolends - datenow;
    }
    
    
    NSLog(@"dayspast: %d", datesschoolstarts);
    NSLog(@"dayspast: %d", datenow);    
    NSLog(@"dayspast: %d", datethanksgivingbreakstarts);
    NSLog(@"dayspast: %d", datethanksgivingbreakends);
    NSLog(@"dayspast: %d", datefallbreakstarts);
    NSLog(@"dayspast: %d", datefallbreakends);
    NSLog(@"dayspast: %d", dateschoolends);
    NSLog(@"dayspast: %d", dayspast);
    NSLog(@"daysmore: %d", daysmore);
    
    self.Dateinformation.text = [NSString stringWithFormat:@"%d academic days left  |  %0.1 f weeks left", dateschoolends-datenow, (dateschoolends-datenow)/7.];
    
    self.IdeaSpendingRatePerDay.text = 0;
    self.IdealSpendingRatePerWeek.text = 0;
    self.IdealPerDayLabel.text = 0;
    self.IdealPerWeekLabel.text = 0; 
    
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2) {
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(keyboardDidShow:) 
													 name:UIKeyboardDidShowNotification 
												   object:nil];		
	} else {
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(keyboardWillShow:) 
													 name:UIKeyboardWillShowNotification 
												   object:nil];
	}
    
    
    [super viewDidLoad];
	
}

- (void)addButtonToKeyboard {
	// create custom button
	UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
	doneButton.frame = CGRectMake(0, 163, 106, 53);
	doneButton.adjustsImageWhenHighlighted = NO;
	if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.0) {
		[doneButton setImage:[UIImage imageNamed:@"enter2.png"] forState:UIControlStateNormal];
		[doneButton setImage:[UIImage imageNamed:@"enter2.png"] forState:UIControlStateHighlighted];
	} else {        
		[doneButton setImage:[UIImage imageNamed:@"enter2.png"] forState:UIControlStateNormal];
		[doneButton setImage:[UIImage imageNamed:@"enter2.png"] forState:UIControlStateHighlighted];
	}
	[doneButton addTarget:self action:@selector(doneButton:) forControlEvents:UIControlEventTouchUpInside];
	// locate keyboard view
	UIWindow* tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
	UIView* keyboard;
    int i; 
	for(i=0; i<[tempWindow.subviews count]; i++) {
		keyboard = [tempWindow.subviews objectAtIndex:i];
		// keyboard found, add the button
		if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2) {
			if([[keyboard description] hasPrefix:@"<UIPeripheralHost"] == YES)
				[keyboard addSubview:doneButton];
		} else {
			if([[keyboard description] hasPrefix:@"<UIKeyboard"] == YES)
				[keyboard addSubview:doneButton];
		}
	}
}

- (void)keyboardWillShow:(NSNotification *)note {
	// if clause is just an additional precaution, you could also dismiss it
	if ([[[UIDevice currentDevice] systemVersion] floatValue] < 3.2) {
		[self addButtonToKeyboard];
	}
}

- (void)keyboardDidShow:(NSNotification *)note {
	// if clause is just an additional precaution, you could also dismiss it
	if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2) {
		[self addButtonToKeyboard];
    }
}


- (void)doneButton:(id)sender {

    if(self.PointsTextField.hidden==NO){
        
        [self.PointsTextField resignFirstResponder];
        
        double mydouble = [self.PointsTextField.text doubleValue];
        Points = (float)(mydouble);
        self.Segmentcontrol.selectedSegmentIndex =0;
        self.Label.text = [NSString stringWithFormat:@"out of %0.0f points", PointsFromMealPlan];
        
        if(Points > PointsFromMealPlan){
            //self.IdeaSpendingRatePerDay.text = 0;
            self.IdeaSpendingRatePerDay.text = [NSString stringWithFormat:@"%0.1f", (Points)/(float)daysmore];
            
            //self.IdealSpendingRatePerWeek.text = 0;
            self.IdealSpendingRatePerWeek.text = [NSString stringWithFormat:@"%0.1f", 7*(Points)/(float)daysmore];
            
            //self.IdealPerDayLabel.text = 0;
            //self.IdealPerWeekLabel.text = 0; 
            self.IdeaSpendingRatePerDay.textColor = [UIColor colorWithRed:7/256.0 green:176/256.0 blue:75/256.0 alpha:1.0];
            self.IdealSpendingRatePerWeek.textColor = [UIColor colorWithRed:7/256.0 green:176/256.0 blue:75/256.0 alpha:1.0];
            self.IdealPerDayLabel.text = @"Points/Day";
            self.IdealPerWeekLabel.text = @"Points/Week"; 
            
        }
        if( PointsFromMealPlan != 0 && Points < PointsFromMealPlan){
            
            self.IdeaSpendingRatePerDay.text = [NSString stringWithFormat:@"%0.1f", (Points)/(float)daysmore];
            
            
            self.IdealSpendingRatePerWeek.text = [NSString stringWithFormat:@"%0.1f", 7*(Points)/(float)daysmore];
            
            
            if((PointsFromMealPlan-Points)/(float)dayspast >(Points)/(float)daysmore){
                self.IdeaSpendingRatePerDay.textColor = [UIColor redColor];
                self.IdealSpendingRatePerWeek.textColor = [UIColor redColor];
                
            }
            if((PointsFromMealPlan-Points)/(float)dayspast <(Points)/(float)daysmore){
                self.IdeaSpendingRatePerDay.textColor = [UIColor colorWithRed:7/256.0 green:176/256.0 blue:75/256.0 alpha:1.0];
                self.IdealSpendingRatePerWeek.textColor = [UIColor colorWithRed:7/256.0 green:176/256.0 blue:75/256.0 alpha:1.0];
            }
            
            self.IdealPerDayLabel.text = @"Points/Day";
            self.IdealPerWeekLabel.text = @"Points/Week"; 
        }
        if( Points == 0){
            
            self.IdeaSpendingRatePerDay.text = 0;
            self.IdealSpendingRatePerWeek.text = 0;
            self.IdealPerDayLabel.text = 0;
            self.IdealPerWeekLabel.text = 0; 
            
        } 
        i++;
    }
    
    if (self.MealsTextFields.hidden==NO) {
      //  [theTextField resignFirstResponder];
        [self.MealsTextFields resignFirstResponder];

        double mydouble2 = [self.MealsTextFields.text doubleValue];
        Meals = (int)(mydouble2 + (mydouble2>0 ? 0.5 : -0.5));
        self.Segmentcontrol.selectedSegmentIndex =1;
        self.Label.text = [NSString stringWithFormat:@"out of %d meals", MealsFromMealPlan]; 
        
        if(Meals > MealsFromMealPlan){
            //self.IdeaSpendingRatePerDay.text = 0;
            self.IdeaSpendingRatePerDay.text =  [NSString stringWithFormat:@"%0.1f", (Meals)/(float)daysmore];
            
            self.IdealSpendingRatePerWeek.text =  [NSString stringWithFormat:@"%0.1f", 7*(Meals)/(float)daysmore];
            
            self.IdeaSpendingRatePerDay.textColor = [UIColor colorWithRed:7/256.0 green:176/256.0 blue:75/256.0 alpha:1.0];
            self.IdealSpendingRatePerWeek.textColor = [UIColor colorWithRed:7/256.0 green:176/256.0 blue:75/256.0 alpha:1.0];
            self.IdealPerDayLabel.text = @"Meals/Day";
            self.IdealPerWeekLabel.text = @"Meals/Week"; 
            
        }
        if(MealsFromMealPlan !=0 && Meals < MealsFromMealPlan){
            self.IdeaSpendingRatePerDay.text =  [NSString stringWithFormat:@"%0.1f", (Meals)/(float)daysmore];
            
            self.IdealSpendingRatePerWeek.text =  [NSString stringWithFormat:@"%0.1f", 7*(Meals)/(float)daysmore];
            
            if((MealsFromMealPlan-Meals)/(float)dayspast >(Meals)/(float)daysmore){
                self.IdeaSpendingRatePerDay.textColor = [UIColor redColor];
                self.IdealSpendingRatePerWeek.textColor = [UIColor redColor];
                
            }
            
            if((MealsFromMealPlan-Meals)/(float)dayspast <(Meals)/(float)daysmore){
                self.IdeaSpendingRatePerDay.textColor = [UIColor colorWithRed:7/256.0 green:176/256.0 blue:75/256.0 alpha:1.0];
                self.IdealSpendingRatePerWeek.textColor = [UIColor colorWithRed:7/256.0 green:176/256.0 blue:75/256.0 alpha:1.0];
            }
            
            self.IdealPerDayLabel.text = @"Meals/Day";
            self.IdealPerWeekLabel.text = @"Meals/Week"; 
        }        
        if(Meals ==0){
            self.IdeaSpendingRatePerDay.text = 0;
            self.IdealSpendingRatePerWeek.text = 0;
            self.IdealPerDayLabel.text = 0;
            self.IdealPerWeekLabel.text = 0; 
            
        }
        y++;
    }
    NSLog(@"doneButton");
    NSLog(@"Input: %@", self.PointsTextField.text);
    NSLog(@"Input: %@", self.MealsTextFields.text);
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [Mealplans count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifer = @"New";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifer];
    
    if(cell == nil) {
        cell = [UITableViewCell alloc];
    }
    
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Bold" size:14];
    NSString *cellValue = [Mealplans objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    
    return cell;
}


- (IBAction)ChangeView:(id)sender {
    
    if(self.Segmentcontrol.selectedSegmentIndex ==1){
        self.meals.hidden=NO;
        self.MealsTextFields.hidden=NO;
        self.points.hidden=YES;
        self.PointsTextField.hidden=YES; 
        self.Label.text = [NSString stringWithFormat:@"out of %d meals", MealsFromMealPlan];
        NSLog(@"Meals: %d", Meals);
        double mydouble2 = [self.MealsTextFields.text doubleValue];
        Meals = (int)(mydouble2 + (mydouble2>0 ? 0.5 : -0.5));
        if(y==0){
            
            self.IdeaSpendingRatePerDay.text = 0;
            self.IdealSpendingRatePerWeek.text = 0;
            self.IdealPerDayLabel.text = 0;
            self.IdealPerWeekLabel.text = 0; 
            
        }
        if(y>0){
            if(Meals > MealsFromMealPlan){
                self.IdeaSpendingRatePerDay.text = 0;
                self.IdealSpendingRatePerWeek.text = 0;
                self.IdealPerDayLabel.text = 0;
                self.IdealPerWeekLabel.text = 0; 
            }
            if(MealsFromMealPlan !=0 && Meals < MealsFromMealPlan){
                self.IdeaSpendingRatePerDay.text =  [NSString stringWithFormat:@"%0.1f", (Meals)/(float)daysmore];
                
                self.IdealSpendingRatePerWeek.text =  [NSString stringWithFormat:@"%0.1f", 7*(Meals)/(float)daysmore];
                
                if((MealsFromMealPlan-Meals)/(float)dayspast >(Meals)/(float)daysmore){
                    self.IdeaSpendingRatePerDay.textColor = [UIColor redColor];
                    self.IdealSpendingRatePerWeek.textColor = [UIColor redColor];
                    
                }
                
                if((MealsFromMealPlan-Meals)/(float)dayspast <(Meals)/(float)daysmore){
                    self.IdeaSpendingRatePerDay.textColor = [UIColor colorWithRed:7/256.0 green:176/256.0 blue:75/256.0 alpha:1.0];
                    self.IdealSpendingRatePerWeek.textColor = [UIColor colorWithRed:7/256.0 green:176/256.0 blue:75/256.0 alpha:1.0];
                    
                    
                }
                
                self.IdealPerDayLabel.text = @"Meals/Day";
                self.IdealPerWeekLabel.text = @"Meals/Week"; 
            }        
            if(Meals ==0){
                self.IdeaSpendingRatePerDay.text = 0;
                self.IdealSpendingRatePerWeek.text = 0;
                self.IdealPerDayLabel.text = 0;
                self.IdealPerWeekLabel.text = 0; 
            }
        }
        
    }
    if(self.Segmentcontrol.selectedSegmentIndex ==0){
        self.meals.hidden=YES;
        self.MealsTextFields.hidden=YES;
        self.points.hidden=NO;
        self.PointsTextField.hidden=NO;
        self.Label.text = [NSString stringWithFormat:@"out of %0.0f points", PointsFromMealPlan]; 
        NSLog(@"Points: %f", Points);
        double mydouble = [self.PointsTextField.text doubleValue];
        Points = (float)(mydouble);
        if(i==0){
            
            self.IdeaSpendingRatePerDay.text = 0;
            self.IdealSpendingRatePerWeek.text = 0;
            self.IdealPerDayLabel.text = 0;
            self.IdealPerWeekLabel.text = 0; 
            
        }
        if(i>0){
            if(Points > PointsFromMealPlan){
                self.IdeaSpendingRatePerDay.text = 0;
                self.IdealSpendingRatePerWeek.text = 0;
                self.IdealPerDayLabel.text = 0;
                self.IdealPerWeekLabel.text = 0; 
            }
            if( PointsFromMealPlan != 0 && Points < PointsFromMealPlan){
                self.IdeaSpendingRatePerDay.text = [NSString stringWithFormat:@"%0.1f", (Points)/(float)daysmore];
                
                
                self.IdealSpendingRatePerWeek.text = [NSString stringWithFormat:@"%0.1f", 7*(Points)/(float)daysmore];
                
                
                if((PointsFromMealPlan-Points)/(float)dayspast >(Points)/(float)daysmore){
                    self.IdeaSpendingRatePerDay.textColor = [UIColor redColor];
                    self.IdealSpendingRatePerWeek.textColor = [UIColor redColor];
                    
                }
                
                if((PointsFromMealPlan-Points)/(float)dayspast <(Points)/(float)daysmore){
                    self.IdeaSpendingRatePerDay.textColor = [UIColor colorWithRed:7/256.0 green:176/256.0 blue:75/256.0 alpha:1.0];
                    self.IdealSpendingRatePerWeek.textColor = [UIColor colorWithRed:7/256.0 green:176/256.0 blue:75/256.0 alpha:1.0];
                }
                
                
                self.IdealPerDayLabel.text = @"Points/Day";
                self.IdealPerWeekLabel.text = @"Points/Week"; 
            }
            if(Points == 0){
                self.IdeaSpendingRatePerDay.text = 0;
                self.IdealSpendingRatePerWeek.text = 0;
                self.IdealPerDayLabel.text = 0;
                self.IdealPerWeekLabel.text = 0; 
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
    [self setIdeaSpendingRatePerDay:nil];
    [self setLabel:nil];
    [self setIdealPerDayLabel:nil];
    [self setDateinformation:nil];
    [self setPoints:nil];
    [self setMeals:nil];
    [self setIdealSpendingRatePerWeek:nil];
    [self setIdealPerWeekLabel:nil];
    [self setSegmentcontrol:nil];
    [self setPointsTextField:nil];
    [self setMealsTextFields:nil];
    [self setBreakview:nil];
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




@end
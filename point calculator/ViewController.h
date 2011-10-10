//
//  ViewController.h
//  point calculator
//
//  Created by Tzu-Yang Ni on 9/23/11.
//  Copyright (c) 2011 yoseka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate, UIPickerViewDelegate, UITableViewDelegate, UITableViewDataSource> {
    UITextField *PointsTextField;
    UITextField *MealsTextFieds;

    UILabel *SpendingRatePerDay;
    UILabel *IdeaSpendingRatePerDay;
    UILabel *SpendingRatePerWeek;
    UILabel *IdealSpendingRatePerWeek;
    UILabel *SpendingPerWeekLabel;
    UILabel *IdealPerWeekLabel;
    UILabel *Label;
    UILabel *PointsPerDayLabel;
    UILabel *IdealPerDayLabel;
    UILabel *SpendingPerDayLabel;
    UITableView *MealsPlanPicker;

    UISwitch *Switch;
    NSString *Days;
    NSString *Weeks;
    NSInteger daysmore;
    NSInteger dayspast;
    float Points;
    float PointsFromMealPlan; 
    NSInteger Meals;
    NSInteger MealsFromMealPlan;
    NSMutableArray *Mealplans;
    int i, y, z;
    NSTimer *timer;
    UILabel *Dateinformation;
    UILabel *points;
    UILabel *meals;
}
@property (strong, nonatomic) IBOutlet UILabel *meals;
@property (strong, nonatomic) IBOutlet UILabel *points;
@property (strong, nonatomic) IBOutlet UILabel *Dateinformation;
@property (strong,nonatomic) NSMutableArray *Mealplans;
@property (strong, nonatomic) IBOutlet UITextField *PointsTextField;
@property (strong, nonatomic) IBOutlet UITextField *MealsTextFieds;

@property (strong, nonatomic) IBOutlet UITableView *MealsPlanPicker;
@property (strong, nonatomic) IBOutlet UISwitch *Switch;
@property (strong, nonatomic) IBOutlet UILabel *SpendingRatePerDay;
@property (strong, nonatomic) IBOutlet UILabel *IdeaSpendingRatePerDay;

@property (strong, nonatomic) IBOutlet UILabel *SpendingRatePerWeek;
@property (strong, nonatomic) IBOutlet UILabel *IdealSpendingRatePerWeek;
@property (strong, nonatomic) IBOutlet UILabel *SpendingPerWeekLabel;
@property (strong, nonatomic) IBOutlet UILabel *IdealPerWeekLabel;

@property (strong, nonatomic) IBOutlet UILabel *Label;
@property (strong, nonatomic) IBOutlet UILabel *IdealPerDayLabel;
@property (strong, nonatomic) IBOutlet UILabel *SpendingPerDayLabel;
@property (strong, nonatomic) NSTimer *timer; 

- (IBAction)ChangeView:(id)sender;

@end

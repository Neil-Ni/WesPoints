//
//  ViewController.h
//  point calculator
//
//  Created by Tzu-Yang Ni on 9/23/11.
//  Copyright (c) 2011 yoseka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate, UIPickerViewDelegate> {
    UITextField *PointsTextField;
    UITextField *MealsTextFieds;
    UILabel *CurrentDate;
    UILabel *DaysLeft;

    UILabel *SpendingRatePerDay;
    UILabel *IdeaSpendingRatePerDay;
    UILabel *Label;
    UILabel *PointsPerDayLabel;
    UILabel *IdealPerDayLabel;
    UILabel *SpendingPerDayLabel;
    UISlider *ShowPointsOrMeals;

    UILabel *WeeksLeft;

    UISwitch *Switch;
    NSString *Days;
    NSString *Weeks;
    NSInteger daysmore;
    NSInteger dayspast;
    float Points;
    float PointsFromMealPlan; 
    NSInteger Meals;
    NSInteger MealsFromMealPlan;
    UIPickerView *Picker;
    NSMutableArray *Mealplans;
    int i;
    int y;

}
@property (strong,nonatomic) NSMutableArray *Mealplans;
@property (strong, nonatomic) IBOutlet UIPickerView *Picker;
@property (strong, nonatomic) IBOutlet UITextField *PointsTextField;
@property (strong, nonatomic) IBOutlet UITextField *MealsTextFieds;
@property (strong, nonatomic) IBOutlet UILabel *CurrentDate;
@property (strong, nonatomic) IBOutlet UILabel *DaysLeft;
@property (strong, nonatomic) IBOutlet UILabel *WeeksLeft;

@property (strong, nonatomic) IBOutlet UISwitch *Switch;
@property (strong, nonatomic) IBOutlet UILabel *SpendingRatePerDay;
@property (strong, nonatomic) IBOutlet UILabel *IdeaSpendingRatePerDay;

@property (strong, nonatomic) IBOutlet UILabel *Label;
@property (strong, nonatomic) IBOutlet UILabel *IdealPerDayLabel;
@property (strong, nonatomic) IBOutlet UILabel *SpendingPerDayLabel;

- (IBAction)ChangeView:(id)sender;


@end

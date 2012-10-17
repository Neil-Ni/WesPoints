//
//  SecondView.h
//  point calculator
//
//  Created by Tzu-Yang Ni on 2/1/12.
//  Copyright (c) 2012 Wesleyan iOS Application Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondView : UIViewController <UITextFieldDelegate, UIPickerViewDelegate> 
{
    UITextField *PointsTextField;
    UITextField *MealsTextFieds;
    
    UILabel *IdeaSpendingRatePerDay;
    UILabel *IdealSpendingRatePerWeek;
    UILabel *IdealPerWeekLabel;
    UILabel *Label;
    UILabel *IdealPerDayLabel;
    
    NSString *Days;
    NSString *Weeks;
    NSInteger daysmore;
    NSInteger dayspast;
    float Points;
    float PointsFromMealPlan; 
    int Meals;
    int MealsFromMealPlan;
    NSMutableArray *Mealplans;
    int i, y, z;
    NSTimer *timer;
    UISegmentedControl *Segmentcontrol;
    
    UILabel *Dateinformation;
    UILabel *points;
    UILabel *meals;

}

@property (strong, nonatomic) IBOutlet UIImageView *breakview;

@property (strong, nonatomic) IBOutlet UILabel *meals;
@property (strong, nonatomic) IBOutlet UILabel *points;
@property (strong, nonatomic) IBOutlet UILabel *Dateinformation;
@property (strong, nonatomic) IBOutlet UILabel *IdeaSpendingRatePerDay;

@property (strong, nonatomic) IBOutlet UILabel *IdealSpendingRatePerWeek;
@property (strong, nonatomic) IBOutlet UILabel *IdealPerWeekLabel;

@property (strong, nonatomic) IBOutlet UILabel *Label;
@property (strong, nonatomic) IBOutlet UILabel *IdealPerDayLabel;
@property (strong, nonatomic) NSTimer *timer; 
@property (strong, nonatomic) IBOutlet UISegmentedControl *Segmentcontrol;

@property (weak, nonatomic) IBOutlet UITextField *PointsTextField;
@property (weak, nonatomic) IBOutlet UITextField *MealsTextFields;


- (IBAction)ChangeView:(id)sender;
@end

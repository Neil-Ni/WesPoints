//
//  ViewController.h
//  Points Calculator
//
//  Created by Lisa Sy on 9/24/11.
//  Copyright (c) 2011 Wesleyan University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>{
    UITextField *PointsTextFields;
    UITextField *MealsTextFields;
    UILabel *CurrentDate;
    UILabel *DaysLeft;
    UILabel *SpendingRatePerDay;
    UILabel *IdealSpendingRatePerDay;
    UILabel *WeeksLeft;
    UILabel *SpendingRatePerWeek;
    NSString *Days;
    NSString *Weeks;
    NSInteger dayspast;
    NSInteger daysmore;
    float Points;
    NSInteger Meals;
}

@property (strong, nonatomic) IBOutlet UITextField *PointsTextFields;
@property (strong, nonatomic) IBOutlet UITextField *MealsTextFields;
@property (strong, nonatomic) IBOutlet UILabel *CurrentDate;
@property (strong, nonatomic) IBOutlet UILabel *DaysLeft;
@property (strong, nonatomic) IBOutlet UILabel *SpendingRatePerDay;
@property (strong, nonatomic) IBOutlet UILabel *IdealSpendingRatePerDay;
@property (strong, nonatomic) IBOutlet UILabel *WeeksLeft;
@property (strong, nonatomic) IBOutlet UILabel *SpendingRatePerWeek;
@property (strong, nonatomic) IBOutlet UILabel *IdealSpendingRatePerWeek;

@end

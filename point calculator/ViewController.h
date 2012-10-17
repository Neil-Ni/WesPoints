//
//  ViewController.h
//  point calculator
//
//  Created by Tzu-Yang Ni on 9/23/11.
//  Copyright (c) 2011 yoseka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h> 

@class MealsPlan;
@class SecondView;
@class CoolButton; 

@interface ViewController : UIViewController {
    MealsPlan *chosenmealplan;
    SecondView *secondview;
    NSMutableArray *array;
}
@property (strong, nonatomic) NSMutableArray *array;

@property (weak, nonatomic) IBOutlet UIButton *A;
@property (weak, nonatomic) IBOutlet UIButton *B;
@property (weak, nonatomic) IBOutlet UIButton *C;
@property (weak, nonatomic) IBOutlet UIButton *D;
@property (weak, nonatomic) IBOutlet UIButton *E;

- (IBAction)MealPlanA:(id)sender;
- (IBAction)MealPlanB:(id)sender;
- (IBAction)MealPlanC:(id)sender;
- (IBAction)MealPlanD:(id)sender;
- (IBAction)MealPlanE:(id)sender;

@end

//
//  ViewController.m
//  point calculator
//
//  Created by Tzu-Yang Ni on 9/23/11.
//  Copyright (c) 2011 yoseka. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"


@implementation ViewController
@synthesize A=_A;
@synthesize B=_B;
@synthesize C=_C;
@synthesize D=_D;
@synthesize E=_E;
@synthesize array=_array;

- (void)viewDidLoad{
    //int i=0; 
    //self.array = [[NSMutableArray alloc] initWithObjects:self.A,self.B,self.C,self.D,self.E, nil];
/*
    for(i=0; i<5; i++){
      //  [[[array objectAtIndex:i] layer] setCornerRadius:8.0f];
       // [[[array objectAtIndex:i] layer] setMasksToBounds:YES];
       // [[[array objectAtIndex:i] layer] setBorderWidth:1.0f];
        [[[array objectAtIndex:i] layer] setBackgroundColor:[[UIColor redColor] CGColor]];
    }*/
    
    
}
- (IBAction)MealPlanA:(id)sender {
    
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    delegate.Meals = 0; 
    delegate.Points = 1582;
    self.A.adjustsImageWhenHighlighted = NO;
    self.A.selected = YES;
    self.B.selected = NO;
    self.C.selected = NO;
    self.D.selected = NO;
    self.E.selected = NO; 
}

- (IBAction)MealPlanB:(id)sender {
    
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    delegate.Meals = 105; 
    delegate.Points = 723;
    self.B.adjustsImageWhenHighlighted = NO;
    self.A.selected = NO;
    self.B.selected = YES;
    self.C.selected = NO;
    self.D.selected = NO;
    self.E.selected = NO;
}
- (IBAction)MealPlanC:(id)sender {
    
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    delegate.Meals = 135; 
    delegate.Points = 508;
    self.C.adjustsImageWhenHighlighted = NO;
    self.A.selected = NO;
    self.B.selected = NO;
    self.C.selected = YES;
    self.D.selected = NO;
    self.E.selected = NO;
}

- (IBAction)MealPlanD:(id)sender {
    
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    delegate.Meals = 165; 
    delegate.Points = 293;
    self.D.adjustsImageWhenHighlighted = NO;
    self.A.selected = NO;
    self.B.selected = NO;
    self.C.selected = NO;
    self.D.selected = YES;
    self.E.selected = NO;
}

- (IBAction)MealPlanE:(id)sender {
    
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    delegate.Meals = 210; 
    delegate.Points = 107;
    self.E.adjustsImageWhenHighlighted = NO;
    self.A.selected = NO;
    self.B.selected = NO;
    self.C.selected = NO;
    self.D.selected = NO;
    self.E.selected = YES;
    
}


- (void)viewDidUnload {
    [self setA:nil];
    [self setB:nil];
    [self setC:nil];
    [self setD:nil];
    [self setE:nil];
    [super viewDidUnload];
}
@end

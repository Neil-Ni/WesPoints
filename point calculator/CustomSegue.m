//
//  CustomSegue.m
//  point calculator
//
//  Created by Tzu-Yang Ni on 2/1/12.
//  Copyright (c) 2012 Wesleyan iOS Application Development. All rights reserved.
//

#import "CustomSegue.h"

@implementation CustomSegue


- (void) perform {
    UIViewController *src = (UIViewController *) self.sourceViewController;
    UIViewController *dst = (UIViewController *) self.destinationViewController;
    
    [UIView transitionWithView:src.navigationController.view duration:0.2
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        [src.navigationController pushViewController:dst animated:NO];
                    }
                    completion:NULL];
}


@end

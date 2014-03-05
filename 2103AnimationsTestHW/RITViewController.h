//
//  RITViewController.h
//  2103AnimationsTestHW
//
//  Created by Pronin Alexander on 05.03.14.
//  Copyright (c) 2014 Pronin Alexander. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RITViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *views;

@property (weak, nonatomic) IBOutlet UIImageView *gif;

@end

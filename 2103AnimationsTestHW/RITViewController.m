//
//  RITViewController.m
//  2103AnimationsTestHW
//
//  Created by Pronin Alexander on 05.03.14.
//  Copyright (c) 2014 Pronin Alexander. All rights reserved.
//

#import "RITViewController.h"
#import "UIImageAnimatedGIF.h"

@interface RITViewController ()

@end

@implementation RITViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    NSURL* path = [[NSBundle mainBundle] URLForResource:@"Minyons" withExtension:@"gif"];
    //NSString* stringPath = [path absoluteString];
    NSData* data = [NSData dataWithContentsOfURL:path];
    UIImage* image = [UIImage animatedImageWithAnimatedGIFData:data];
    self.gif.image = image;
    
    for (UIView* view in self.views) {
        view.layer.cornerRadius = CGRectGetHeight(view.frame) / 4;
    }
    
    [self moveView:self.views withClockwiseDirection:arc4random() % 2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Helper methosd

- (void) moveView:(NSArray*) views withClockwiseDirection:(BOOL) clockwiseDirection {
    
    [UIView animateWithDuration:2.f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         
                         UIView* firstView = views[0];
                         UIView* lastView = views[[views count] - 1];
                         
                         if (clockwiseDirection) {
                             
                             CGPoint center = firstView.center;
                             UIColor* color = firstView.backgroundColor;
                             
                             for (int i = 0; i < [views count] - 1; i++) {
                                 UIView* view = views[i];
                                 UIView* nextView = views[i + 1];
                                 
                                 view.backgroundColor = nextView.backgroundColor;
                                 view.center = nextView.center;
                                 
                             }
                             
                             lastView.backgroundColor = color;
                             lastView.center = center;
                             
                         } else {
                             
                             CGPoint center = lastView.center;
                             UIColor* color = lastView.backgroundColor;
                             
                             for (int i = [views count] - 1; i > 0; i--) {
                                 UIView* view = views[i];
                                 UIView* previousView = views[i - 1];
                                 
                                 view.backgroundColor = previousView.backgroundColor;
                                 view.center = previousView.center;
                             }
                             
                             firstView.backgroundColor = color;
                             firstView.center = center;
                         }
                         
                     }
                     completion:^(BOOL finished) {
                         
                         __weak NSArray* v = views;
                         [self moveView:v withClockwiseDirection:arc4random() % 2];
                         
                     }];
    
}

@end

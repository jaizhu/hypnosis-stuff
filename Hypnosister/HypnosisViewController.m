//
//  HypnosisViewController.m
//  Hypnosister
//
//  Created by Jaimie Zhu on 6/19/15.
//  Copyright (c) 2015 Jaimie Zhu. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@interface HypnosisViewController ()
@property (nonatomic, weak) UILabel *textLabel;
@end

@implementation HypnosisViewController
@synthesize segmentedControl;

// CHALLENGEEEEE
- (IBAction)segmentedControlAction:(id)sender {
    if (segmentedControl.selectedSegmentIndex == 0) {
        [self changeColor:[UIColor purpleColor]];
    } else if (segmentedControl.selectedSegmentIndex == 1) {
        [self changeColor:[UIColor grayColor]];
    } else if (segmentedControl.selectedSegmentIndex == 2) {
        [self changeColor:[UIColor yellowColor]];
    } else {
        NSLog(@"NOOOOO THIS SHOULD NOT EVER PRINT");
    }
}

- (void)changeColor:(UIColor*)newColor {
    [self.view removeFromSuperview];
    CGRect frame = [[UIScreen mainScreen] bounds];
    HypnosisView *backgroundView = [[HypnosisView alloc] initWithFrame:frame];
    backgroundView.color = newColor;
}

- (void)loadView {
    // create a view
    CGRect frame = [[UIScreen mainScreen] bounds];
    HypnosisView *backgroundView = [[HypnosisView alloc] initWithFrame:frame];
    
    // set it as *the* view of this controller
    self.view = backgroundView;
    
    [segmentedControl addTarget:self
                         action:@selector(segmentedControlAction:)
               forControlEvents:UIControlEventValueChanged];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    label.center = self.view.center;
    label.font = [UIFont systemFontOfSize:24];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"YAS";
    label.numberOfLines = 2;
    [self.view addSubview:label];
    self.textLabel = label;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"Hypnotize";
        self.tabBarItem.image = [UIImage imageNamed:@"Hypno.png"];
    }
    return self;
}

- (void)viewDidLoad {
    // always call the super implementationof viewDidLoad
    [super viewDidLoad];
    
    NSLog(@"HypnosisViewCOntroller loaded its view!");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // set the image's initial position
    // self.textLabel.center = (200, -30);
    
    // set the labe's initial alpha
    self.textLabel.alpha = 0.0;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // make it springy
    [UIView animateWithDuration:2.0
                          delay:0.0
         usingSpringWithDamping:0.5
          initialSpringVelocity:2.0
                        options:0
                     animations:^{
                         // self.textLabel.center = self.center;
                         self.textLabel.alpha = 1;
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"Spring animation competed!");
                     }];
    
    // set up a key frame anmiation
    [UIView animateKeyframesWithDuration:2.0
                                   delay:0.0
                                 options:0
                              animations:^{
                                  // add a keyframe
                                  [UIView addKeyframeWithRelativeStartTime:0.0
                                                          relativeDuration:0.4
                                                                animations:^{
                                                                    self.textLabel.transform = CGAffineTransformMakeScale(0.5, 2.0);
                                                                }];
                                  // usually each will start where the previous one ends
                                  [UIView addKeyframeWithRelativeStartTime:0.4
                                                          relativeDuration:0.3
                                                                animations:^{
                                                                    self.textLabel.transform = CGAffineTransformMakeScale(2.0, 0.5);
                                                                }];
                                  [UIView addKeyframeWithRelativeStartTime:0.7
                                                           relativeDuration:0.3
                                                                 animations:^{
                                                                     self.textLabel.transform = CGAffineTransformMakeScale(1.0, 1.0);
                                                                 }];
                                   }
                              completion:^(BOOL finished){
                                  NSLog(@"Keyframe animation completed!");
                              }];
}

@end
















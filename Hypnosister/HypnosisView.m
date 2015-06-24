//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Jaimie Zhu on 6/18/15.
//  Copyright (c) 2015 Jaimie Zhu. All rights reserved.
//

#import "HypnosisView.h"

@interface HypnosisView ()
@property (nonatomic, assign) CGFloat radiusOffset;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic) UIColor *color;
@end

@implementation HypnosisView

// CHALLENGEEEEE
- (void)segmentedControlAction:(UISegmentedControl *)segControl {
    if (segControl.selectedSegmentIndex == 0) {
        self.color = [UIColor purpleColor];
    } else if (segControl.selectedSegmentIndex == 1) {
        self.color = [UIColor grayColor];
    } else if (segControl.selectedSegmentIndex == 2) {
        self.color = [UIColor blueColor];
    };
}

- (void)setColor:(UIColor *)color {
    _color = color;
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // finds the center point of bounds
    CGRect bounds = self.bounds;
    
    // figure out the center of the bounds rectangle
    CGFloat centerX = bounds.origin.x + bounds.size.width / 2.0;
    CGFloat centerY = bounds.origin.y + bounds.size.height / 2.0;
    
    CGPoint center = CGPointMake(centerX, centerY);
    
    // the largest circle will inscribe the view
    CGFloat maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    // starting with a circle of radius 0, draw larger concentric circles outward
    // until you've reached the maxRadius
    for (CGFloat radius = 0; radius < maxRadius; radius += 20) {
        UIBezierPath *path = [[UIBezierPath alloc] init];
        
        // add an arc to the path at center, with our calculated radius
        [path addArcWithCenter:center
                        radius:radius + self.radiusOffset
                    startAngle:0.0
                      endAngle:M_PI * 2
                     clockwise:YES];
        
        // set line width to 10 points
        path.lineWidth = 10;
        
        // make the line some color
        // make it less opaque the larger its radius
        CGFloat alpha = ((radius + self.radiusOffset - 10.0) / maxRadius);
        [[self.color colorWithAlphaComponent:alpha] setStroke];
        
        // draw the path
        [path stroke];
        
        
    }
    
    // challenge - the image
//    CGFloat second_centerx = bounds.origin.x;
//    CGFloat second_centery = bounds.origin.y;
    UIImage *someImage = [UIImage imageNamed:@"dog"];
    CGRect someRect = CGRectMake (centerX - 50, centerY - 50, 100, 100);
    
    [someImage drawInRect:someRect];
    
    UISegmentedControl *segControl = [[UISegmentedControl alloc] initWithItems:@[@"Purple", @"Gray", @"Blue"]];
    
    [segControl addTarget:self
                   action:@selector(segmentedControlAction:)
         forControlEvents:UIControlEventValueChanged];
    
    segControl.frame = CGRectMake(centerX - 140, centerY + 100, 280, 20);
    
    [self.superview addSubview:segControl];
    
    segControl.momentary = YES;
}

/////////////////////////// OVERRIDING THINGS ////////////////////////////////
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.color = [UIColor purpleColor];
    }
    return  self;
}

/* MAKES THE CIRCLES MOVEEEE */
- (void)didMoveToSuperview
{
    if (self.superview != nil)
    {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0/30.0
                                                      target:self
                                                    selector:@selector(timerFired:)
                                                    userInfo:nil
                                                     repeats:YES];
    }
}


- (void)removeFromSuperview {
    [self.timer invalidate];
    self.timer = nil;
    [super removeFromSuperview];
}

- (void)timerFired:(NSTimer *)timer {
    NSLog(@"pew");
    
    // increment the radius offset
    self.radiusOffset += 1.0;
    
    // reset the radius offset once it reaches 20
    // this creates a looping effect
    if (self.radiusOffset > 20.0) {
        self.radiusOffset = 0;
    }
}

- (void)setRadiusOffset:(CGFloat)radiusOffset {
    _radiusOffset = radiusOffset;
    [self setNeedsDisplay];
}

@end












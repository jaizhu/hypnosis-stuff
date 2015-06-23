//
//  ViewController.h
//  Quiz
//
//  Created by Jaimie Zhu on 6/18/15.
//  Copyright (c) 2015 Jaimie Zhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizViewController : UIViewController

@property (nonatomic, assign) NSInteger currentQuestionIndex;
@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;
//@property (nonatomic) IBOutlet UILabel *questionLabel;

@end


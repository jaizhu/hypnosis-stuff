//
//  ViewController.m
//  Quiz
//
//  Created by Jaimie Zhu on 6/18/15.
//  Copyright (c) 2015 Jaimie Zhu. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@end

@implementation QuizViewController

- (IBAction)showQuestion:(id)sender
{
    self.currentQuestionIndex++;
    if (_currentQuestionIndex == self.questions.count)
    {
        self.currentQuestionIndex = 0;
    }
    
    NSString *question = self.questions[self.currentQuestionIndex];
    self.questionLabel.text = question;
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswer:(id)sender
{
    NSString *answer = self.answers[self.currentQuestionIndex];
    self.answerLabel.text = answer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.questions = @[@"From what is cognac made?",
                       @"What is the meaning of life?",
                       @"Why am I so fantastic?",
                       @"Who is watching you?",
                       @"What is 7+7?",
                       @"What is the capital of Vermont?"];
    
    self.answers = @[@"Grapes",
                     @"I am the meaning of life",
                     @"Because I'm Jaimie YOOOO",
                     @"BIG BROTHER IS WATCHING YOU",
                     @"14",
                     @"Montpelier"];
    
    // do other setup here after loading the view, typically from a nib
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// overriding the designated initializer
- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                      bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = @"Quiz";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.png"];
    }
    return self;
}

@end

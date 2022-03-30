//
//  ViewController.m
//  CheckBox
//
//  Created by Mallikarjun on 02/08/18.
//  Copyright © 2018 Ladybird Web Solution Pvt Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    
      BOOL checkBoxSelected;
}


@property (weak, nonatomic) IBOutlet UIButton *checkbox;

@property (weak, nonatomic) IBOutlet UILabel *sampleLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [_checkbox setBackgroundImage:[UIImage imageNamed:@"uncheck"]
                         forState:UIControlStateNormal];
    [_checkbox setBackgroundImage:[UIImage imageNamed:@"check"]
                         forState:UIControlStateSelected];
    [_checkbox setBackgroundImage:[UIImage imageNamed:@"check"]
                         forState:UIControlStateHighlighted];
    _checkbox.adjustsImageWhenHighlighted=YES;
    [_checkbox addTarget:self action:@selector(testMethod) forControlEvents:UIControlEventTouchDown];
    
}

-(void)testMethod{
    
    checkBoxSelected = !checkBoxSelected; /* Toggle */
    [_checkbox setSelected:checkBoxSelected];
    
    if(checkBoxSelected)
    {
        NSLog(@"Selected");
        _sampleLabel.text = @"checked";
    }else{
        NSLog(@" Not Selected");
        _sampleLabel.text = @"Unchecked";
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

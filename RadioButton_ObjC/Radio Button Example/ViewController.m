//
//  ViewController.m
//  Radio Button Example
//
//  Created by Mallikarjun on 03/10/18.
//  Copyright © 2018 Mallikarjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSIndexPath *selectedIndex;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Radio Button Example";
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UIButton *newRadioButton = (UIButton *)cell.accessoryView;
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell"];
        
        if (!newRadioButton || ![newRadioButton isKindOfClass:[UIButton class]]) {
            UIButton *newRadioButton = [UIButton buttonWithType:UIButtonTypeCustom];
            newRadioButton.frame = CGRectMake(30, 0, 15, 14.5);
            [newRadioButton setImage:[UIImage imageNamed:@"unselect"] forState:UIControlStateNormal];
            [newRadioButton setImage:[UIImage imageNamed:@"select"] forState:UIControlStateSelected];
            cell.accessoryView = newRadioButton;
        }
    }
    if ([indexPath isEqual:selectedIndex]) {
        newRadioButton.selected = YES;
    } else {
        newRadioButton.selected = NO;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Row number is %ld",(long)indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    selectedIndex = indexPath;
    [tableView reloadData];
    NSLog(@"Selected index is: %ld", (long)indexPath.row);
}




@end

//
//  ViewController.m
//  ViewTransition
//
//  Created by Emiaostein on 5/12/16.
//  Copyright © 2016 Emiaostein. All rights reserved.
//

#import "ViewController.h"
#import "UIView+ViewTransitionable.h"


@interface ViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *data1;
@property (strong, nonatomic) NSArray *data2;
@property (weak, nonatomic) NSArray *currentData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _data1 = @[
               @"Emiaostein",
               @"Courage is grace under pressure.",
               @"I not only use all the brains that I have, but all I can borrow.",
               @"Emiaostein",
               @"Courage is grace under pressure.",
               @"I not only use all the brains that I have, but all I can borrow.",
               @"Emiaostein",
               @"Courage is grace under pressure.",
               @"I not only use all the brains that I have, but all I can borrow.",
               @"Emiaostein",
               @"Courage is grace under pressure.",
               @"I not only use all the brains that I have, but all I can borrow.",
               @"Emiaostein",
               @"Courage is grace under pressure.",
               @"I not only use all the brains that I have, but all I can borrow.",
               @"Emiaostein",
               @"Courage is grace under pressure.",
               @"I not only use all the brains that I have, but all I can borrow."
               ];
    
    _data2 = @[
               @"Fang Qionghua",
               @"Love begets love, love knows no rules, this is same for all.",
               @"If you wish to reach the highest, begin at the lowest.",
               @"Fang Qionghua",
               @"Love begets love, love knows no rules, this is same for all.",
               @"If you wish to reach the highest, begin at the lowest.",
               @"Fang Qionghua",
               @"Love begets love, love knows no rules, this is same for all.",
               @"If you wish to reach the highest, begin at the lowest.",
               @"Fang Qionghua",
               @"Love begets love, love knows no rules, this is same for all.",
               @"If you wish to reach the highest, begin at the lowest.",
               @"Fang Qionghua",
               @"Love begets love, love knows no rules, this is same for all.",
               @"If you wish to reach the highest, begin at the lowest."
               
               ];
    
    _currentData = _data1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_currentData count];
}

- (IBAction)tap:(UITapGestureRecognizer *)sender {
    
    // Use Custom View Transition
    [_tableView transitionWithDuration:0.3 beforeTransition:^{
        _currentData = _currentData == _data1 ? _data2 : _data1;
        [_tableView setContentOffset:CGPointZero];
        [_tableView reloadData];
        
    } completion:^(BOOL finished) {
        if (finished) {
            NSLog(@"Transition Finished");
        }
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.textLabel.text = _currentData[indexPath.item];
    
    return cell;
}

@end

//
//  PillMainViewController.m
//  PillConsume
//
//  Created by daozhu on 14-8-5.
//  Copyright (c) 2014年 daozhu. All rights reserved.
//

#import "PillMainViewController.h"
#import "Pill.h"
#import "PillDataManager.h"


@interface PillMainViewController ()

@end

@implementation PillMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"吃药";
    self.view.backgroundColor = [UIColor colorWithRed:0.29 green:0.59 blue:0.81 alpha:1];
    [[PillDataManager instance] loadData];
    
     self.eatPillBtn = [[DKCircleButton alloc] initWithFrame:CGRectMake(115, 436 - 64, 90, 90)];
//     self.eatPillBtn.center = CGPointMake(160, 200);
     self.eatPillBtn.titleLabel.font = [UIFont systemFontOfSize:22];
    
    [ self.eatPillBtn setTitleColor:[UIColor colorWithWhite:1 alpha:1.0] forState:UIControlStateNormal];
    [ self.eatPillBtn setTitleColor:[UIColor colorWithWhite:1 alpha:1.0] forState:UIControlStateSelected];
    [ self.eatPillBtn setTitleColor:[UIColor colorWithWhite:1 alpha:1.0] forState:UIControlStateHighlighted];
    
    [ self.eatPillBtn setTitle:@"吃药" forState:UIControlStateNormal];
    [ self.eatPillBtn setTitle:@"吃药" forState:UIControlStateSelected];
    [ self.eatPillBtn setTitle:@"吃药" forState:UIControlStateHighlighted];
    
    [ self.eatPillBtn addTarget:self action:@selector(tapOnButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.eatPillBtn];

}

-(void)viewDidAppear:(BOOL)animated{
    [[PillDataManager instance] loadData];
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40.0f;
}

#pragma mark UITableViewDataSource,
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [[PillDataManager instance].pillList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Pill *pill =  (Pill*)[[PillDataManager instance].pillList objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"definestatuscell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"definestatuscell"];
    }
    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    [cell.textLabel setText: pill.name];
    
    return  cell;
    
}

- (void)tapOnButton {
//    if (buttonState) {
        [ self.eatPillBtn setTitle:@"吃药" forState:UIControlStateNormal];
        [ self.eatPillBtn setTitle:@"吃药" forState:UIControlStateSelected];
        [ self.eatPillBtn setTitle:@"吃药" forState:UIControlStateHighlighted];
        
        
//    } else {
//        [ self.eatPillBtn setTitle:NSLocalizedString(@"Stop", nil) forState:UIControlStateNormal];
//        [ self.eatPillBtn setTitle:NSLocalizedString(@"Stop", nil) forState:UIControlStateSelected];
//        [ self.eatPillBtn setTitle:NSLocalizedString(@"Stop", nil) forState:UIControlStateHighlighted];
//        
//    }
    
//    buttonState = !buttonState;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
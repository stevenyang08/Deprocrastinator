//
//  RootViewController.m
//  Deprocrastinator
//
//  Created by Steven Yang on 1/18/16.
//  Copyright © 2016 Le Mont. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController () <UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *addTextField;
@property NSMutableArray *toDoItems;
@property int counter;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeObject;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.toDoItems = [NSMutableArray new];
    self.editing = false;
    // Do any additional setup after loading the view.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell Identifier"];
    cell.textLabel.text = [self.toDoItems objectAtIndex:indexPath.row];
    //cell.textLabel.textColor
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.toDoItems.count;
}



-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.toDoItems removeObjectAtIndex:indexPath.row];
    [self.tableView reloadData];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *currenCell = [tableView cellForRowAtIndexPath:indexPath];
    if (currenCell.textLabel.textColor == [UIColor greenColor]) {
        currenCell.textLabel.textColor = [UIColor blackColor];
    }
    else
    {
        currenCell.textLabel.textColor = [UIColor greenColor];
    }
}

-(void)setEditing:(BOOL)editing animated:(BOOL)animated
{
}


#pragma mark - Action

- (IBAction)onAddButtonPressed:(UIButton *)sender {
    [self.toDoItems addObject:self.addTextField.text];
    self.addTextField.text = [NSString stringWithFormat:@""];
    [self.view endEditing:YES];
    self.counter++;
    [self.tableView reloadData];
}

- (IBAction)editButtonTapped:(UIBarButtonItem *)sender {
    if (self.editing) {
        self.editing = FALSE;
        [self.tableView setEditing:FALSE animated:YES];
        sender.style = UIBarButtonItemStylePlain;
        sender.title = @"Edit";
    }
    else
    {
        self.editing = TRUE;
        [self.tableView setEditing:TRUE animated:YES];
        sender.style = UIBarButtonItemStyleDone;
        sender.title = @"Done";
    }
    
    
}
/*
- (IBAction)changePriority:(UISwipeGestureRecognizer *)sender {
    CGPoint location = [sender locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
    location.textLabel.backgroundColor = [UIColor redColor];
 
    if (currentCell.textLabel.backgroundColor == [UIColor redColor])
    {
        currentCell.textLabel.backgroundColor = [UIColor yellowColor];
    } else if (currentCell.textLabel.backgroundColor == [UIColor yellowColor])
    {
        currentCell.textLabel.backgroundColor = [UIColor greenColor];
    }
    else if (currentCell.textLabel.backgroundColor == [UIColor greenColor])
    {
        currentCell.textLabel.backgroundColor = [UIColor redColor];
    }
 
}
*/


@end

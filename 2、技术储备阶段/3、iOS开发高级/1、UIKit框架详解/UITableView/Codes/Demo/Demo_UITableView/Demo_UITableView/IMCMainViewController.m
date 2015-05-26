//
//  IMCMainViewControllerTableViewController.m
//  Demo_UITableView
//
//  Created by zhang xianglu on 15/5/14.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCMainViewController.h"

#import "IMCCustomTableViewCell.h"

@interface IMCMainViewController ()

@property(nonatomic,strong) NSMutableArray *datas; 

@property(nonatomic,strong) NSMutableArray *selectedCellIndexPaths;

@end

@implementation IMCMainViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.title = @"系统字体";
		
		self.datas = [[UIFont familyNames] mutableCopy];
		
		self.selectedCellIndexPaths = [NSMutableArray arrayWithCapacity:20];
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	
	self.tableView.allowsSelection = YES;
	
	//self.tableView.allowsMultipleSelection = YES;
	
	//self.tableView.rowHeight = 80.0f;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - UITableView DataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	NSString *cellIdentifier = @"CustomCell";
	
	IMCCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (cell == nil) {
		cell = [[NSBundle mainBundle] loadNibNamed:@"IMCCustomTableViewCell" owner:nil options:nil][0];
		cell.photoView.image = [UIImage imageNamed:@"crying2"];
		cell.photoView.hidden = YES;
	}
	
	NSString *fontName = _datas[indexPath.row];
	cell.titleLabel.text = fontName;
	cell.titleLabel.font = [UIFont fontWithName:fontName size:20];
	
	cell.photoView.hidden = YES;
	
	for (NSIndexPath *selectedIndexPath in _selectedCellIndexPaths) {
		NSComparisonResult compareResult = [indexPath compare:selectedIndexPath];
		if (compareResult == NSOrderedSame) {
			cell.photoView.hidden = NO;
			break;
		}
	}
	
	
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - UITableView Delegate Methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 80.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	IMCCustomTableViewCell *selectedCell = (IMCCustomTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
	
	NSIndexPath *removedIndexPath = nil;
	for (NSIndexPath *selectedIndexPath in _selectedCellIndexPaths) {
		NSComparisonResult compareResult = [indexPath compare:selectedIndexPath];
		if (compareResult == NSOrderedSame) {
			selectedCell.photoView.hidden = YES;
			removedIndexPath = selectedIndexPath;
			break;
		}
	}
	
	if (removedIndexPath != nil) {
		[_selectedCellIndexPaths removeObject:removedIndexPath];
	}else {
		selectedCell.photoView.hidden = NO;
		[_selectedCellIndexPaths addObject:indexPath];
	}
	
	
	//[tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	//[tableView performSelector:@selector(deselectRowAtIndexPath:animated:) withObject:indexPath afterDelay:1.0];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
	NSLog(@"didDeselectRowAtIndexPath..");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

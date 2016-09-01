//
//  MasterViewController.m
//  LuxembourgTest
//
//  Created by Vitaliy on 8/26/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Product.h"
#import "ProductManager.h"
#import "GroupProduct.h"
#import "CustomTableViewCell.h"

@interface MasterViewController () <UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar* searchBar;

@property (strong, nonatomic) NSMutableArray* productArray;
@property (strong, nonatomic) NSMutableArray* groupProductsArray;
@property (strong, nonatomic) NSMutableArray* searchArray;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchBar.hidden = YES;
    
    self.searchBar.delegate = self;
    
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc]
                                     initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                     target:self
                                     action:@selector(search)];
    
    self.navigationItem.rightBarButtonItem = searchButton;
    
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    ProductManager* manag = [[ProductManager alloc] init];
    
    [manag createGroupsProduct];
    
    self.productArray = manag.productArray;
    
    if (!self.groupProductsArray) {
        
        self.groupProductsArray = [NSMutableArray array];
        
    } else {
        
        [self.groupProductsArray removeAllObjects];
    }
    
    for (Product* product in self.productArray) {
        
        BOOL isGroupExist = false;
        
        for (GroupProduct* group in self.groupProductsArray) {
            
            if ([group.groupProductsType isEqualToString:product.productType]) {
                
                isGroupExist = true;
                
                [group addProduct:product];
                
                break;
            }
        }
        
        if (isGroupExist == false) {
            
            GroupProduct *newGrop = [[GroupProduct alloc]
                                     initWithProduct:product];
            
            [self.groupProductsArray addObject:newGrop];
        }
    }
}

#pragma mark - UISearchBarDelegate

- (void) searchBarTextDidBeginEditing:(UISearchBar *)searchBar { // called when text starts editing
    
    [self.searchBar setShowsCancelButton:YES animated:YES];
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    [self.searchBar resignFirstResponder];
    
    [self.searchBar setShowsCancelButton:NO animated:YES];
    
    [self.searchBar setText:nil];
    
    [self.searchArray removeAllObjects];
    
    self.searchArray = nil;
    
    self.tableView.hidden = NO;
    
    [self.tableView reloadData];
    
    self.searchBar.hidden = YES;
    
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {   // called when text changes (including clear)
    
    [self filterContentForSearchText:searchText];
    
    [self.tableView reloadData];
    
}

#pragma mark - SearchBar

- (void)filterContentForSearchText:(NSString*)searchText {
    
    [self.searchArray removeAllObjects];
    
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"productTitle contains[c] %@", searchText];
    
    NSArray* rezult = [NSMutableArray arrayWithArray: [self.productArray filteredArrayUsingPredicate:resultPredicate]];
    
    self.searchArray = [rezult mutableCopy];
    
}

- (void) search {
    
    self.searchBar.hidden = NO;
}

- (NSArray*) filteredArrayInPredicate:(NSMutableArray*) array withKey:(NSString*) key withValue:(NSString*) value {
    
    NSPredicate* pred = [NSPredicate predicateWithFormat:@"%K CONTAINS[c] %@", key, value];
    
    NSArray* filteredArray = [array filteredArrayUsingPredicate:pred];
    
    return filteredArray;
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        
        Product* selectedProduct;
        
        if (self.searchArray.count == 0) {
            
            GroupProduct* group = [self.groupProductsArray objectAtIndex:indexPath.section];
            
            selectedProduct = [group.groupProductsArray objectAtIndex:[[self.tableView indexPathForSelectedRow]row]];
            
            [controller setDetailItem:selectedProduct];
            
        } else {
            
            selectedProduct = [self.searchArray objectAtIndex:[[self.tableView indexPathForSelectedRow]row]];
            
            [controller setDetailItem:selectedProduct];
            
        }
        
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
        
    }
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (self.searchBar.text.length == 0) {
        
        return self.groupProductsArray.count;
        
    } else {
        
        return 1;
    }
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (self.searchBar.text.length == 0) {
        
        GroupProduct* group = self.groupProductsArray[section];
        
        return group.groupProductsType;
        
    } else {
        
        return nil;
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.searchBar.text.length == 0) {
        
        GroupProduct * group = self.groupProductsArray[section];
        
        return group.groupProductsArray.count;
        
    } else {
        
        return self.searchArray.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* identifier = @"Cell";
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell = [[CustomTableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:identifier];
    }
    
    
    if (self.searchBar.text.length == 0) {
        
        GroupProduct* group = [self.groupProductsArray objectAtIndex:indexPath.section];
        
        cell.product = [group.groupProductsArray objectAtIndex:indexPath.row];
        
        [cell createCustomeCell];
        
        return cell;
        
    } else {
        
        cell.product = [self.searchArray objectAtIndex:indexPath.row];
        
        [cell createCustomeCell];
        
        return cell;
    }
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    editingStyle = UITableViewCellEditingStyleInsert;
}
@end

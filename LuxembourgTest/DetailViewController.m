//
//  DetailViewController.m
//  LuxembourgTest
//
//  Created by Vitaliy on 8/26/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

#import "DetailViewController.h"
#import "Product.h"

@class Product;

@interface DetailViewController ()

@property (strong, nonatomic) Product* product;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
                
        self.productImageView.image = [self.detailItem
                                       valueForKey:@"productImage"];
        self.productTitle.text = [[self.detailItem
                                   valueForKey:@"productTitle"] description];
        self.productSubtitle.text = [[self.detailItem
                                      valueForKey:@"productSubtitle"] description];
        self.productDescription.text = [[self.detailItem
                                         valueForKey:@"productDescription"] description];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.productImageView.contentMode = UIViewContentModeScaleAspectFit;

    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  CustomTableViewCell.h
//  LuxembourgTest
//
//  Created by Vitaliy on 8/30/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Product;

@interface CustomTableViewCell : UITableViewCell

@property (strong,nonatomic) Product* product;

@property (weak, nonatomic) IBOutlet UILabel* productTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel* productSubtitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView* productImageView;

- (void) createCustomeCell;


@end

//
//  CustomTableViewCell.m
//  LuxembourgTest
//
//  Created by Vitaliy on 8/30/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "Product.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
    self.productImageView.contentMode = UIViewContentModeScaleAspectFit;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
- (void) createCustomeCell {
    
    self.productTitleLabel.text = self.product.productTitle;
    self.productSubtitleLabel.text = self.product.productSubtitle;
    self.productImageView.image = self.product.productImage;
     
    
}


@end

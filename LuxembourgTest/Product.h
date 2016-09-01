//
//  Product.h
//  LuxembourgTest
//
//  Created by Vitaliy on 8/26/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Product : NSObject

@property (strong, nonatomic) NSString* productTitle;
@property (strong, nonatomic) NSString* productSubtitle;
@property (strong, nonatomic) NSString* productDescription;
@property (strong, nonatomic) UIImage* productImage;
@property (strong, nonatomic) NSString* productType;

+ (Product*) randomProduct;
@end

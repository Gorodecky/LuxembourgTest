//
//  GroupProduct.h
//  LuxembourgTest
//
//  Created by Vitaliy on 8/28/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@interface GroupProduct : NSObject

@property (strong, nonatomic) NSString* groupProductsType;
@property (strong, nonatomic) NSMutableArray* groupProductsArray;

- (id)initWithProduct:(Product *)product;

- (void)addProduct:(Product *)product;

@end

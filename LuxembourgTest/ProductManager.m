//
//  ProductManager.m
//  LuxembourgTest
//
//  Created by Vitaliy on 8/26/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

#import "ProductManager.h"
#import "Product.h"
#import "GroupProduct.h"

@implementation ProductManager

- (void) createGroupsProduct {
    
    self.productArray = [NSMutableArray array];
    
    NSMutableArray* array = [NSMutableArray array];
    
    for (int j = 0; j < (arc4random() % 11) + 15; j++) {
        
        [array addObject:[Product randomProduct]];
    }
    
    self.productArray = array;
    
    NSLog(@"%@", self.productArray);
    // [self.groupsArray addObject:group];
}


@end

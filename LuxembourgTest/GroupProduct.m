//
//  GroupProduct.m
//  LuxembourgTest
//
//  Created by Vitaliy on 8/28/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

#import "GroupProduct.h"

@implementation GroupProduct

- (id)initWithProduct:(Product *)product {
    self = [super init];
    
    if (self) {
        
        self.groupProductsType = product.productType;
        self.groupProductsArray = [NSMutableArray array];
        [self.groupProductsArray addObject:product];
    }
    return self;
}

- (void)addProduct:(Product *)product {
    
    if (self.groupProductsArray ) {
        
        [self.groupProductsArray addObject:product];
        
    } else {
        
        NSLog(@"Trouble");
    }
}

- (NSString *) description {
    return [NSString stringWithFormat:@"Nsme = %@ product count = %lu",self.groupProductsType, (unsigned long)self.groupProductsArray.count];
        
}

@end

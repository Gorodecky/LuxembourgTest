//
//  ProductManager.h
//  LuxembourgTest
//
//  Created by Vitaliy on 8/26/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductManager : NSObject

@property (strong, nonatomic) NSMutableArray* productArray;

- (void) createGroupsProduct;

@end

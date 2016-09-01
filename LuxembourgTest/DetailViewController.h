//
//  DetailViewController.h
//  LuxembourgTest
//
//  Created by Vitaliy on 8/26/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UIImageView* productImageView;
@property (weak, nonatomic) IBOutlet UILabel* productTitle;
@property (weak, nonatomic) IBOutlet UILabel* productSubtitle;
@property (weak, nonatomic) IBOutlet UILabel* productDescription;


@end


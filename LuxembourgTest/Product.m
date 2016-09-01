//
//  Product.m
//  LuxembourgTest
//
//  Created by Vitaliy on 8/26/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

#import "Product.h"

@implementation Product

static NSString* productTitle[] = {
    @"Хлеб", @"Кросовки", @"Погремушка", @"Водка",
    @"Вино", @"Сок", @"Молоко", @"Печенье", @"Майка",
    @"Носки", @"Ябоки", @"Огурец", @"Джинсы", @"Кеды",
    @"Макароны", @"Картофель", @"Полувер", @"Трусы",
    @"Носки", @"Конфеты", @"Мясо", @"Сало", @"Укроп",
    @"Банан", @"Шарики", @"Конструктор", @"Кукла",
    @"Кофе", @"Чай"
};

static NSString* productSubtitle[] = {
    @"Ласунка", @"Наша ряба", @"Bayer", @"Adidas", @"Nike",
    @"Ecco", @"Простоквашино", @"Nemiroff", @"Юдашкин", @"Конти",
    @"Roshen", @"Kolbaskoff", @"Арианда", @"Nestle", @"Neskafe",
    @"Lipton", @"Chicco"
};

static NSString* productType[] = {
    @"Продукты", @"Напитки", @"Игрушки", @"Одежда", @"Обувь"
};

static NSString* productDescription[] = {
    @"Хороший",
    @"Плохой"
};

static NSString* productImageNamed [] = {
    @"product1.png",
    @"product2.png",
    @"product3.png"
};

static int productCount = 27;
static int productTypeCount = 5;
static int productSubtitleCount = 17;
static int productDescriptionCount = 2;
static int productImageNamedCount = 3;

+ (Product*) randomProduct {
    
    Product* product = [[Product alloc] init];
    product.productTitle = productTitle[arc4random() % productCount];
    product.productSubtitle = productSubtitle[arc4random() % productSubtitleCount];
    product.productType = productType[arc4random() % productTypeCount];
    product.productDescription = productDescription[arc4random() % productDescriptionCount];
    product.productImage = [UIImage
                            imageNamed:productImageNamed[arc4random() % productImageNamedCount]];
    
    return product;
}

@end

//
//  OZAnimal.h
//  InteractiveTransition
//
//  Created by Kiattisak Anoochitarom on 5/28/2557 BE.
//  Copyright (c) 2557 Kiattisak Anoochitarom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OZAnimal : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *description;

+ (NSArray *)exampleAnimals;

- (instancetype)initWithTitle:(NSString *)title
                  description:(NSString *)desc
                     andImage:(UIImage *)image;

@end

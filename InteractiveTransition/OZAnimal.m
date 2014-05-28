//
//  OZAnimal.m
//  InteractiveTransition
//
//  Created by Kiattisak Anoochitarom on 5/28/2557 BE.
//  Copyright (c) 2557 Kiattisak Anoochitarom. All rights reserved.
//

#import "OZAnimal.h"

@implementation OZAnimal

+ (NSArray *)exampleAnimals {
    return @[
             [[OZAnimal alloc] initWithTitle:@"Animal 1"
                                 description:@"Drumstick cow beef fatback turkey boudin. Meatball leberkas boudin hamburger pork belly fatback."
                                    andImage:[UIImage imageNamed:@"thing01"]],
             [[OZAnimal alloc] initWithTitle:@"Animal 2"
                                 description:@"Shank pastrami sirloin, sausage prosciutto spare ribs kielbasa tri-tip doner."
                                    andImage:[UIImage imageNamed:@"thing02"]],
             [[OZAnimal alloc] initWithTitle:@"Animal 3"
                                 description:@"Frankfurter cow filet mignon short loin ham hock salami meatloaf biltong andouille bresaola prosciutto."
                                    andImage:[UIImage imageNamed:@"thing03"]],
             [[OZAnimal alloc] initWithTitle:@"Animal 4"
                                 description:@"Pastrami sausage turkey shank shankle corned beef."
                                    andImage:[UIImage imageNamed:@"thing04"]],
             [[OZAnimal alloc] initWithTitle:@"Animal 5"
                                 description:@"Tri-tip short loin pork belly, pastrami biltong ball tip ham hock. Shoulder ribeye turducken shankle."
                                    andImage:[UIImage imageNamed:@"thing05"]]
             ];
}

- (instancetype)initWithTitle:(NSString *)title
                  description:(NSString *)desc
                     andImage:(UIImage *)image {
    if (!(self = [super init])) {
        return nil;
    }
    
    _title = title;
    _description = desc;
    _image = image;
    
    return self;
}

@end

//
//  Movie.h
//  tomatoes
//
//  Created by subha on 1/20/14.
//  Copyright (c) 2014 subha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *synopsis;
@property (nonatomic, strong) NSString *cast;
@property (nonatomic, strong) NSURL *imageUrl;
@property (nonatomic, strong) NSURL *fullImageUrl;

+ (NSArray*)createMoviesArrayFromDictionary:(NSDictionary *)dictionary;

@end

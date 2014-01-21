//
//  Movie.m
//  tomatoes
//
//  Created by subha on 1/20/14.
//  Copyright (c) 2014 subha. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (id)initWithTitle:(NSString*)title synopsis:(NSString*)synopsis cast:(NSString*)cast imageUrl:(NSURL *)url{
    self = [super init];
    if (self) {
        self.title = title;
        self.synopsis = synopsis;
        self.cast = cast;
        self.imageUrl = url;
    }
    
    return self;
}

+ (NSArray*) createMoviesArrayFromDictionary:(NSDictionary *)moviesDictionary
{
    NSMutableArray* movies = [[NSMutableArray alloc] init];
    for (NSDictionary* movieDictionary in moviesDictionary) {
        NSString* title = [movieDictionary objectForKey:@"title"];
        NSString* synopsis = [movieDictionary objectForKey:@"synopsis"];
        NSString *urlString = [[movieDictionary objectForKey:@"posters"] objectForKey:@"profile"];
        NSURL* url = [NSURL URLWithString:urlString];
        
        NSMutableString* cast = [[NSMutableString alloc] init];
        
        for (NSDictionary* castMember in [movieDictionary objectForKey:@"abridged_cast"]) {
            NSString* castMemberName = [castMember objectForKey:@"name"];
            [cast appendString:castMemberName];
            [cast appendString:@", "];
        }
        
        [movies addObject:[[Movie alloc] initWithTitle:title synopsis:synopsis cast:cast imageUrl:url]];
    }
    
    return movies;
}

@end

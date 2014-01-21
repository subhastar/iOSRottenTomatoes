//
//  MoviesViewController.m
//  tomatoes
//
//  Created by subha on 1/20/14.
//  Copyright (c) 2014 subha. All rights reserved.
//

#import "MoviesViewController.h"
#import "MovieViewController.h"
#import "MovieCell.h"
#import "MBProgressHUD.h"
#import "ErrorView.h"

@interface MoviesViewController ()

@property (nonatomic, strong) NSArray *movies;

- (void)setup;
- (void)reload;

@end

@implementation MoviesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setup];
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    if (self.movies == nil) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }
}

#pragma mark - Table view methods

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.movies.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieCell *cell = (MovieCell*) [tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
    cell.movie = self.movies[indexPath.row];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UITableViewCell *selectedCell = (UITableViewCell *)sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:selectedCell];
    Movie *movie = self.movies[indexPath.row];
    
    MovieViewController *movieViewController = (MovieViewController *)segue.destinationViewController;
    movieViewController.movie = movie;
}

#pragma mark - Private methods

- (void) setup
{
    [self reload];
}


- (void) reload
{
    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               if (connectionError != nil) {
                                   NSLog(@"in here");
                                   CGRect rect = CGRectMake(0,0,20,20);
                                   ErrorView *ui = [[ErrorView alloc] initWithFrame:rect];
                                   [self.view addSubview:ui];
                                   return;
                               }
                               NSDictionary* object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                               NSDictionary * moviesDictionary = [object objectForKey:@"movies"];
                               self.movies = [Movie createMoviesArrayFromDictionary:moviesDictionary];
                               [self.tableView reloadData];
                               [MBProgressHUD hideHUDForView:self.view animated:YES];
                           }];

}

@end

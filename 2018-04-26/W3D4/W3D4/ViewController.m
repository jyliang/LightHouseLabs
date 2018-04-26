//
//  ViewController.m
//  W3D4
//
//  Created by Jason Liang on 4/26/18.
//  Copyright © 2018 jasonliang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>

@property (nonatomic, strong) NSArray *results;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    
    NSString *urlString = @"https://swapi.co/api/people";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request;
//    NSMutableURLRequest
    request = [[NSURLRequest alloc] initWithURL:url];
//    request.HTTPMethod = @"POST";
//    NSData *data = [@"some sort body" dataUsingEncoding:NSUTF8StringEncoding];
//    request.HTTPBody = data;
    NSURLSessionTask *task;
    NSURLSession *session = [NSURLSession sharedSession];
    task = [session dataTaskWithRequest:request
                      completionHandler:
            ^(NSData * _Nullable data,
              NSURLResponse * _Nullable response,
              NSError * _Nullable error) {
                NSLog(@"got result");
                if (error) {
                    //do something
                }
                [self parseResponseData:data];
    }];
    [task resume];
//    [task cancel];

}

- (void)parseResponseData:(NSData *)data {
    NSError *error;
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (error) {
        //do something
    }
    self.results = result[@"results"];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.results.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSDictionary *item = self.results[indexPath.row];
    cell.textLabel.text = item[@"name"];
    return cell;
}


@end

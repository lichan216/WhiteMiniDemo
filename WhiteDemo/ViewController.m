//
//  ViewController.m
//  WhiteDemo
//
//  Created by libertychen on 2018/8/15.
//  Copyright © 2018年 libertychen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGRect rect = CGRectMake(20, 80, (screenSize.width - 20 *2), (screenSize.height - 120));
    self.imageView = [[UIImageView alloc] initWithFrame:rect];
    self.imageView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.imageView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
//    // one way to create the image
//    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"problemImage" ofType:@"heic"];
//    UIImage *image1 = [UIImage imageWithContentsOfFile:path1];
//    imageView.image = image1;
//    self.imageView.image = image1;
    

    // another way to create the image
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"problemImage" ofType:@"heic"];
    NSData *data = [NSData dataWithContentsOfFile:path2 options:0 error:nil];
    CFDataRef dataRef = (__bridge CFDataRef)data;
    CGImageSourceRef source = CGImageSourceCreateWithData(dataRef, nil);
    CGImageRef cgImage = CGImageSourceCreateImageAtIndex(source, 0, nil);
    UIImage *image2 = [UIImage imageWithCGImage:cgImage];
    self.imageView.image = image2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

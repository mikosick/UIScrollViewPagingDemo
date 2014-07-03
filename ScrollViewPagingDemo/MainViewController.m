//
//  MainViewController.m
//  ScrollViewPagingDemo
//
//  Created by mikosick on 2014/07/04.
//  Copyright (c) 2014年 InasePictures. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    // 地図View
    UIView *mapView = [[UIView alloc] init];
    mapView.frame = CGRectMake(10, 100, 300, 400);
    mapView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:mapView];
    
    // スクローラーを載せるラベル設定（余白を含む透明のビュー）
    UIView *scrollerRootView = [[UIView alloc] init];
    scrollerRootView.frame = CGRectMake(0, 300, 300, 54);
    [mapView addSubview:scrollerRootView];
    scrollerRootView.backgroundColor = [UIColor clearColor];  // 透明だけど使えるViewとして存在させる(本当はこの行は不要)
    scrollerRootView.clipsToBounds = YES; //このラベルをはみ出た画像は見えないようにする
    
    // スクローラーの設定
    UIScrollView *scroller = [[UIScrollView alloc] init];
    scroller.frame = CGRectMake(11, 0, 278, 54);
    scroller.clipsToBounds = NO; // スクローラーをはみ出ても画像が見える様にする
    scroller.bounces = NO;  // 弾ませない
    scroller.showsHorizontalScrollIndicator = NO;  // スクロールバーを出さない
    scroller.pagingEnabled = YES; // ページングを許可
    [scrollerRootView addSubview:scroller];
    
    
    // スクローラーにコンテンツを載せる（5ページ分）
    for (int i = 0; i < 5; i++) {
        UIView *scrollerView = [[UIView alloc] init];  //
        float color = (i + 1.0) / 5.0;
        scrollerView.backgroundColor = [UIColor colorWithRed:color green:color blue:color alpha:1]; //ページごとに色を変えてみる
        NSLog(@"%f",color);
        [scroller setContentSize:CGSizeMake((274+2+2)*(i+1), 54)]; // スクロールする全体の範囲
        scrollerView.frame = CGRectMake(2+(274+2+2)*(i), 0, 274, 54); // ページングする下地のView分移動して配置
        [scroller addSubview:scrollerView];
    }
    
    // スクローラーの初期位置を1ページ目の位置にする
    [scroller setContentOffset:CGPointMake(0, 0) animated:YES];

}

@end

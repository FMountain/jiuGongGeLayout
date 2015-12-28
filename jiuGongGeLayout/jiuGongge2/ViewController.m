//
//  ViewController.m
//  jiuGongge2
//
//  Created by mac on 15/12/28.
//  Copyright © 2015年 A3. All rights reserved.
//

#import "ViewController.h"
#import "collectionCell.h" 

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCollection];
}

- (void)setupCollection{
    self.dataMArr = [NSMutableArray array];

    for (NSInteger index = 0; index < 9; index++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",(long)index + 1]];
        NSString *title = [NSString stringWithFormat:@"{0,%ld}",(long)index+1];
        NSDictionary *dic = @{@"image":image,@"title":title};
        [self.dataMArr addObject:dic];
    }
    self.myCollection.delegate = self;
    self.myCollection.dataSource = self;
    
    
}
#pragma mark - Collection View Data Source
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataMArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *collectionCellID = @"myCollectionCell";
    collectionCell *cell = (collectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:collectionCellID forIndexPath:indexPath];
    
    NSDictionary *dict   = self.dataMArr[indexPath.row];
    UIImage *image       = dict[@"image"];
    NSString *title      = dict[@"title"];

    cell.imageView.image = image;
    cell.titleLabel.text = title;
    
    return cell;
};
@end
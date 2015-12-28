//
//  ViewController.h
//  jiuGongge2
//
//  Created by mac on 15/12/28.
//  Copyright © 2015年 A3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet UICollectionView *myCollection;
@property (strong, nonatomic)NSMutableArray *dataMArr;


@end


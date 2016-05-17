//
//  ViewController.m
//  UICollectionView
//
//  Created by jianfeng on 15/3/3.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"

#define kID @"Cell"
#define kItemWidth 100
#define kItemHeight 100

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *collectionView;
    NSArray *array;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    [self initData];
    
}

- (void)initView
{
    // layout是UICollectionView的精髓
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    
    // 向collectionView注册Cell
    UINib *nib = [UINib nibWithNibName:@"Cell" bundle:nil] ;
    [collectionView registerNib:nib forCellWithReuseIdentifier:kID];
}

- (void)initData
{
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i = 0; i < 8; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%02d.jpg",i+1];
        [mArray addObject:imageName];
    }
    array = mArray;
}

#pragma mark - UICollectionViewDataSource

// 展示的格子的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return array.count;
}

// 每个cell的样式
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView1 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // indexPath.row     表示对应组的第几个item(不是第几行)
    // indexPath.secton  表示第几组
    Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kID forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:array[indexPath.row]];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.得到图片的宽高
    UIImage *image = [UIImage imageNamed:array[indexPath.row]];
    CGFloat width = image.size.width / 4.0;
    CGFloat height = image.size.height / 4.0;
    CGFloat ratio = width/height;
    return CGSizeMake(width, height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20, 30, 20, 30);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 30;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 20;
}




@end

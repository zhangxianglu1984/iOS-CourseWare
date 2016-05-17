//
//  ViewController.m
//  ImagePicker
//
//  Created by jianfeng on 15/3/24.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 判断sourceType是不是可用
    if( [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
        // 拍照和选择相册图片都是使用这个控件
        UIImagePickerController *ipc = [[UIImagePickerController alloc]init];
        ipc.delegate = self;
        // 选择照片来源
        ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        ipc.allowsEditing = YES;
        [self presentViewController:ipc animated:YES completion:nil];
    }
    else if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        // 拍照和选择相册图片都是使用这个控件
        UIImagePickerController *ipc = [[UIImagePickerController alloc]init];
        ipc.delegate = self;
        // 选择照片来源
        ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:ipc animated:YES completion:nil];
    }
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"%@",info);
    UIImage *image = nil;
    if (info[UIImagePickerControllerEditedImage]) {
        image = info[UIImagePickerControllerEditedImage];
    }
    else{
        image = info[UIImagePickerControllerOriginalImage];
    }
    
    self.imageView.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}



@end

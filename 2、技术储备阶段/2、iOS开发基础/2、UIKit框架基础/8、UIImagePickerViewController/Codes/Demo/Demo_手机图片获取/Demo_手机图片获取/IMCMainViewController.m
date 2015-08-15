//
//  IMCMainViewController.m
//  Demo_手机图片获取
//
//  Created by zhang xianglu on 15/7/2.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCMainViewController.h"

@interface IMCMainViewController () <UIActionSheetDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>

- (IBAction)pickImageButtonClickedAction:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

- (void)openLocalAlbum;

- (void)openLocalCamera;

@end

@implementation IMCMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
	_photoImageView.layer.borderWidth = 1.0f;
	_photoImageView.layer.borderColor = [UIColor grayColor].CGColor;
	
	_photoImageView.layer.cornerRadius = 100.0f;
	
	_photoImageView.layer.masksToBounds = YES;
	
}

- (IBAction)pickImageButtonClickedAction:(UIButton *)sender {
	UIActionSheet *actionSheet = nil;
	
	//判断摄像是否可用
	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
		//上拉菜单UIActionSheet
		actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles: @"拍照",@"从相册选择",nil];	
		
	}else {
		//上拉菜单UIActionSheet
		actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"从相册选择",nil];	
	}

	//显示上拉菜单
	[actionSheet showInView:self.view];
}

#pragma mark - UIActionSheet Delegate Methods
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
	switch (buttonIndex) {
		//拍照
		case 0:{
			[self openLocalCamera];
			break;
		}
		//从相册选择
		case 1:{
			[self openLocalAlbum];
			break;
		}
  		default:
			break;
	}
}


#pragma mark - UIImagePickerController Delegate Methods
/**
 *  当用户选择了一张图片时，调用
 */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	//获取用户选择的图片
	UIImage *pickedPhotoImage = info[UIImagePickerControllerOriginalImage];
	
	//通过偏好设置存储图片 plist == Foundation 基本类型 NSString NSInteger 
	
	
	//对象归档===>存放对象
//	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//	[userDefaults setObject:pickedPhotoImage forKey:@"userPhoto"];
//	[userDefaults synchronize];
	
	//设置图片
	_photoImageView.image = pickedPhotoImage;
	
	//隐藏UIImagePickerController
	[picker dismissViewControllerAnimated:YES completion:nil];
}

/**
 *  用户取消图片选择时，调用
 */
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
	[picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Private Methods
/**
 *  打开本地相册NS_ENUM(枚举元素类型,枚举类型名)
 */
- (void)openLocalAlbum {
	UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
	
	//选择图片源
	imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
	
	//设置代理
	imagePickerController.delegate = self;
	
	//呈现图片选择界面
	[self presentViewController:imagePickerController animated:YES completion:nil];
}

/**
 *  打开摄像头拍照
 */
- (void)openLocalCamera {
	UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
	
	//选择图片源
	imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
	
	//设置代理
	imagePickerController.delegate = self;
	
	//呈现图片选择界面
	[self presentViewController:imagePickerController animated:YES completion:nil];
	
}







@end

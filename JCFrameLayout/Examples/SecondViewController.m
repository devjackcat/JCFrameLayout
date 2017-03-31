//
//  SecondViewController.m
//  JCFrameLayout
//
//  Created by abc on 17/3/27.
//  Copyright © 2017年 jackcat. All rights reserved.
//

#import "SecondViewController.h"


#import "JCFrameLayout.h"


@interface SecondViewController ()
/**
 *  <#注释#>
 **/
@property (nonatomic,strong) UIView *redView;

/**
 *  <#注释#>
 **/
@property (nonatomic,strong) UIView *greenView;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.redView = [[UIView alloc]init];
    self.redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.redView];
    
    self.greenView = [[UIView alloc]init];
    self.greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.greenView];
    
    self.redView.jc_debug_key = @"redView";
    [self.redView jc_makeLayout:^(JCFrameMake *make) {
        make.center.jc_equalTo(CGPointMake(100, 100));
        make.size.jc_equalTo(CGSizeMake(100, 100));
    }];
    
    self.greenView.jc_debug_key = @"greenView";
    [self.greenView jc_makeLayout:^(JCFrameMake *make) {
        
//        25. left and right and top and bottom
//        make.left.top.jc_equalTo(20);
//        make.right.bottom.jc_equalTo(-20);
        make.left.top.equalTo(self.redView).jc_offset(-10);
        make.right.bottom.equalTo(self.redView).jc_offset(10);
        
//        24. right and top and bottom and width
//        make.right.equalTo(self.redView);
//        make.right.jc_equalTo(-50);
////        make.top.equalTo(self.redView.jc_centerY);
//        make.top.jc_equalTo(20);
//        make.bottom.equalTo(self.redView);
////        make.bottom.jc_equalTo(-50);
//        make.width.equalTo(self.redView);
        
//        23. left and top and bottom and width
//        make.left.equalTo(self.redView.jc_right);
////        make.top.equalTo(self.redView.jc_centerY);
//        make.top.jc_equalTo(20);
//        make.bottom.equalTo(self.redView);
////        make.bottom.jc_equalTo(-50);
//        make.width.equalTo(self.redView);
        
//        22. left and right and bottom and height
//        make.left.equalTo(self.redView);
//        make.right.equalTo(self.redView.jc_centerX);
//        make.bottom.equalTo(self.redView.jc_top);
//        make.height.equalTo(self.redView);
        
//        21. left and right and top and height
//        make.left.equalTo(self.redView.jc_centerX);
//        make.right.equalTo(self.redView);
//        make.top.equalTo(self.redView.jc_bottom);
//        make.height.equalTo(self.redView);
        
//        20. right and bottom and width and height
//        make.right.equalTo(self.redView.jc_centerX);
//        make.bottom.equalTo(self.redView.jc_centerY);
//        make.width.height.equalTo(self.redView);
        
//        19. right and top and width and height
//        make.right.equalTo(self.redView.jc_centerX);
//        make.top.equalTo(self.redView.jc_bottom);
//        make.width.height.equalTo(self.redView);
        
//        18. left and bottom and width and height
//        make.left.equalTo(self.redView.jc_right);
//        make.bottom.equalTo(self.redView.jc_centerY);
//        make.width.height.equalTo(self.redView);
        
//        17. left and top and width and height
//        make.left.equalTo(self.redView.jc_right);
//        make.top.equalTo(self.redView.jc_bottom);
//        make.width.height.equalTo(self.redView);
        
//        16. centerY and right and width and height
//        make.centerY.equalTo(self.redView.jc_bottom);
//        make.right.equalTo(self.redView.jc_centerX);
//        make.width.equalTo(self.redView);
//        make.height.equalTo(self.redView);
        
//        15. centerY and left and width and height
//        make.centerY.equalTo(self.redView.jc_bottom);
//        make.left.equalTo(self.redView.jc_right);
//        make.width.equalTo(self.redView);
//        make.height.equalTo(self.redView);
        
//        14. centerX and bottom and width and height
//        make.centerX.equalTo(self.redView.jc_bottom);
//        make.bottom.equalTo(self.redView.jc_centerY);
//        make.width.equalTo(self.redView);
//        make.height.equalTo(self.redView);
        
//        13. centerX and top and width and height
//        make.centerX.equalTo(self.redView.jc_right);
//        make.top.equalTo(self.redView.jc_bottom);
//        make.width.equalTo(self.redView);
//        make.height.equalTo(self.redView);
        
//        12. centerX and centerY and width and height
//        make.centerX.equalTo(self.redView.jc_left);
//        make.centerY.equalTo(self.redView.jc_top);
//        make.width.equalTo(self.redView).multipliedBy(1.5);
//        make.height.equalTo(self.redView).multipliedBy(2);
        
//        11. right and bottom and size
//        make.right.equalTo(self.redView.jc_left);
//        make.bottom.equalTo(self.redView.jc_top);
//        make.size.equalTo(self.redView).multipliedBy(2);
        
//        10. right and top and size
//        make.right.equalTo(self.redView.jc_left);
//        make.top.equalTo(self.redView.jc_bottom);
//        make.size.equalTo(self.redView).multipliedBy(2);
        
//        9. left and bottom and size
//        make.left.equalTo(self.redView.jc_right);
//        make.bottom.equalTo(self.redView.jc_top);
//        make.size.equalTo(self.redView).multipliedBy(2);
        
//        8. left and top and size
//        make.left.equalTo(self.redView.jc_right);
//        make.top.equalTo(self.redView.jc_bottom);
//        make.size.equalTo(self.redView).multipliedBy(2);
        
//        7. centerY and right and size
//        make.centerY.equalTo(self.redView.jc_bottom);
//        make.right.equalTo(self.redView.jc_left);
//        make.size.equalTo(self.redView);
        
//        6. centerY and left and size
//        make.centerY.equalTo(self.redView.jc_top);
//        make.left.equalTo(self.redView.jc_right);
//        make.size.equalTo(self.redView).multipliedBy(2);
        
//        5. centerX and bottom and size
//        make.centerX.equalTo(self.redView);
//        make.bottom.equalTo(self.redView);
//        make.size.equalTo(self.redView).multipliedBy(1.5).jc_offset(CGSizeMake(10, 10));
        
//        4. centerX and top and size
//        make.centerX.equalTo(self.redView.jc_right);
//        make.top.equalTo(self.redView.jc_centerY);
//        make.size.equalTo(self.redView).multipliedBy(2).jc_offset(CGSizeMake(10, 10));
        
//        3. centerX and centerY and size
//        make.centerX.equalTo(self.redView.jc_right);
//        make.centerY.equalTo(self.redView.jc_bottom);
//        make.size.equalTo(self.redView).multipliedBy(2).jc_offset(CGSizeMake(10, 10));
        
//        2. center and width and height
//        make.width.height.equalTo(self.redView).multipliedBy(2).jc_offset(10);
//        make.center.equalTo(self.redView);
        
//        1. center and size
//        make.center.equalTo(self.redView).multipliedBy(2).jc_offset(CGPointMake(10, 10));
//        make.size.equalTo(self.redView).multipliedBy(2).jc_offset(CGSizeMake(10, 10));
    }];
    
    [self.view bringSubviewToFront:self.redView];
    
    NSLog(@"self.redView.frame = %@",[NSValue valueWithCGRect:self.redView.frame]);
    NSLog(@"self.greenView.frame = %@",[NSValue valueWithCGRect:self.greenView.frame]);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

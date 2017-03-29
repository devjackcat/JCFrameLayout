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
    
    [self.redView jc_makeLayout:^(JCFrameMake *make) {
        
//        25. left and right and top and bottom
//        make.left.jc_equalTo(50);
//        make.right.jc_equalTo(-50);
//        make.top.jc_equalTo(50);
//        make.bottom.jc_equalTo(-50);
        
//        24. right and top and bottom and width
//        make.right.jc_equalTo(-50);
//        make.top.jc_equalTo(50);
//        make.bottom.jc_equalTo(-50);
//        make.width.jc_equalTo(100);
        
//        23. left and top and bottom and width
//        make.left.jc_equalTo(50);
//        make.top.jc_equalTo(50);
//        make.bottom.jc_equalTo(-50);
//        make.width.jc_equalTo(100);
        
//        22. left and right and bottom and height
//        make.left.jc_equalTo(50);
//        make.right.jc_equalTo(-50);
//        make.bottom.jc_equalTo(-50);
//        make.height.jc_equalTo(100);
        
//        21. left and right and top and height
//        make.left.jc_equalTo(50);
//        make.right.jc_equalTo(-50);
//        make.top.jc_equalTo(50);
//        make.height.jc_equalTo(100);
        
        
//        20. right and bottom and width and height
//        make.right.jc_equalTo(-50);
//        make.bottom.jc_equalTo(-50);
//        make.height.jc_equalTo(100);
//        make.width.jc_equalTo(100);
        
//        19. right and top and width and height
//        make.right.jc_equalTo(-50);
//        make.top.jc_equalTo(50);
//        make.height.jc_equalTo(100);
//        make.width.jc_equalTo(100);
        
//        18. left and bottom and width and height
//        make.left.jc_equalTo(50);
//        make.bottom.jc_equalTo(-50);
//        make.height.jc_equalTo(100);
//        make.width.jc_equalTo(100);
//
//        17. left and top and width and height
//        make.left.jc_equalTo(50);
//        make.top.jc_equalTo(50);
//        make.height.jc_equalTo(100);
//        make.width.jc_equalTo(100);
        
//        16. centerY and right and width and height
//        make.centerY.jc_equalTo(100);
//        make.right.jc_equalTo(-100);
//        make.width.jc_equalTo(100);
//        make.height.jc_equalTo(100);
        
//        15. centerY and left and width and height
//        make.centerY.jc_equalTo(100);
//        make.left.jc_equalTo(100);
//        make.width.jc_equalTo(100);
//        make.height.jc_equalTo(100);
        
//        14. centerX and bottom and width and height
//        make.centerX.jc_equalTo(100);
//        make.bottom.jc_equalTo(-50);
//        make.width.jc_equalTo(100);
//        make.height.jc_equalTo(100);
        
//        13. centerX and top and width and height
//        make.centerX.jc_equalTo(100);
//        make.top.jc_equalTo(100);
//        make.width.jc_equalTo(100);
//        make.height.jc_equalTo(100);
        
//        12. centerX and centerY and width and height
//        make.centerX.jc_equalTo(100);
//        make.centerY.jc_equalTo(100);
//        make.width.jc_equalTo(100);
//        make.height.jc_equalTo(100);
        
//        11. right and bottom and size
//        make.right.jc_equalTo(-50);
//        make.bottom.jc_equalTo(-50);
//        make.size.jc_equalTo(CGSizeMake(100, 100));
        
//        10. right and top and size
//        make.right.jc_equalTo(-50);
//        make.top.jc_equalTo(100);
//        make.size.jc_equalTo(CGSizeMake(100, 100));
        
//        9. left and bottom and size
//        make.left.jc_equalTo(100);
//        make.bottom.jc_equalTo(50);
//        make.size.jc_equalTo(CGSizeMake(100, 100));
        
//        8. left and top and size
//        make.left.jc_equalTo(100);
//        make.top.jc_equalTo(100);
//        make.size.jc_equalTo(CGSizeMake(100, 100));
        
//        7. centerY and right and size
//        make.centerY.jc_equalTo(100);
//        make.right.jc_equalTo(-50);
//        make.size.jc_equalTo(CGSizeMake(100, 100));
        
//        6. centerY and left and size
//        make.centerY.jc_equalTo(200);
//        make.left.jc_equalTo(100);
//        make.size.jc_equalTo(CGSizeMake(200, 200));
        
//        5. centerX and bottom and size
//        make.centerX.jc_equalTo(100);
//        make.size.jc_equalTo(CGSizeMake(100, 100));
//        make.bottom.jc_equalTo(-50);
        
//        4. centerX and top and size
//        make.centerX.jc_equalTo(100);
//        make.top.jc_equalTo(50);
//        make.size.jc_equalTo(CGSizeMake(100, 100));
        
//        3.centerX and centerY and size
//        make.centerX.jc_equalTo(100);
//        make.centerY.jc_equalTo(100);
//        make.size.jc_equalTo(CGSizeMake(100, 100));
        
//        2. center and width and height
//        make.center.jc_equalTo(CGPointMake(100, 100));
//        make.width.jc_equalTo(200);
//        make.height.jc_equalTo(200);
        
//        1. center and size
//        make.center.jc_equalTo(CGPointMake(100, 100));
//        make.size.jc_equalTo(CGSizeMake(100, 100));
    }];
    
//    [self.greenView jc_makeLayout:^(JCFrameMake *make) {
//        make.left.jc_equalTo(50);
//        make.width.jc_equalTo(100);
//
//        make.top.jc_equalTo(50);
//        make.height.jc_equalTo(100);
//    }];
    
    NSLog(@"self.redView.frame = %@",[NSValue valueWithCGRect:self.redView.frame]);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

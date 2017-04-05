# JCFrameLayout

JCFrameLayout是一个类似Masonry的布局工具，与Masonry不同的是JCFrameLayout采用的是Frame布局而非约束布局。

感兴趣的可以加QQ群交流：70835656 (JC开源项目交流)


# 性能对比

暂时省略，后面补充

# 特性

* **高性能** : 原始的Frame布局，避免AutoLayout带来的性能问题
* **无侵入性** : 零继承，通过UIView的Category实现
* **使用简单** : 使用大家熟悉的Masonry语法

# 使用方式

### 上、下、左、右、中间效果

```
//靠左边的视图
UIView *leftView = [[UIView alloc]init];
    leftView.backgroundColor = radomColor;
    [self.view addSubview:leftView];
    leftView.jc_debug_key = @"leftView";
    [leftView jc_makeLayout:^(JCFrameMake *make) {
        make.width.jc_equalTo(50);
        make.top.jc_equalTo(50 + 64);
        make.bottom.jc_equalTo(-50);
        make.left.jc_equalTo(0);
    }];
    
    //靠右边的视图
    UIView *rightView = [[UIView alloc]init];
    rightView.backgroundColor = radomColor;
    [self.view addSubview:rightView];
    rightView.jc_debug_key = @"rightView";
    [rightView jc_makeLayout:^(JCFrameMake *make) {
        make.width.jc_equalTo(50);
        make.top.jc_equalTo(50 + 64);
        make.bottom.jc_equalTo(-50);
        make.right.jc_equalTo(0);
    }];
    
    //靠顶部的视图
    UIView *topView = [[UIView alloc]init];
    topView.backgroundColor = radomColor;
    [self.view addSubview:topView];
    topView.jc_debug_key = @"topView";
    [topView jc_makeLayout:^(JCFrameMake *make) {
        make.top.jc_equalTo(64);
        make.height.jc_equalTo(50);
        make.left.jc_equalTo(50);
        make.right.jc_equalTo(-50);
    }];
    
    //靠底部的视图
    UIView *bottomView = [[UIView alloc]init];
    bottomView.backgroundColor = radomColor;
    [self.view addSubview:bottomView];
    bottomView.jc_debug_key = @"bottomView";
    [bottomView jc_makeLayout:^(JCFrameMake *make) {
        make.height.jc_equalTo(50);
        make.left.jc_equalTo(50);
        make.right.jc_equalTo(-50);
        make.bottom.jc_equalTo(0);
    }];
    
    //中间的内切视图
    UIView *centerView = [[UIView alloc]init];
    centerView.backgroundColor = radomColor;
    [self.view addSubview:centerView];
    centerView.jc_debug_key = @"centerView";
    [centerView jc_makeLayout:^(JCFrameMake *make) {
        make.left.equalTo(leftView.jc_right);
        make.top.equalTo(topView.jc_bottom);
        make.right.equalTo(rightView.jc_left);
        make.bottom.equalTo(bottomView.jc_top);
    }];
    [self.view sendSubviewToBack:centerView];
```

### 九宫格(绝对布局,每个方块都相对于屏幕左上角进行布局)

```
//列数
    int column = 3;
    //内间距
    CGFloat padding = 20;
    //每个方块尺寸
    CGFloat width = (JC_SCREEN_WIDTH - padding * (column + 1))/column;
    CGFloat height = width;
    
    for (int i = 0; i< 9; i++) {
        
        //计算X左边
        int col = i % column;
        CGFloat x = col * (width + padding) + padding;
        
        //计算Y左边
        int row = i / column;
        CGFloat y = row * (height + padding) + padding + 64;
        
        UIView *view = [[UIView alloc]init];
        [self.view addSubview:view];
        view.backgroundColor = radomColor;
        
        //使用JCFrameLayout进行布局
        [view jc_makeLayout:^(JCFrameMake *make) {
            make.width.jc_equalTo(width);
            make.height.jc_equalTo(height);
            make.left.jc_equalTo(x);
            make.top.jc_equalTo(y);
        }];
    }
```

### 九宫格(相对布局，每个方块都相对于前一个方块进行布局)

```
//列数
    int column = 3;
    //内间距
    CGFloat padding = 20;
    //每个方块尺寸
    CGFloat width = (JC_SCREEN_WIDTH - padding * (column + 1))/column;
    CGFloat height = width;
        
    for (int idx = 0; idx < 9; idx++) {
        
        //计算所处行数
        int row = idx / column;
        //计算所处列数
        int col = idx % column;
        
        UIView *view = [[UIView alloc]init];
        view.jc_debug_key = [NSString stringWithFormat:@"view_%zd",idx];
        view.backgroundColor = radomColor;
        
        if (row == 0 && col == 0) {
            //如果是第一行第一个列，则相对屏幕左上角进行布局
            [view jc_makeLayout:^(JCFrameMake *make) {
                make.left.jc_equalTo(padding);
                make.top.jc_equalTo(padding + 64);
                make.width.jc_equalTo(width);
                make.height.jc_equalTo(height);
            }];
        }else{
            //其他方块相对于前一个方块进行布局
            //取出前一个方块
            UIView *lastView = [self.view.subviews lastObject];
            
            if (col == 0) { //和前一个方块在同一行
                [view jc_makeLayout:^(JCFrameMake *make) {
                    make.top.equalTo(lastView.jc_bottom).jc_offset(padding);
                    make.left.jc_equalTo(padding);
                    make.width.jc_equalTo(width);
                    make.height.jc_equalTo(height);
                }];
            }else{ //和前一个方块不再同一行
                [view jc_makeLayout:^(JCFrameMake *make) {
                    make.left.equalTo(lastView.jc_right).jc_offset(padding);
                    make.top.equalTo(lastView);
                    make.width.jc_equalTo(width);
                    make.height.jc_equalTo(height);
                }];
            }
        }
        [self.view addSubview:view];
    }
```



# 注意点

### 相对布局限制

相对只能相对于同一个superView或superView进行相，不可跨视图进行。

![](https://github.com/devjackcat/JCFrameLayout/blob/master/images/image1.png)

上图中，View1为View2的superView, View2为View3和View4的superView，当需要对View3进行相对布局时，只能相对于View4和View2进行，不能相对于View1进行。

### 性能问题

由于计算复杂度的影响，绝对布局性能会优于相对布局。

# 安装

### CocoaPods

1. 在Podfile文件中添加 `pod 'JCFrameLayout'`
2. 执行 `pod install` 或 `pod update` 命令
3. 引文头文件 `#import <JCFrameLayout/JCFrameLayout.h>`

### 手动安装

1. 下载JCFrameLayout项目
2. 将JCFrameLayout文件夹拖入到项目中
3. 引文头文件 `#import "JCFrameLayout.h"`

# 系统要求

iOS8 以上系统

# 历史版本

### V2.0.0

实现多视图的相对布局

```
[centerView jc_makeLayout:^(JCFrameMake *make) {
        make.left.equalTo(leftView.jc_right);
        make.top.equalTo(topView.jc_bottom);
        make.right.equalTo(rightView.jc_left);
        make.bottom.equalTo(bottomView.jc_top);
    }];
```

### V1.1.2
完善了单视图的链式语法，可以实现这样的的效果

```
[self.redView jc_makeLayout:^(JCFrameMake *make) {
        make.left.top.width.height.jc_equalTo(100);
    }];
```

### V1.1.1
jc_equalTo()时自动将基本类型进行装箱

可以将V1.1.0的代码简化为：

```
[self.redView jc_makeLayout:^(JCFrameMake *make) {
        make.center.jc_equalTo(CGPointMake(100, 100));
        make.size.jc_equalTo(CGSizeMake(100, 100));
    }];
```

### V1.1.0
增加了center,size两个复合属性的支持

```
[self.redView jc_makeLayout:^(JCFrameMake *make) {
        make.center.jc_equalTo([NSValue valueWithCGPoint:CGPointMake(100, 100)]);
        make.size.jc_equalTo([NSValue valueWithCGSize:CGSizeMake(100, 100)]);
}];
```

### V1.0.0
实现了单视图的基本布局，支持6个布局属性left,top,width,height,centerX,centerY，可以链式语法还支持不完善，下面是布局的一个例子：

```
[self.redView jc_makeLayout:^(JCFrameMake *make) {
        make.left.jc_equalTo(@50);
        make.top.jc_equalTo(@50);
        make.width.jc_equalTo(@100);
        make.height.jc_equalTo(@100);
    }];
```


# 信息反馈

* 使用中发现Bug请在Issues提出，或者邮件告知我，我将尽快修复
* 使用中有好的建议也可以在Issues提出，或邮件告知我


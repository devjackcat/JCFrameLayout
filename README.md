# JCFrameLayout


### 历史版本

#### V1.1.2
完善了单视图的链式语法，可以实现这样的的效果

```
[self.redView jc_makeLayout:^(JCFrameMake *make) {
        make.left.top.width.height.jc_equalTo(100);
    }];
```

#### V1.1.1
jc_equalTo()时自动将基本类型进行装箱

可以将V1.1.0的代码简化为：

```
[self.redView jc_makeLayout:^(JCFrameMake *make) {
        make.center.jc_equalTo(CGPointMake(100, 100));
        make.size.jc_equalTo(CGSizeMake(100, 100));
    }];
```

#### V1.1.0
增加了center,size两个复合属性的支持

```
[self.redView jc_makeLayout:^(JCFrameMake *make) {
        make.center.jc_equalTo([NSValue valueWithCGPoint:CGPointMake(100, 100)]);
        make.size.jc_equalTo([NSValue valueWithCGSize:CGSizeMake(100, 100)]);
}];
```

#### V1.0.0
实现了单视图的基本布局，支持6个布局属性left,top,width,height,centerX,centerY，可以链式语法还支持不完善，下面是布局的一个例子：

```
[self.redView jc_makeLayout:^(JCFrameMake *make) {
        make.left.jc_equalTo(@50);
        make.top.jc_equalTo(@50);
        make.width.jc_equalTo(@100);
        make.height.jc_equalTo(@100);
    }];
```


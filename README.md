#Erhuo前端设计语言

Erhuo可以是一个可生成html格式的设计语言，它使用[boson](https://github.com/ictxiangxin/boson)开发.

* Erhuo的源码十分简单
* Erhuo的使用也非常简单

example.txt中是一个源码例子。

##编译Erhuo
使用`boson`编译`erhuo.g`和`erhuo.l`这两个文件就可以生成Erhuo的编译器。

编译指令如下：

`boson.py erhuo.g -l erhuo.l -a lalr -o erhuo.py`

编译完`erhuo.py`后，就可以编译Erhuo语言了：

`erhuo.py example.txt example.html`

其中`example.html`就是编译生成的html文件。

##语法介绍

目前Erhuo有2种语法格式，一种是设计描述，一种是函数定义。

###标签描述

`html标签 { 属性列表 ; 子元素列表 }`

* `属性列表`和`子元素列表`直接以分号隔开。
* `属性列表`和`子元素列表`都可以为空。
* `属性列表`将各个属性以逗号分开：`属性, 属性, ...`。
* `属性`的表示为`属性名 : 属性值`。
* `子元素列表`将各个子元素以逗号分开：`子元素, 子元素, ...`。
* `子元素`可以是一个新的标签描述、一个函数或者一个字符串。

例如：

```
div {id: "1", class: "container";
    h4 {; "Hello World"}
}
```

###函数定义

`let 函数名(参数列表) = 标签描述`

* `标签描述`中的一些值被参数所替换。

例如：

`let button(text) = button {class: "btn btn-primary; text"}`

##计划开发
* 加入变量。
* 加入表达式功能。
* 加入头文件引入功能。
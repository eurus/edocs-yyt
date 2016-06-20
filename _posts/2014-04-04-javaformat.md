---
layout: page
title: "Java编码规范"
category: standard
date: 2014-04-04 09:43:23
order: 5
---

和你们猜想的一样，Java的编码规范主要参考了Google Java编程风格指南。毕竟，Google是一个让人心生欢喜的公司，而制定的标准，也确是默认的业界标准。但请注意，以下的标准有些与Google的标准并不完全相符，发生冲突时，以我们的标准为准。

### 源文件

* 文件编码统一 UTF-8
* 格式统一使用eclipse默认的排版，使用Ctrl+Shift+f自动排版
* 对于特殊字符（非ASCII）需给出注释

### import语句

import不要出现通配符，例如 import java.util.*;

import语句可分为以下几组，按照这个顺序，每组由一个空行分隔：

1. 所有的静态导入独立成组
2. com.eurus imports(仅当这个源文件是在com.eurus包下)
3. 第三方的包。每个顶级包为一组，字典序。例如：android, com, junit, org, sun
4. java imports
5. javax imports

### 类

#### 类成员顺序

类的成员顺序对易学性有很大的影响，但这也不存在唯一的通用法则。不同的类对成员的排序可能是不同的。 最重要的一点，每个类应该以某种逻辑去排序它的成员，维护者应该要能解释这种排序逻辑。比如， 新的方法不能总是习惯性地添加到类的结尾，因为这样就是按时间顺序而非某种逻辑来排序的。

#### 重载：永不分离

当一个类有多个构造函数，或是多个同名方法，这些函数/方法应该按顺序出现在一起，中间不要放进其它函数/方法。

### 格式

#### 大括号

大括号与if, else, for, do, while语句一起使用，即使只有一条语句(或是空)，也应该把大括号写上。

一个空的块状结构里什么也不包含，大括号可以简洁地写成{}，不需要换行。例外：如果它是一个多块语句的一部分(if/else 或 try/catch/finally) ，即使大括号内没内容，右大括号也要换行。

对于非空块和块状结构，大括号遵循Kernighan和Ritchie风格 (Egyptian brackets):

* 左大括号前不换行
* 左大括号后换行
* 右大括号前换行
* 如果右大括号是一个语句、函数体或类的终止，则右大括号后换行; 否则不换行。例如，如果右大括号后面是else或逗号，则不换行。 

示例：

{% highlight java %}
return new MyClass() {
  @Override public void method() {
    if (condition()) {
      try {
        something();
      } catch (ProblemException e) {
        recover();
      }
    }
  }
};
{% endhighlight %}

### 空白

#### 垂直空白

以下情况需要使用一个空行：

1. 类内连续的成员之间：字段，构造函数，方法，嵌套类，静态初始化块，实例初始化块。
2. 在函数体内，语句的逻辑分组间使用空行。
3. 类内的第一个成员前或最后一个成员后的空行是可选的(既不鼓励也不反对这样做，视个人喜好而定)。
4. 要满足本文档中其他节的空行要求(比如import语句)

多个连续的空行是允许的，但没有必要这样做(我们也不鼓励这样做)。

#### 水平空白

除了语言需求和其它规则，并且除了文字，注释和Javadoc用到单个空格，单个ASCII空格也出现在以下几个地方：

1. 分隔任何保留字与紧随其后的左括号(()(如if, for catch等)。
2. 分隔任何保留字与其前面的右大括号(})(如else, catch)。
3. 在任何左大括号前({)，两个例外：
4. 在任何二元或三元运算符的两侧。这也适用于以下“类运算符”符号：
	* 类型界限中的& (&lt;T extends Foo & Bar&gt;)。
	* catch块中的管道符号(catch (FooException | BarException e)。
	* foreach语句中的分号。
5. 在, : ;及右括号后
6. 如果在一条语句后做注释，则双斜杠(//)两边都要空格。这里可以允许多个空格，但没有必要。
7. 类型和变量之间：List list。

### 命名约定

标识符只能使用ASCII字母和数字，因此每个有效的标识符名称都能匹配正则表达式\w+。

在其它编程语言风格中使用的特殊前缀或后缀，如name_, mName, s_name和kName，在Java编程风格中都不再使用。

#### 包名

包名全部小写，连续的单词只是简单地连接起来，不使用下划线。

#### 类名

类名都以UpperCamelCase风格编写。

类名通常是名词或名词短语，接口名称有时可能是形容词或形容词短语。现在还没有特定的规则或行之有效的约定来命名注解类型。

测试类的命名以它要测试的类的名称开始，以Test结束。例如，HashTest或HashIntegrationTest。

#### 方法名

方法名都以lowerCamelCase风格编写。

方法名通常是动词或动词短语。

下划线可能出现在JUnit测试方法名称中用以分隔名称的逻辑组件。一个典型的模式是：test<MethodUnderTest>_<state>，例如testPop_emptyStack。 并不存在唯一正确的方式来命名测试方法。

#### 常量名
常量名命名模式为CONSTANT_CASE，全部字母大写，用下划线分隔单词。

每个常量都是一个静态final字段，但不是所有静态final字段都是常量。在决定一个字段是否是一个常量时， 考虑它是否真的感觉像是一个常量。例如，如果任何一个该实例的观测状态是可变的，则它几乎肯定不会是一个常量。 只是永远不打算改变对象一般是不够的，它要真的一直不变才能将它示为常量。

{% highlight java %}
// Constants
static final int NUMBER = 5;
static final ImmutableList<String> NAMES = ImmutableList.of("Ed", "Ann");
static final Joiner COMMA_JOINER = Joiner.on(',');  // because Joiner is immutable
static final SomeMutableType[] EMPTY_ARRAY = {};
enum SomeEnum { ENUM_CONSTANT }

// Not constants
static String nonFinal = "non-final";
final String nonStatic = "non-static";
static final Set<String> mutableCollection = new HashSet<String>();
static final ImmutableSet<SomeMutableType> mutableElements = ImmutableSet.of(mutable);
static final Logger logger = Logger.getLogger(MyClass.getName());
static final String[] nonEmptyArray = {"these", "can", "change"};
{% endhighlight %}

#### 非常量字段名

非常量字段名以lowerCamelCase风格编写。这些名字通常是名词或名词短语。

#### 参数名

参数名以lowerCamelCase风格编写。参数应该避免用单个字符命名。

#### 局部变量名

局部变量名以lowerCamelCase风格编写，比起其它类型的名称，局部变量名可以有更为宽松的缩写。

虽然缩写更宽松，但还是要避免用单字符进行命名，除了临时变量和循环变量。

即使局部变量是final和不可改变的，也不应该把它示为常量，自然也不能用常量的规则去命名它。

#### 类型变量名

类型变量可用以下两种风格之一进行命名：

* 单个的大写字母，后面可以跟一个数字(如：E, T, X, T2)。
* 以类命名方式，后面加个大写的T(如：RequestT, FooBarT)。

### 编程实践

#### 捕获的异常：不能忽视

除了下面的例子，对捕获的异常不做响应是极少正确的。(典型的响应方式是打印日志，或者如果它被认为是不可能的，则把它当作一个AssertionError重新抛出。)

如果它确实是不需要在catch块中做任何响应，需要做注释加以说明(如下面的例子)。

{% highlight java %}
try {
  int i = Integer.parseInt(response);
  return handleNumericResponse(i);
} catch (NumberFormatException ok) {
  // it's not numeric; that's fine, just continue
}
return handleTextResponse(response);
{% endhighlight %}

例外：在测试中，如果一个捕获的异常被命名为expected，则它可以被不加注释地忽略。下面是一种非常常见的情形，用以确保所测试的方法会抛出一个期望中的异常， 因此在这里就没有必要加注释。

{% highlight java %}
try {
  emptyStack.pop();
  fail();
} catch (NoSuchElementException expected) {
}
{% endhighlight %}

#### 静态成员：使用类进行调用

使用类名调用静态的类成员，而不是具体某个对象或表达式。

{% highlight java %}
Foo aFoo = ...;
Foo.aStaticMethod(); // good
aFoo.aStaticMethod(); // bad
somethingThatYieldsAFoo().aStaticMethod(); // very bad
{% endhighlight %}

### 注释

#### 块注释风格

块注释与其周围的代码在同一缩进级别。它们可以是/* ... */风格，也可以是// ...风格。对于多行的/* ... */注释，后续行必须从*开始， 并且与前一行的*对齐。以下示例注释都是OK的。

{% highlight java %}
/*
 * This is          // And so           /* Or you can
 * okay.            // is this.          * even do this. */
 */
{% endhighlight %}

#### Javadoc块

Javadoc块的基本格式如下：

{% highlight java %}
/**
 * Multiple lines of Javadoc text are written here,
 * wrapped normally...
 */
public int method(String p1) { ... }
{% endhighlight %}

#### Javadoc标记

标准的Javadoc标记按以下顺序出现：@param, @return, @throws, @deprecated, 前面这4种标记如果出现，描述都不能为空。 当描述无法在一行中容纳，连续行需要至少再缩进4个空格。

#### 哪里需要使用Javadoc

至少在每个public类及它的每个public和protected成员处使用Javadoc，以下是一些例外：

* 不言自明的方法: 对于简单明显的方法如getFoo，Javadoc是可选的(即，是可以不写的)。这种情况下除了写“Returns the foo”，确实也没有什么值得写了。单元测试类中的测试方法可能是不言自明的最常见例子了，我们通常可以从这些方法的描述性命名中知道它是干什么的，因此不需要额外的文档说明。
* 例外：重载: 如果一个方法重载了超类中的方法，那么Javadoc并非必需的。



### 参考
[Google Java 编程风格指南](http://hawstein.com/posts/google-java-style.html)
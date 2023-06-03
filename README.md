# pull_refresh_widget:


####  A Flutter package allows you to add pull refresh widget as listview builder or column 
[![pub package](https://img.shields.io/pub/v/arabic_font.svg)](https://pub.dev/packages/pull_refresh_widget)   

------------------
## # 👨‍💻 *Developed  by:*

<img alt="profile" src="https://abom.me/packages/profile.png" width="50" height="50"  style=" border-radius: 100%"/>

**Nasr Al-Rahbi [@abom_me](https://twitter.com/abom_me)**

## 👨🏻‍💻 Find me in  :
[![Twitter](https://img.shields.io/badge/Twitter-%231DA1F2.svg?logo=Twitter&logoColor=white)](https://twitter.com/abom_me)
[![Instagram](https://img.shields.io/badge/Instagram-%23E4405F.svg?logo=Instagram&logoColor=white)](https://instagram.com/abom.me)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-%230077B5.svg?logo=linkedin&logoColor=white)](https://linkedin.com/in/nasr-al-rahbi-08a573245)
[![Stack Overflow](https://img.shields.io/badge/-Stackoverflow-FE7A16?logo=stack-overflow&logoColor=white)](https://stackoverflow.com/users/19994059/nasr-al-rahbi)

---------------
<br>



|             | Android | iOS | Flutter Web |
| ----------- |---------|-----|-------------|
| **Support** | Yes     | Yes | Yes         |




---
## Preview:

<img alt="changing fonts with arabic_font and hot reload" src="https://abom.me/packages/pull_refresh.gif" width="20%" />


---
## Setup

Pubspec changes:

```
      dependencies:
        pull_refresh_widget: <last_version>
```
---
### Getting Started:

Sample example:

```dart
import 'package:pull_refresh_widget/pull_refresh_widget.dart';
ScrollController _controller=ScrollController();
String text="Pull To Refresh";
RefreshScrollColumn(


controller: _controller,
onRefresh: () {
print('Refreshing');

},
onRefreshEnd: (){
print('Refreshed');
setState(() {
text='Refreshed';
});
},
children: [
Container(
alignment: Alignment.center,
height: 100,
width: 300,
child:  Text(text,style: TextStyle(color: Colors.red,fontSize: 30),),
)
],

),
```
---
- What You can Do:
    - use RefreshScrollColumn() to add it as Column
    - use RefreshListViewBuilder() to add it as ListView.builder


---


### To use RefreshScrollColumn():

```dart

import 'package:pull_refresh_widget/pull_refresh_widget.dart';
ScrollController _controller=ScrollController();
String text="Pull To Refresh";
RefreshScrollColumn(


controller: _controller,
onRefresh: () {
print('Refreshing');

},
onRefreshEnd: (){
print('Refreshed');
setState(() {
text='Refreshed';
});
},
children: [
Container(
alignment: Alignment.center,
height: 100,
width: 300,
child:  Text(text,style: TextStyle(color: Colors.red,fontSize: 30),),
)
],

),
```

---

<br>

### To use RefreshListViewBuilder() :

```dart
RefreshListViewBuilder(

controller: _controller,
onRefresh: (){
print("refreshed");
}, itemBuilder: (context,index){
return Text('$index');
})
```





---


### Parameters of the RefreshScrollColumn():
````dart

/// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- EN ----</p>
/// ###  Add scroll controller  to can control the scroll widget
/// 
/// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- AR ----</p>
/// ### اضف 
/// ### scroll controller
///### لكي تستطيع التحكم بالويدجت

final ScrollController controller ;

/// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- EN ----</p>
/// ###  Add Here Widgets you want to show in the screen
/// 
/// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- AR ----</p>
/// ### هنا اضف المكونات التي تريدها بداخل الويدجت من نوع 
/// ### Widget

final  List<Widget> children;

/// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- EN ----</p>
/// ###  Here the widget shown when the user pulling down
/// ###  it's  CircularProgressIndicator() by default
/// 
/// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- AR ----</p>
/// ### هنا اختار الويدجت التي تريدها تظهر للمستخدم عندما يسحب للأسفل
/// ### CircularProgressIndicator() بشكل افتراضي
final Widget? loadingWidget;


/// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- EN ----</p>
/// ###  Color of the arrow icons it's gray by default 
/// 
/// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- AR ----</p>
/// ### هنا لون ايقونات الأسهم ، لونها رصاصي بشكل افتراضي 



final Color? iconsColor;

/// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- EN ----</p>
/// ###  Add here the functions you want when the user pull down
/// 
/// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- AR ----</p>
/// ### هنا اضف الأوامر التي تريدها عندما المستخدم يسحب للأسفل 

final void Function() onRefresh;

/// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- EN ----</p>
/// ###  Add here the functions you want when the refreshing end
/// 
/// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- AR ----</p>
/// ### هنا اضف الأوامر التي تريدها عندما ينتهي التحديث 
final void Function()? onRefreshEnd;

/// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- EN ----</p>
/// ###  Here you can change the time taken to refresh before hiding the refresh widget
/// ###  it's 3 sec by default
/// 
/// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- AR ----</p>
/// ### من هنا بإمكانك تغيير الوقت المستغرق في التحديث قبل لا يقوم بإخفاء ويدجت التحديث
/// ### الان يأخذ ٣ ثواني بشكل افتراضي
final Duration? refreshTime;

final MainAxisAlignment? mainAxisAlignment;
final MainAxisSize? mainAxisSize ;
final  CrossAxisAlignment? crossAxisAlignment;
final  TextDirection? textDirection;
final  VerticalDirection? verticalDirection ;
final  TextBaseline? textBaseline;

````
---
### Parameters of the RefreshListViewBuilder():
````dart


/// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- EN ----</p>
/// ###  Add scroll controller  to can control the scroll widget
/// 
/// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- AR ----</p>
/// ### اضف 
/// ### scroll controller
///### لكي تستطيع التحكم بالويدجت

final ScrollController controller ;



/// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- EN ----</p>
/// ###  Here the widget shown when the user pulling down
/// ###  it's  CircularProgressIndicator() by default
/// 
/// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- AR ----</p>
/// ### هنا اختار الويدجت التي تريدها تظهر للمستخدم عندما يسحب للأسفل
/// ### CircularProgressIndicator() بشكل افتراضي
final Widget? loadingWidget;


/// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- EN ----</p>
/// ###  Color of the arrow icons it's gray by default 
/// 
/// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- AR ----</p>
/// ### هنا لون ايقونات الأسهم ، لونها رصاصي بشكل افتراضي 



final Color? iconsColor;

/// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- EN ----</p>
/// ###  Add here the functions you want when the user pull down
/// 
/// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- AR ----</p>
/// ### هنا اضف الأوامر التي تريدها عندما المستخدم يسحب للأسفل
final void Function() onRefresh;
/// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- EN ----</p>
/// ###  Add here the functions you want when the refreshing end
/// 
/// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- AR ----</p>
/// ### هنا اضف الأوامر التي تريدها عندما ينتهي التحديث 
final void Function()? onRefreshEnd;

/// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- EN ----</p>
/// ###  Here you can change the time taken to refresh before hiding the refresh widget
/// ###  it's 3 sec by default
/// 
/// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- AR ----</p>
/// ### من هنا بإمكانك تغيير الوقت المستغرق في التحديث قبل لا يقوم بإخفاء ويدجت التحديث
/// ### الان يأخذ ٣ ثواني بشكل افتراضي
final Duration? refreshTime;
final  NullableIndexedWidgetBuilder itemBuilder;

final  Axis scrollDirection = Axis.vertical;
final bool reverse = false;
final bool? primary;
final ScrollPhysics? physics;
final  bool shrinkWrap = false;
final  EdgeInsetsGeometry? padding;
final  double? itemExtent;
final Widget? prototypeItem;
final  int? Function(Key)? findChildIndexCallback;
final  int? itemCount;
final  bool addAutomaticKeepAlives = true;
final  bool addRepaintBoundaries = true;
final  bool addSemanticIndexes = true;
final  double? cacheExtent;
final  int? semanticChildCount;
final  DragStartBehavior dragStartBehavior = DragStartBehavior.start;
final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual;
final String? restorationId;
final Clip clipBehavior = Clip.hardEdge;
final MainAxisAlignment? mainAxisAlignment;
final MainAxisSize? mainAxisSize ;
final  CrossAxisAlignment? crossAxisAlignment;
final  TextDirection? textDirection;
final  VerticalDirection? verticalDirection ;
final  TextBaseline? textBaseline;
````


## 👨🏻‍💻 Follow me  :
[![Twitter](https://img.shields.io/badge/Twitter-%231DA1F2.svg?logo=Twitter&logoColor=white)](https://twitter.com/abom_me)
[![Instagram](https://img.shields.io/badge/Instagram-%23E4405F.svg?logo=Instagram&logoColor=white)](https://instagram.com/abom.me)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-%230077B5.svg?logo=linkedin&logoColor=white)](https://linkedin.com/in/nasr-al-rahbi-08a573245)
[![Stack Overflow](https://img.shields.io/badge/-Stackoverflow-FE7A16?logo=stack-overflow&logoColor=white)](https://stackoverflow.com/users/19994059/nasr-al-rahbi)


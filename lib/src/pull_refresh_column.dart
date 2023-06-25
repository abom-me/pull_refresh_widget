import 'dart:async';

import 'package:flutter/material.dart';

class RefreshScrollColumn extends StatefulWidget {
  const RefreshScrollColumn(
      {super.key,
      required this.controller,
      required this.onRefresh,
      required this.children,
      this.loadingWidget,
      this.iconsColor,
      this.refreshTime,
      this.textDirection,
      this.textBaseline,
      this.mainAxisAlignment,
      this.mainAxisSize,
      this.crossAxisAlignment,
      this.verticalDirection,
      required this.onRefreshEnd});

  /// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- EN ----</p>
  /// ###  Add scroll controller  to can control the scroll widget
  ///
  /// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- AR ----</p>
  /// ### اضف
  /// ### scroll controller
  ///### لكي تستطيع التحكم بالويدجت

  final ScrollController controller;

  /// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- EN ----</p>
  /// ###  Add Here Widgets you want to show in the screen
  ///
  /// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- AR ----</p>
  /// ### هنا اضف المكونات التي تريدها بداخل الويدجت من نوع
  /// ### Widget

  final List<Widget> children;

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
  final void Function() onRefreshEnd;

  /// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- EN ----</p>
  /// ###  Here you can change the time taken to refresh before hiding the refresh widget
  /// ###  it's 3 sec by default
  ///
  /// <p style="color:#77b4ff;font-size:16;font-weight: bold;">---- AR ----</p>
  /// ### من هنا بإمكانك تغيير الوقت المستغرق في التحديث قبل لا يقوم بإخفاء ويدجت التحديث
  /// ### الان يأخذ ٣ ثواني بشكل افتراضي
  final Duration? refreshTime;

  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection? verticalDirection;
  final TextBaseline? textBaseline;
  @override
  State<RefreshScrollColumn> createState() => _RefreshScrollColumnState();
}

class _RefreshScrollColumnState extends State<RefreshScrollColumn> {
  int height = 0;
  Widget refreshWidget = const SizedBox.shrink();
  bool isLoading = false;
  bool isDone = false;
  @override
  void initState() {
    Widget loadingWidget =
        widget.loadingWidget ?? const CircularProgressIndicator();
    Duration refreshTime = widget.refreshTime ?? const Duration(seconds: 3);
    widget.controller.addListener(() async {
      if (widget.controller.position.minScrollExtent >
          widget.controller.offset) {
        if (widget.controller.offset <= -150) {
          setState(() {
            height = 200;
            refreshWidget = const Icon(
              Icons.arrow_downward,
              color: Colors.grey,
            );
          });
        } else if (widget.controller.offset <= -70 && height == 200) {
          setState(() {
            height = 100;
            refreshWidget = const Icon(
              Icons.arrow_upward,
              color: Colors.grey,
            );
          });
        } else if (widget.controller.offset <= -50 && height == 100) {
          setState(() {
            height = 50;
            refreshWidget = loadingWidget;
          });

          if (isLoading == false) {
            setState(() {
              widget.onRefresh();
              isDone = true;
            });
          }
          setState(() {
            isLoading = true;
          });
          Timer(refreshTime, () {
            refreshWidget = const SizedBox.shrink();
            setState(() {
              height = 0;
              isLoading = false;
            });
            if (isDone == true) {
              setState(() {
                widget.onRefreshEnd();
                isDone = false;
              });
            }
          });
        }
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.start,
        mainAxisSize: widget.mainAxisSize ?? MainAxisSize.max,
        crossAxisAlignment:
            widget.crossAxisAlignment ?? CrossAxisAlignment.start,
        textDirection: widget.textDirection,
        textBaseline: widget.textBaseline,
        verticalDirection: widget.verticalDirection ?? VerticalDirection.down,
        children: [
          AnimatedContainer(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 300),
            // color: Colors.red,
            width: MediaQuery.of(context).size.width,
            height: height.toDouble(),
            child: refreshWidget,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),

              controller: widget.controller,

              child: Column(
                mainAxisAlignment:
                    widget.mainAxisAlignment ?? MainAxisAlignment.start,
                mainAxisSize: widget.mainAxisSize ?? MainAxisSize.max,
                crossAxisAlignment:
                    widget.crossAxisAlignment ?? CrossAxisAlignment.start,
                textDirection: widget.textDirection,
                textBaseline: widget.textBaseline,
                verticalDirection:
                    widget.verticalDirection ?? VerticalDirection.down,
                children: widget.children,
              ), // wireframe for each widget.
            ),
          ),
        ],
      ),
    );
  }
}

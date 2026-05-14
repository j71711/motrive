import 'package:flutter/material.dart';

class CustomFadeContainer extends StatelessWidget {
  final bool fade;
  final Widget widget;
  final Widget? widgetTo;
  const CustomFadeContainer({
    super.key,
    required this.fade,
    required this.widget,
    this.widgetTo,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) =>
          Stack(
            alignment: Alignment.center,
            children: [
              if (widgetTo != null)
                Positioned(key: bottomChildKey, child: bottomChild),
              Positioned(key: topChildKey, child: topChild),
            ],
          ),
      duration: Duration(milliseconds: 500),
      secondCurve: Curves.easeInBack,
      sizeCurve: Curves.ease,
      crossFadeState: fade ? .showSecond : .showFirst,
      firstChild: widget,
      secondChild: widgetTo ?? SizedBox.shrink(),
    );
  }
}

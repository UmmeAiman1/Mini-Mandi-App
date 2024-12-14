import 'package:flutter/widgets.dart';

double height(BuildContext context, double value) {
  return MediaQuery.of(context).size.height * value * 0.0013;
}

double width(BuildContext context, double value) {
  return MediaQuery.of(context).size.width * value * 0.00255;
}

EdgeInsets symmetric(BuildContext context,
    {double vertical = 0, double horizontal = 0}) {
  return EdgeInsets.symmetric(
    vertical: height(context, vertical),
    horizontal: width(context, horizontal),
  );
}

EdgeInsets all(BuildContext context, double value) {
  return EdgeInsets.all(width(context, value));
}

EdgeInsets only(
  BuildContext context, {
  double top = 0,
  double right = 0,
  double bottom = 0,
  double left = 0,
}) {
  return EdgeInsets.fromLTRB(
    width(context, left),
    height(context, top),
    width(context, right),
    height(context, bottom),
  );
}

double f(BuildContext context, double value) {
  return MediaQuery.of(context).size.shortestSide * value * 0.0025;
}

SizedBox sizedBoxheight(BuildContext context,) {
  return SizedBox(
    height: height(context, 10),
  
  );
}
SizedBox sizedBoxWidth(BuildContext context,) {
  return SizedBox(
    height: width(context, 10),
  
  );
}

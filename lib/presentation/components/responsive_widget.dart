import 'package:cma_admin/app/functions.dart';
import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final List<Widget> children;
  const ResponsiveWidget({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isDesktop(context)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children)
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children);
  }
}

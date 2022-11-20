import 'package:flutter/material.dart';

class SundarWidget extends StatelessWidget {
  const SundarWidget({super.key, required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: widget,
    );
  }
}

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final AppBar appBar;
  final Widget bottomWidget;
  final double height;

  const CustomAppBar({
    Key? key,
    required this.appBar,
    required this.bottomWidget,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 187, 222, 202),
            child: appBar,
          ),
          Positioned(
            left: 30,
            right: 30,
            bottom: 5,
            child: bottomWidget,
          ),
        ],
      ),
    );
  }

  @override
  Widget get child => this;

  @override
  Size get preferredSize => Size.fromHeight(height);
}

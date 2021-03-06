import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../app_styles.dart';
import '../size_configs.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    Key? key,
    required this.buttonName,
    required this.onPressed,
    required this.bgColor,
  }) : super(key: key);
  final String buttonName;
  final VoidCallback onPressed;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
      ),
      child: SizedBox(
        height: 74,
        width: 500,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttonName,
            style: BtnText,
          ),
          style: TextButton.styleFrom(backgroundColor: bgColor),
        ),
      ),
    );
  }
}

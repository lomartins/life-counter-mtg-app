import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.color = Colors.black54
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.white60,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: color),
        ),
      ),
      child: child,
      onPressed: onPressed,
    );
  }
}

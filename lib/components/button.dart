import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class CustomButton extends StatefulWidget {
  CustomButton({super.key, required this.label, required this.onTap});

  @override
  State<CustomButton> createState() => _CustomButtonState();
  final String label;
  void Function()? onTap;
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
            onTap: widget.onTap,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Theme.of(context).colorScheme.secondary),
                child: widget.label.text
                    .color(Theme.of(context).colorScheme.inversePrimary)
                    .size(18)
                    .bold
                    .makeCentered()
                    .py12()))
        .px24()
        .py4();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final bool safe;
  final TextEditingController controller;

  const CustomTextField({super.key, required this.hint, required this.safe, required this.controller});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.inversePrimary),
      obscureText: widget.safe,
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: widget.safe ? Icon(Icons.password_rounded, color: Theme.of(context).colorScheme.inversePrimary) : Icon(CupertinoIcons.mail_solid, color: Theme.of(context).colorScheme.inversePrimary),
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.inverseSurface),
                borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: 
                BorderSide(color: Theme.of(context).colorScheme.inverseSurface),
                borderRadius: BorderRadius.circular(8)),
        fillColor: Theme.of(context).colorScheme.inverseSurface,
        filled: true,
        hintText: widget.hint,
        
        hintStyle: TextStyle( color: Theme.of(context).colorScheme.inversePrimary,fontSize: 16)
      ),
    ).px24();
  }
}

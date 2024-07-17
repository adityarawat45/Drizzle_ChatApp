import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class UserTile extends StatefulWidget {
  final void Function()? onTap;
  final String username;
  final String email;
  const UserTile({super.key, required this.username,required this.email, this.onTap});

  @override
  State<UserTile> createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
          decoration: BoxDecoration(
            
            color: Theme.of(context).colorScheme.inverseSurface,
             borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              WidthBox(5),
              Icon(Icons.person_2_sharp, size: 34,color: Theme.of(context).colorScheme.inversePrimary,).py20().px8(),
              WidthBox(10),
              widget.username.text.size(15).semiBold.color(Theme.of(context).colorScheme.inversePrimary).medium.make()
            ],
          )).px12().pOnly(top: 6)
    );
  }
}

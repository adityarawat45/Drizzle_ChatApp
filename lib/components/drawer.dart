import 'package:drizzle0/services/Auth/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final _auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // width: BorderSide.strokeAlignInside,
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Container(
              decoration: const BoxDecoration(),
              child: Column(children: [
                "Drizzle"
                    .text
                    .color(Theme.of(context).colorScheme.tertiary)
                    .extraBold
                    .size(34)
                    .makeCentered(),
                const HeightBox(10),
                Icon(
                  CupertinoIcons.cloud_drizzle_fill,
                  size: 45,
                  color: Theme.of(context).colorScheme.tertiary,
                )
              ])).pOnly(top: 56, bottom: 10),
              
          ListTile(
            leading: Icon(CupertinoIcons.home,
                color: Theme.of(context).colorScheme.inversePrimary),
            title: Row(
              children: [
                const SizedBox(width: 12),
                "Home".text.color(Theme.of(context).colorScheme.inversePrimary).make(),
              ],
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          // ListTile(
          //   leading: Icon(
          //     CupertinoIcons.settings_solid,
          //     color: Theme.of(context).colorScheme.inversePrimary,
          //   ),
          //   title: Row(
          //     children: [
          //       const SizedBox(width: 12),
          //       "Settings"
          //           .text
          //           .color(Theme.of(context).colorScheme.inversePrimary)
          //           .make(),
          //     ],
          //   ),
          //   onTap: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => const Settings()));
          //   },
          // ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            title: Row(
              children: [
                const SizedBox(width: 12),
                "Log out"
                    .text
                    .color(Theme.of(context).colorScheme.inversePrimary)
                    .make(),
              ],
            ),
            onTap: () {
              _auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}

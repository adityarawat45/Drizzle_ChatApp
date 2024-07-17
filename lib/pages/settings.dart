import 'package:drizzle0/themes/themeprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
          iconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.tertiary),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: "Settings"
              .text
              .bold
              .color(Theme.of(context).colorScheme.tertiary)
              .make()),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "Dark Mode".text.medium.size(16).color(Theme.of(context).colorScheme.inversePrimary).make(),
            CupertinoSwitch(
              activeColor: Provider.of<ThemeProvider>(context, listen: false).isDarkMode ? Vx.green800 : Vx.green500,
                value:
                    Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
                onChanged: (value) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme();
                })
          ],
        ).px16().py8()
      ),
    );
  }
}

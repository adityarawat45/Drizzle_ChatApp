import 'package:drizzle0/components/button.dart';
import 'package:drizzle0/components/textfield.dart';
import 'package:drizzle0/services/Auth/auth.dart';
import 'package:drizzle0/themes/themeprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class Login extends StatefulWidget {
  final void Function()? toggle;

  const Login({super.key, required this.toggle});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _username = TextEditingController();
 
  void login(BuildContext context) async {

    final auth = Auth();

    try {
      await auth.signInWithEmailPassword(_username.text, _pw.text);
    } catch (e) {
      return showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Vx.gray300,
            
                title: e.toString().text.color(Vx.black).size(14).make(),
              ));
    }
  }

  final TextEditingController _pw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                "Drizzle"
                    .text
                    .size(45)
                    .bold
                    .color(Theme.of(context).colorScheme.tertiary)
                    .makeCentered(),
                const WidthBox(7),
                Icon(
                  CupertinoIcons.cloud_drizzle_fill,
                  size: 50,
                  color: Theme.of(context).colorScheme.tertiary,
                )
              ],
            ),
            const HeightBox(50),
            CustomTextField(hint: "Email", safe: false, controller: _username),
            const HeightBox(10),
            CustomTextField(hint: "Password", safe: true, controller: _pw),
            const HeightBox(10),
            CustomButton(label: "Sign In", onTap: () => login(context)),
            const HeightBox(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                "New User?"
                    .text
                    .color(
                      Theme.of(context).colorScheme.inversePrimary,
                    )
                    .medium
                    .makeCentered(),
                const WidthBox(7),
                GestureDetector(
                  onTap: widget.toggle,
                  child: "Sign Up"
                      .text
                      .color(
                        Theme.of(context).colorScheme.inversePrimary,
                      )
                      .semiBold
                      .makeCentered(),
                ),
              ],
            )
          ]),
        ));
  }
}

import 'package:drizzle0/components/button.dart';
import 'package:drizzle0/components/textfield.dart';
import 'package:drizzle0/services/Auth/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Signup extends StatefulWidget {
  final void Function()? toggle;

  const Signup({super.key, required this.toggle});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  void signup(BuildContext context) async {
    final auth = Auth();
    try {
      await auth.signUpwithEmailPassword(
          _email.text, _password.text, _username.text);
    } catch (e) {
      // ignore: use_build_context_synchronously
      showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            //Specific textfield to take username
            TextField(
              style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.inversePrimary),
              controller: _username,
              decoration: InputDecoration(
                
                  prefixIcon: Icon(CupertinoIcons.person_2_alt,
                      color: Theme.of(context).colorScheme.inversePrimary),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.inverseSurface),
                      borderRadius: BorderRadius.circular(8)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.inverseSurface),
                      borderRadius: BorderRadius.circular(8)),
                  fillColor: Theme.of(context).colorScheme.inverseSurface,
                  filled: true,
                  hintText: "Username",
                  hintStyle: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 16)),
            ).px24(),

            const HeightBox(10),
            CustomTextField(hint: "Email", safe: false, controller: _email),
            const HeightBox(10),
            CustomTextField(
                hint: "Password", safe: true, controller: _password),
            const HeightBox(10),
            CustomButton(label: "Sign Up", onTap: () => signup(context)),
            const HeightBox(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                "Already a user?"
                    .text
                    .color(
                      Theme.of(context).colorScheme.inversePrimary,
                    )
                    .medium
                    .makeCentered(),
                const WidthBox(7),
                GestureDetector(
                    onTap: widget.toggle,
                    child: "Sign In"
                        .text
                        .semiBold
                        .color(
                          Theme.of(context).colorScheme.inversePrimary,
                        )
                        .makeCentered())
              ],
            )
          ],
        ),
      ),
    );
  }
}

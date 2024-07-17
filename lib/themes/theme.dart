import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:velocity_x/velocity_x.dart";

ThemeData lightMode = ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(),
    useMaterial3: true,
    colorScheme: const ColorScheme.light(

        // Bg color
        surface: Vx.white,

        //dark fonts
        primary: Vx.black,

        //light fonts
        secondary: Vx.slate300,

        //don't know, probably for icons and decorations
        tertiary: Vx.slate700,

        //for icons, buttons etc
        inversePrimary: Vx.black,
        inverseSurface: Vx.gray100));
ThemeData darkMode = ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(),
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(

        //bg
        surface: Vx.slate900,

        //theme based font
        primary: Vx.black,

        //Logo //Chatcards
        secondary: Vx.slate600,

        //theme opposite font
        inversePrimary: Vx.gray400,

        //textfields
        inverseSurface: Vx.slate800,

        //Button and main title
        tertiary: Vx.slate500));

import 'package:flutter/material.dart';

abstract final class Colors {
  static Color pimary = brand[600]!;
  static Color defaultFont = neutral[900]!;
  static Color neutralBorder = neutral[200]!;
  static Color defaultBackground = const Color.fromARGB(255, 255, 255, 255);
  static Color white = const Color.fromARGB(255, 255, 255, 255);
  static Map<int, Color> get brand {
    return const {
      50: Color.fromRGBO(239, 246, 255, 1),
      100: Color.fromRGBO(219, 234, 254, 1),
      200: Color.fromRGBO(191, 219, 254, 1),
      300: Color.fromRGBO(147, 197, 253, 1),
      400: Color.fromRGBO(96, 165, 250, 1),
      500: Color.fromRGBO(59, 130, 246, 1),
      600: Color.fromRGBO(37, 99, 235, 1),
      700: Color.fromRGBO(29, 78, 216, 1),
      800: Color.fromRGBO(30, 64, 175, 1),
      900: Color.fromRGBO(30, 58, 138, 1)
    };
  }

  static Map<int, Color> get neutral {
    return const {
      50: Color.fromRGBO(249, 250, 251, 1),
      100: Color.fromRGBO(243, 244, 246, 1),
      200: Color.fromRGBO(229, 231, 235, 1),
      300: Color.fromRGBO(209, 213, 219, 1),
      400: Color.fromRGBO(156, 163, 175, 1),
      500: Color.fromRGBO(107, 114, 128, 1),
      600: Color.fromRGBO(75, 85, 99, 1),
      700: Color.fromRGBO(55, 65, 81, 1),
      800: Color.fromRGBO(31, 41, 55, 1),
      900: Color.fromRGBO(17, 24, 39, 1)
    };
  }

  static Map<int, Color> get error {
    return const {
      50: Color.fromRGBO(254, 242, 242, 1),
      100: Color.fromRGBO(254, 226, 226, 1),
      200: Color.fromRGBO(254, 202, 202, 1),
      300: Color.fromRGBO(252, 165, 165, 1),
      400: Color.fromRGBO(248, 113, 113, 1),
      500: Color.fromRGBO(239, 68, 68, 1),
      600: Color.fromRGBO(220, 38, 38, 1),
      700: Color.fromRGBO(185, 28, 28, 1),
      800: Color.fromRGBO(153, 27, 27, 1),
      900: Color.fromRGBO(127, 29, 29, 1)
    };
  }

  static Map<int, Color> get warning {
    return const {
      50: Color.fromRGBO(254, 252, 232, 1),
      100: Color.fromRGBO(254, 249, 195, 1),
      200: Color.fromRGBO(254, 240, 138, 1),
      300: Color.fromRGBO(253, 224, 71, 1),
      400: Color.fromRGBO(250, 204, 21, 1),
      500: Color.fromRGBO(234, 179, 8, 1),
      600: Color.fromRGBO(202, 138, 4, 1),
      700: Color.fromRGBO(161, 98, 7, 1),
      800: Color.fromRGBO(133, 77, 14, 1),
      900: Color.fromRGBO(113, 63, 18, 1)
    };
  }

  static Map<int, Color> get success {
    return const {
      50: Color.fromRGBO(240, 253, 244, 1),
      100: Color.fromRGBO(220, 252, 231, 1),
      200: Color.fromRGBO(187, 247, 208, 1),
      300: Color.fromRGBO(134, 239, 172, 1),
      400: Color.fromRGBO(74, 222, 128, 1),
      500: Color.fromRGBO(34, 197, 94, 1),
      600: Color.fromRGBO(22, 163, 74, 1),
      700: Color.fromRGBO(21, 128, 61, 1),
      800: Color.fromRGBO(22, 101, 52, 1),
      900: Color.fromRGBO(20, 83, 45, 1)
    };
  }
}

import 'package:flutter/material.dart';

class CustomTheme {

  static ThemeData customLightTheme = ThemeData.light().copyWith(
    
    primaryColor: Colors.blue,

    appBarTheme: const AppBarTheme(
    
    ),


    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.blue
    ),

    textTheme:  const TextTheme(
      titleLarge: TextStyle(
        fontFamily : 'Poppins', fontWeight : FontWeight.bold,
        fontSize: 20,
        color: Colors.black
      ),

      titleMedium: TextStyle(
        fontFamily : 'Poppins', fontWeight : FontWeight.bold,
        fontSize: 18,
        color: Colors.black
      ),

      titleSmall: TextStyle(
        fontFamily : 'Poppins',
        fontSize: 18,
        color: Colors.black
      ),

      bodyMedium: TextStyle(
        fontFamily : 'Poppins', fontWeight : FontWeight.normal,
        fontSize: 14,
        color: Colors.black
      ),

      bodySmall: TextStyle(
        fontFamily : 'Poppins', fontWeight : FontWeight.normal,
        fontSize: 12,
        color: Colors.black
      )
    )
  );

  static ThemeData customDarkTheme = ThemeData.dark().copyWith(
    
    primaryColor: Colors.blue,

    appBarTheme: const AppBarTheme(
     
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.blue
    ),

    textTheme:  const TextTheme(
      titleLarge: TextStyle(
        fontFamily : 'Poppins', fontWeight : FontWeight.bold,
        fontSize: 20,
        color: Colors.white
      ),

      titleMedium: TextStyle(
        fontFamily : 'Poppins', fontWeight : FontWeight.bold,
        fontSize: 18,
        color: Colors.white
      ),

      titleSmall: TextStyle(
        fontFamily : 'Poppins',
        fontSize: 18,
        color: Colors.white
      ),

      bodyMedium: TextStyle(
        fontFamily : 'Poppins', fontWeight : FontWeight.normal,
        fontSize: 14,
        color: Colors.white
      ),

      bodySmall: TextStyle(
        fontFamily : 'Poppins', fontWeight : FontWeight.normal,
        fontSize: 12,
        color: Colors.white
      )
    )
  );
}
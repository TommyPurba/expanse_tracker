import 'package:flutter/material.dart';
import 'package:thefour/widgets/expense.dart';

var kColourScheem = ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 181));

void main(){
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        
        colorScheme: kColourScheem,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColourScheem.onPrimaryContainer,
          foregroundColor: kColourScheem.primaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
          color: kColourScheem.secondaryContainer,
          margin: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColourScheem.primaryContainer,
          )
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.normal,
            color: kColourScheem.onSecondaryContainer,
            fontSize: 14,
          )
        )
      ),
      home: Expense(),
    )
  );
}
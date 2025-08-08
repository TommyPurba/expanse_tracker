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
        )
      ),
      home: Expense(),
    )
  );
}
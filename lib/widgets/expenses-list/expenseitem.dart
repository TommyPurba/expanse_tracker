import 'package:flutter/material.dart';
import 'package:thefour/models/expense.dart';

class Expenseitem extends StatelessWidget {
  const Expenseitem(this.expense, {super.key});

  final Expenses expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        
        child: Text(expense.tittle),
      ),
    );
  }
}
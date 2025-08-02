import 'package:flutter/material.dart';
import 'package:thefour/models/expense.dart';
import 'package:thefour/widgets/expenses-list/expenseitem.dart';

class Expenselist extends StatelessWidget {
  const Expenselist ({super.key, required this.expensesd});

  final List<Expenses> expensesd;
  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      itemCount: expensesd.length,
      itemBuilder: (ctx, index) => Expenseitem(expensesd[index]),
      );
  }
}
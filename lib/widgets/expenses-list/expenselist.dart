import 'package:flutter/material.dart';
import 'package:thefour/models/expense.dart';
import 'package:thefour/widgets/expenses-list/expenseitem.dart';

class Expenselist extends StatelessWidget {
  const Expenselist ({super.key, required this.expensesd, required this.ondismissed});

  final List<Expenses> expensesd;
  final void Function(Expenses expense) ondismissed;
  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      itemCount: expensesd.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(Expenseitem(expensesd[index])),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.7),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ), 
        onDismissed: (direction){
          ondismissed(expensesd[index]);
        },
        child: Expenseitem(expensesd[index])
      ) ,
      );
  }
}
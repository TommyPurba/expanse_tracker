import 'package:flutter/material.dart';
import 'package:thefour/widgets/expenses-list/expenselist.dart';
import 'package:thefour/models/expense.dart';


class Expense extends StatefulWidget{
  const Expense({super.key});
  @override
  State<Expense> createState() {
    return _ExpenseState();
  }
}


class _ExpenseState extends State<Expense>{

  final List<Expenses> _registeredExpenses = [
    Expenses(
      tittle: 'Flutter course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
      ),
      Expenses(
      tittle: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
      )
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('the chart'),
          Expanded(child: Expenselist(expensesd: _registeredExpenses),)
        ],
      ),
    );
  }
}
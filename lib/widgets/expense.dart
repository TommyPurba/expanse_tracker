import 'package:flutter/material.dart';
import 'package:thefour/widgets/chart/chart.dart';
import 'package:thefour/widgets/expenses-list/expenselist.dart';
import 'package:thefour/models/expense.dart';
import 'package:thefour/widgets/new_expense.dart';


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

  void _openAddExpanseOverlay(){
    showModalBottomSheet(
      isScrollControlled: true,
      context: context, 
      builder: (ctx)=>NewExpense(
        onaddexpense: _addExpense,
        ),
        );
  }

  void _addExpense(Expenses expense){
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expenses expense){
    final expanseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: const Text('Expenses deleted.'),
        action: SnackBarAction(
          label: "Undo",
         onPressed: (){
            setState(() {
              _registeredExpenses.insert(expanseIndex, expense);
            });
         },
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    Widget mainContext = Center(child: Text('No Expenses found. Starting adding some !'),);

    if (_registeredExpenses.isNotEmpty){
        mainContext = Expenselist(expensesd: _registeredExpenses, ondismissed: _removeExpense,);
    }


    return Scaffold(
      appBar: AppBar(
        title: Text('flutter expense tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpanseOverlay,
           icon: Icon(Icons.add)
           )
        ],
      ),
      body: Column(
        children: [
          Chart(expense: _registeredExpenses),
          Expanded(child: mainContext ,)
        ],
      ),
    );
  }
}
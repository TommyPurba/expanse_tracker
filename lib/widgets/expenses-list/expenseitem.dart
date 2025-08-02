import 'package:flutter/material.dart';
import 'package:thefour/models/expense.dart';

class Expenseitem extends StatelessWidget {
  const Expenseitem(this.expense, {super.key});

  final Expenses expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expense.tittle),
            const SizedBox(height: 4,),
            Row(
              children: [
                Text('Rp.${expense.amount.toStringAsFixed(2)}'),
                Spacer(),
                Row(
                  children: [
                    const Icon(Icons.alarm),
                    const SizedBox(height: 9,),
                    Text(expense.date.toString())
                  ],
                )
                
              ],
            )
          ],
        ),
      ),
    );
  }
}
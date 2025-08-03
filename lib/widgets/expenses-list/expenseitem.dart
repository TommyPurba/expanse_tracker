import 'package:flutter/material.dart';
import 'package:thefour/models/expense.dart';
import 'package:thefour/widgets/expense.dart';

class Expenseitem extends StatelessWidget {
  const Expenseitem(this.expense, {super.key});

  final Expenses expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      //buat padding agar item agar mempunyai jarak dengan garis card
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        // setelah dibuat card dibuatkan kedalam 1 colum jadi ada struturenya
        // dari column akan ada title sebagai juduk
        // kemudian akan dipisahkan lagi tiap row , row kedua ada amoun category dan date
        // dan di dalam row kdua akan dipisahkan lg amoutn dan (category dan date)
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
                    Icon(categoryIcon[expense.category]),
                    const SizedBox(height: 9,),
                    Text(expense.formattedDate)
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
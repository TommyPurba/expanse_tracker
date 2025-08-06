import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thefour/models/expense.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
const NewExpense ({super.key});

@override
  State<NewExpense> createState() {
   return _NewExpenseState();
  }

}

class _NewExpenseState extends State<NewExpense>{
  
  final _titleControler = TextEditingController();
  final _amountControler = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _presentDate () async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year -1,now.month, now.day);
    final pickedDate = await showDatePicker(context: context,initialDate: now, firstDate: firstDate, lastDate: now);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleControler.dispose();
    _amountControler.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   return Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      children: [
        TextField(
          controller: _titleControler,
          maxLength: 50,
          decoration: InputDecoration(
            label: Text("Title")
          ),
        ),
         Row(
          children: [
            Expanded(
              child: TextField(
                        controller: _amountControler,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                           prefixText: '\$',
                          label: Text("amount")
                        ),
                 ),
            ),
            const SizedBox(width: 6,),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       Text(_selectedDate == null ?'No date Selected':formatter.format(_selectedDate!) ),
                      IconButton(
                        onPressed: _presentDate, 
                        icon: Icon(Icons.calendar_month)
                        )
                    ],
            )
            )
          ],
         ),
        const SizedBox(height: 16,),
        Row(
          children: [
            DropdownButton(
              value: _selectedCategory,
              items: Category.values.map(
                (category) => DropdownMenuItem(
                  value: category,
                  child: Text(
                    category.name.toUpperCase()
                    ),
                  )
                ).toList(), 
              onChanged: (value){
                if(value == null){
                  return;
                }
                setState(() {
                  _selectedCategory = value;
                });
              }),
            const Spacer(),
            ElevatedButton(onPressed: (){
             Navigator.pop(context);
            }, 
            child: Text('cancel')),
            ElevatedButton(onPressed: (){
               print(_titleControler.text);
              print(_amountControler.text);
            }, 
            child: Text('Save Expense'))
          ],
        ),
      ],
    ),
    );
  }
}
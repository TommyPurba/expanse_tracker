import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        Row(
          children: [
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
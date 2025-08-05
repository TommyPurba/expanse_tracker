import 'package:flutter/material.dart';

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
         TextField(
          controller: _amountControler,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            prefixText: '\$',
            label: Text("amoun")
          ),
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
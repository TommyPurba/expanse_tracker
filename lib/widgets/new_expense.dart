import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thefour/models/expense.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
const NewExpense ({super.key, required this.onaddexpense});

final void Function(Expenses expense) onaddexpense;

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

  void _submitExpenseDate(){
    final enteredAmount = double.tryParse(_amountControler.text); // trypase('heelo') = null or  trypase(1.22)= 1.22
    final amountIsValid = enteredAmount == null || enteredAmount <0;
    if(_titleControler.text.trim().isEmpty || amountIsValid || _selectedDate == null){
      showDialog(
        context: context, 
        builder: (ctx)=> AlertDialog(
          title: Text(
              'Invalid Input'
              ),
          content: Text(
            'Please Make sure a valid Title, amount, Date, and Category Entered.'
          ),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(ctx);
              }, 
              child: Text('Okay'),
              ),
          ],
            )
        );

      return;
    }
    widget.onaddexpense(Expenses(tittle: _titleControler.text, amount: enteredAmount, date: _selectedDate!, category: _selectedCategory));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleControler.dispose();
    _amountControler.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final keyBoardSpace = MediaQuery.of(context).viewInsets.bottom;
   return SizedBox(
    height: double.infinity,
     child: SingleChildScrollView(
       child: Padding(
        padding: EdgeInsets.fromLTRB(16, 48, 16, keyBoardSpace + 16),
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
                ElevatedButton(
                  onPressed: _submitExpenseDate, 
                child: Text('Save Expense'))
              ],
            ),
          ],
        ),
        ),
     ),
   );
  }
}
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:intl/intl.dart';
 import 'package:thefour/models/expense.dart';

 // INFO: Formatter untuk mengubah objek DateTime menjadi string dengan format (misal: 8/11/2025).
 final formatter = DateFormat.yMd();

 class NewExpense extends StatefulWidget {
   const NewExpense({super.key, required this.onaddexpense});

   // INFO: Ini adalah fungsi yang "dititipkan" dari widget induk (parent).
   // Gunanya untuk mengirim data expense yang baru dibuat kembali ke widget induk.
   final void Function(Expenses expense) onaddexpense;

   @override
   State<NewExpense> createState() {
     return _NewExpenseState();
   }
 }

 class _NewExpenseState extends State<NewExpense> {
   // INFO: Controller untuk mengambil teks dari TextField Judul.
   final _titleControler = TextEditingController();
   // INFO: Controller untuk mengambil teks dari TextField Jumlah.
   final _amountControler = TextEditingController();

   // INFO: Variabel untuk menyimpan tanggal yang dipilih. Nullable (?) karena awalnya kosong.
   DateTime? _selectedDate;
   // INFO: Variabel untuk menyimpan kategori yang dipilih, dengan nilai awal 'leisure'.
   Category _selectedCategory = Category.leisure;

   // FUNGSI: Menampilkan dialog pemilih tanggal (date picker).
   void _presentDate() async {
     final now = DateTime.now();
     // Batas tanggal yang bisa dipilih adalah 1 tahun ke belakang dari hari ini.
     final firstDate = DateTime(now.year - 1, now.month, now.day);

     // 'await' menunggu sampai pengguna memilih tanggal.
     final pickedDate = await showDatePicker(
         context: context,
         initialDate: now,
         firstDate: firstDate,
         lastDate: now);

     // setState() memberitahu Flutter untuk membangun ulang UI dengan data tanggal yang baru.
     setState(() {
       _selectedDate = pickedDate;
     });
   }

   void _showDialog(){
    if(Platform.isIOS){
      showCupertinoDialog(
        context: context, builder: (ctx)=> CupertinoAlertDialog(
           title: const Text('Invalid Input'),
           content: const Text(
               'Please make sure a valid title, amount, date, and category was entered.'),
           actions: [
             TextButton(
               onPressed: () {
                 Navigator.pop(ctx); // Tutup dialog.
               },
               child: const Text('Okay'),
             ),
           ],
        )
      );
    }
    else {
      showDialog(
               context: context,
               builder: (ctx) => AlertDialog(
                 title: const Text('Invalid Input'),
                 content: const Text(
                     'Please make sure a valid title, amount, date, and category was entered.'),
                 actions: [
                   TextButton(
                     onPressed: () {
                       Navigator.pop(ctx); // Tutup dialog.
                     },
                     child: const Text('Okay'),
                   ),
                 ],
               ),
             );
    }
   }

   // FUNGSI: Memvalidasi dan menyimpan data pengeluaran baru.
   void _submitExpenseDate() {
     // INFO: Mengubah input jumlah (string) menjadi angka (double).
     // double.tryParse lebih aman karena akan menghasilkan 'null' jika input bukan angka,
     // tidak seperti double.parse yang akan error.
     final enteredAmount = double.tryParse(_amountControler.text);
     
     // INFO: Cek apakah jumlah yang dimasukkan tidak valid (bukan angka atau negatif).
     final amountIsInvalid = enteredAmount == null || enteredAmount < 0;

     // INFO: Blok validasi utama.
     // Jika judul kosong, jumlah tidak valid, atau tanggal belum dipilih, tampilkan dialog error.
     if (_titleControler.text.trim().isEmpty || amountIsInvalid || _selectedDate == null) {
       _showDialog;
       return; // Hentikan eksekusi fungsi jika ada data yang tidak valid.
     }

     // INFO: Jika semua data valid, panggil fungsi 'onaddexpense' dari widget induk.
     // Tanda seru (!) pada _selectedDate! memberitahu Dart bahwa kita yakin variabel ini tidak null.
     widget.onaddexpense(Expenses(
         tittle: _titleControler.text,
         amount: enteredAmount,
         date: _selectedDate!,
         category: _selectedCategory));

     // INFO: Tutup halaman/modal 'NewExpense' setelah data berhasil disimpan.
     Navigator.pop(context);
   }

   // FUNGSI: Lifecycle method yang dipanggil saat widget akan dihapus.
   @override
   void dispose() {
     // PENTING: Selalu dispose controller untuk mencegah kebocoran memori (memory leak).
     _titleControler.dispose();
     _amountControler.dispose();
     super.dispose();
   }

   @override
   Widget build(BuildContext context) {
     // INFO: Mendapatkan informasi seberapa tinggi keyboard menutupi layar.
     // Berguna agar UI tidak tertutup saat keyboard muncul.
     final keyBoardSpace = MediaQuery.of(context).viewInsets.bottom;

     // INFO: LayoutBuilder digunakan untuk membuat UI yang responsif.
     // 'constraints' memberikan informasi ukuran dari parent widget.
     return LayoutBuilder(builder: (ctx, constraints) {
       final width = constraints.maxWidth;

       // INFO: SizedBox + SingleChildScrollView memastikan konten bisa di-scroll dan tidak error
       // jika ukurannya melebihi layar (misalnya saat keyboard muncul).
       return SizedBox(
         height: double.infinity,
         child: SingleChildScrollView(
           child: Padding(
             padding: EdgeInsets.fromLTRB(16, 16, 16, keyBoardSpace + 16),
             child: Column(
               children: [
                 // =============================================================
                 // KONDISI RESPONSif: Jika layar lebar (misal: mode landscape atau tablet)
                 // =============================================================
                 if (width >= 600)
                   Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       // Judul dan Jumlah bersebelahan.
                       Expanded(
                         child: TextField(
                           controller: _titleControler,
                           maxLength: 50,
                           decoration: const InputDecoration(label: Text("Title")),
                         ),
                       ),
                       const SizedBox(width: 12),
                       Expanded(
                         child: TextField(
                           controller: _amountControler,
                           keyboardType: TextInputType.number,
                           decoration: const InputDecoration(
                               prefixText: '\$ ', label: Text("amount")),
                         ),
                       ),
                     ],
                   )
                 else
                   // ===========================================================
                   // KONDISI RESPONSif: Jika layar sempit (misal: mode portrait HP)
                   // ===========================================================
                   TextField(
                     controller: _titleControler,
                     maxLength: 50,
                     decoration: const InputDecoration(label: Text("Title")),
                   ),

                 // ===========================================================
                 // BARIS KEDUA (LAYOUT LEBAR)
                 // ===========================================================
                 if (width >= 600)
                   Row(
                     children: [
                       DropdownButton(
                         value: _selectedCategory,
                         items: Category.values
                             .map((category) => DropdownMenuItem(
                                   value: category,
                                   child: Text(category.name.toUpperCase()),
                                 ))
                             .toList(),
                         onChanged: (value) {
                           if (value == null) return;
                           setState(() => _selectedCategory = value);
                         },
                       ),
                       const Spacer(), // Mendorong item ke ujung.
                       Row(
                         children: [
                           Text(_selectedDate == null
                               ? 'No date Selected'
                               : formatter.format(_selectedDate!)),
                           IconButton(
                               onPressed: _presentDate,
                               icon: const Icon(Icons.calendar_month))
                         ],
                       )
                     ],
                   )
                 else
                   // ===========================================================
                   // BARIS KEDUA (LAYOUT SEMPIT)
                   // ===========================================================
                   Row(
                     children: [
                       Expanded(
                         child: TextField(
                           controller: _amountControler,
                           keyboardType: TextInputType.number,
                           decoration: const InputDecoration(
                               prefixText: '\$ ', label: Text("amount")),
                         ),
                       ),
                       const SizedBox(width: 6),
                       Expanded(
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             Text(_selectedDate == null
                                 ? 'No date Selected'
                                 : formatter.format(_selectedDate!)),
                             IconButton(
                                 onPressed: _presentDate,
                                 icon: const Icon(Icons.calendar_month))
                           ],
                         ),
                       )
                     ],
                   ),
                 const SizedBox(height: 16),

                 // ===========================================================
                 // BARIS TOMBOL (LAYOUT LEBAR)
                 // ===========================================================
                 if (width >= 600)
                   Row(
                     children: [
                       const Spacer(),
                       ElevatedButton(
                           onPressed: () => Navigator.pop(context),
                           child: const Text('Cancel')),
                       const SizedBox(width: 8),
                       ElevatedButton(
                           onPressed: _submitExpenseDate,
                           child: const Text('Save Expense'))
                     ],
                   )
                 else
                   // ===========================================================
                   // BARIS TOMBOL (LAYOUT SEMPIT)
                   // ===========================================================
                   Row(
                     children: [
                       DropdownButton(
                         value: _selectedCategory,
                         items: Category.values
                             .map((category) => DropdownMenuItem(
                                   value: category,
                                   child: Text(category.name.toUpperCase()),
                                 ))
                             .toList(),
                         onChanged: (value) {
                           if (value == null) return;
                           setState(() => _selectedCategory = value);
                         },
                       ),
                       const Spacer(),
                       ElevatedButton(
                           onPressed: () => Navigator.pop(context),
                           child: const Text('Cancel')),
                       const SizedBox(width: 8),
                       ElevatedButton(
                           onPressed: _submitExpenseDate,
                           child: const Text('Save Expense'))
                     ],
                   ),
               ],
             ),
           ),
         ),
       );
     });
   }
 }
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:thefour/widgets/expense.dart';

var kColourScheem = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));
var kDarkColourSccheem = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 9, 99, 125),
  );


void main(){
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColourSccheem,
        cardTheme: CardTheme().copyWith(
          color: kDarkColourSccheem.secondaryContainer,
          margin: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColourSccheem.primaryContainer,
            foregroundColor: kDarkColourSccheem.onPrimaryContainer,
          )
        )
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColourScheem,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColourScheem.onPrimaryContainer,
          foregroundColor: kColourScheem.primaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
          color: kColourScheem.secondaryContainer,
          margin: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColourScheem.primaryContainer,
          )
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.normal,
            color: kColourScheem.onSecondaryContainer,
            fontSize: 14,
          )
        )
      ),
      home: Expense(),
    )
  );
}



// ini cara agar ketika mode landscape tampilan apk masih tetap protait
// void main(){
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations(
//     [
//       DeviceOrientation.portraitUp,
//     ]
//   ).then(
//     (fn) {
//        runApp(
//     MaterialApp(
//       darkTheme: ThemeData.dark().copyWith(
//         colorScheme: kDarkColourSccheem,
//         cardTheme: CardTheme().copyWith(
//           color: kDarkColourSccheem.secondaryContainer,
//           margin: EdgeInsets.symmetric(
//             horizontal: 16,
//             vertical: 8,
//           ),
//         ),
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: kDarkColourSccheem.primaryContainer,
//             foregroundColor: kDarkColourSccheem.onPrimaryContainer,
//           )
//         )
//       ),
//       theme: ThemeData().copyWith(
//         colorScheme: kColourScheem,
//         appBarTheme: AppBarTheme().copyWith(
//           backgroundColor: kColourScheem.onPrimaryContainer,
//           foregroundColor: kColourScheem.primaryContainer,
//         ),
//         cardTheme: CardTheme().copyWith(
//           color: kColourScheem.secondaryContainer,
//           margin: EdgeInsets.symmetric(
//             horizontal: 16,
//             vertical: 8,
//           ),
//         ),
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: kColourScheem.primaryContainer,
//           )
//         ),
//         textTheme: ThemeData().textTheme.copyWith(
//           titleLarge: TextStyle(
//             fontWeight: FontWeight.normal,
//             color: kColourScheem.onSecondaryContainer,
//             fontSize: 14,
//           )
//         )
//       ),
//       home: Expense(),
//     )
//   );
//     }
//   );
 
// }
# 📊 Flutter Expense Tracker

A simple expense tracker application built with Flutter.  
Users can add, view, and delete expenses, with a summary chart by category.

---

## 🚀 Features
- Add expense with **title**, **amount**, **date**, and **category**
- View expenses in a scrollable list
- Swipe to delete expenses
- Summary chart by category
- Clean and responsive UI

---

## 🛠 Code Highlights
- **State Management:** Simple `setState` for updating UI
- **Custom Widgets:** Separate widgets for form, list, and chart
- **Data Handling:** Local list of `Expense` model
- **Formatting:** `intl` package for date and currency formatting

---

## 📂 Project Structure
lib/
main.dart
models/
expense.dart
screens/
expenses_screen.dart
widgets/
new_expense.dart
expenses_list.dart
expense_item.dart
chart.dart
pubspec.yaml
README.md


---

## 📦 Dependencies
- **Flutter**: 3.19.6  
- **Dart**: 3.3.3  
- **intl**: ^0.19.0 (for date formatting)

---

## 🖥 How to Run
Make sure you have Flutter **3.19.6** and Dart **3.3.3** installed.

```bash
# Clone this repository
git clone https://github.com/TommyPurba/flutter-expense-tracker.git

# Navigate to the project folder
cd flutter-expense-tracker

# Install dependencies
flutter pub get

# Run the application
flutter run

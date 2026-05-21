import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final amountController = TextEditingController();
  final titleController = TextEditingController();
  DateTime? selectedDate;

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || selectedDate == null) {
      return;
    }
    widget.addTransaction(
        titleController.text, amountController.text, selectedDate);

    Navigator.pop(context);
  }

  void presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return DateTime.now();
      } else {
        setState(() {
          selectedDate = pickedDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3, // Make contrast between card body and background
        color: Theme.of(context).primaryColorLight,
        child: Container(
          padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.all(4.0),
                child: TextField(
                  decoration: const InputDecoration(labelText: "Title"),
                  controller: titleController,
                  onSubmitted: (_) => submitData(),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(4.0),
                child: TextField(
                  decoration: const InputDecoration(labelText: "Cost"),
                  keyboardType: TextInputType.number,
                  controller: amountController,
                  onSubmitted: (_) => submitData(),
                ),
              ),
              Container(
                //height: 50,
                child: Row(
                  children: [
                    const SizedBox(width: 9),
                    Text(selectedDate == null
                        ? "No Date Chosen!"
                        : DateFormat.yMd().format(selectedDate!)),
                    const SizedBox(width: 9),
                    TextButton(
                      onPressed: () => presentDatePicker(),
                      child: const Text(
                        "Set Date",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // 🟢 FIXED: Changed 'primary' to 'backgroundColor'
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  onPressed: () => submitData(),
                  child: Text(
                    "Add Transaction",
                    style: TextStyle(
                      // Tip: You can also use Theme.of(context).colorScheme.onPrimary here if you prefer!
                      color: Theme.of(context).scaffoldBackgroundColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

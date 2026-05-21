import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/Transaction.dart';
import '/widgets/chat_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recenttransaction;
  const Chart(this.recenttransaction);

  List<Map<String, Object>> get lastweektransactions {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      double totalsum = 0;
      for (var i = 0; i < recenttransaction.length; i++) {
        if (recenttransaction[i].date.day == weekday.day &&
            recenttransaction[i].date.month == weekday.month &&
            recenttransaction[i].date.year == weekday.year) {
          totalsum = totalsum + recenttransaction[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': totalsum
      };
    });
  }

  double get totalspending {
    return lastweektransactions.fold(0.0, (previousValue, element) {
      return previousValue + (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColorLight,
      elevation: 8,
      margin: const EdgeInsets.all(14),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: lastweektransactions.map((data) {
            // return Text(" ${data['day']} : ${data['amount']} ");
            return Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: ChartBar(
                  (data['day'] as String),
                  (data['amount'] as double),
                  totalspending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / totalspending),
            );
          }).toList()),
    );
  }
}

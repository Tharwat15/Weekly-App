import 'dart:html';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/Transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;

  TransactionList(this.userTransactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(children: <Widget>[
              const SizedBox(height: 10),
              const Text("There are no transactions yet !"),
              const SizedBox(height: 15),
              Container(
                height: constraints.maxHeight * 0.8,
                child: const Image(
                  image: AssetImage("assets/images/waiting.png"),
                  fit: BoxFit.cover,
                ),
              )
            ]);
          })
        : ListView.builder(
            itemCount: userTransactions.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                color: Theme.of(context).primaryColorLight,
                elevation: 5,
                child: ListTile(
                    leading: CircleAvatar(
                        radius: 28,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: FittedBox(
                            child: Text(
                                "\$${userTransactions[index].amount.toStringAsFixed(0)}"),
                          ),
                        )),
                    title: Text(userTransactions[index].title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )),
                    subtitle: Text(
                      DateFormat.yMMMd().format(userTransactions[index].date),
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    trailing: MediaQuery.of(context).size.width > 400
                        ? TextButton.icon(
                            onPressed: () =>
                                deleteTransaction(userTransactions[index].id),
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            label: Text(
                              "Delete",
                              style: TextStyle(color: Colors.red),
                            ))
                        : IconButton(
                            onPressed: () =>
                                deleteTransaction(userTransactions[index].id),
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          )),
              );
            },
          );
  }
}

import 'package:expences/widgets/chart.dart';
import 'package:expences/widgets/new_transaction_card.dart';
import 'package:expences/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionsDashboard extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionsDashboard({Key key, @required this.transactions})
      : super(key: key);

  List<Transaction> get _recentTransactions {
    return transactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            WeekChart(
              recentTransactions: _recentTransactions,
            ),
            transactions.isEmpty
                ? Column(
                    children: <Widget>[
                      Text(
                        "No Transactions here",
                        style: Theme.of(context).textTheme.title,
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 300,
                        child: Image.asset(
                          'assets/images/empty_folder.png',
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  )
                : TransactionList(
                    transactionsList: transactions,
                  ),
          ],
        ),
      ),
    );
  }
}

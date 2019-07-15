import 'package:expences/widgets/new_transaction_card.dart';
import 'package:expences/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionsDashboard extends StatefulWidget {
  TransactionsDashboard({Key key}) : super(key: key);

  _TransactionsDashboardState createState() => _TransactionsDashboardState();
}

class _TransactionsDashboardState extends State<TransactionsDashboard> {
  final List<Transaction> transactions = [
    Transaction(
        id: "t1", title: "New Shoes", amount: 69.99, date: DateTime.now()),
    Transaction(
        id: "t2", title: "New Tshirt", amount: 19.99, date: DateTime.now())
  ];

  void addNewTx(Transaction tx) {
    setState(() {
     transactions.add(tx); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('CHART'),
              elevation: 5,
            ),
          ),
          NewTransactionCard(
            onCreateNewTransaction: (newTX) {addNewTx(newTX);},
          ),
          TransactionList(
            transactionsList: transactions,
          ),
        ],
      ),
    );
  }
}

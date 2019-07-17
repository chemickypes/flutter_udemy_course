import 'package:expences/widgets/new_transaction_card.dart';
import 'package:expences/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionsDashboard extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionsDashboard({Key key, @required this.transactions}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
            
            TransactionList(
              transactionsList: transactions,
            ),
          ],
        ),
      ),
    );
  }
  
}


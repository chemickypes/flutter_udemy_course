import 'package:flutter/material.dart';

import '../models/transaction.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionsList;
  const TransactionList({Key key, @required this.transactionsList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: transactionsList.map((transaction) {
          return TransactionCard(
            transaction: transaction,
          );
        }).toList(),
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  TransactionCard({Key key, @required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: FittedBox(
                  child: Text(
                    "\$${transaction.amount.toStringAsFixed(2)}",
                  ),
                ),
              ),
            ),
            title: Text(
              transaction.title,
              style: Theme.of(context).textTheme.title,
            ),
            subtitle: Text(DateFormat.yMMMMd().format(transaction.date)),
          ),
      ),
    );
  }
}

/*
child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "\$${transaction.amount.toStringAsFixed(2)}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).textTheme.title.color),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        transaction.title,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.title,
                      ),
                      Text(
                        DateFormat.yMMMMd().format(transaction.date),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
*/

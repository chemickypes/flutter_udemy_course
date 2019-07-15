import 'package:expences/models/transaction.dart';
import 'package:flutter/material.dart';

class NewTransactionCard extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function onCreateNewTransaction;

  NewTransactionCard({Key key, this.onCreateNewTransaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: FlatButton(
                  child: Text('Add Transaction'),
                  textColor: Colors.purple,
                  onPressed: () {
                    onCreateNewTransaction(Transaction(
                        id: DateTime.now().toString(),
                        title: titleController.text,
                        amount: double.parse(amountController.text),
                        date: DateTime.now()));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

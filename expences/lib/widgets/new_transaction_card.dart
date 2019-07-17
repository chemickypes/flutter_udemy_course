import 'package:expences/models/transaction.dart';
import 'package:flutter/material.dart';

class NewTransactionCard extends StatefulWidget {
  final Function onCreateNewTransaction;

  NewTransactionCard({Key key, this.onCreateNewTransaction}) : super(key: key);

  @override
  _NewTransactionCardState createState() => _NewTransactionCardState();
}

class _NewTransactionCardState extends State<NewTransactionCard> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredtitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredtitle.isEmpty || enteredAmount <= 0) {
      return;
    } else {
      widget.onCreateNewTransaction(Transaction(
          id: DateTime.now().toString(),
          title: enteredtitle,
          amount: enteredAmount,
          date: DateTime.now()));
    }

    Navigator.of(context).pop();
  }

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
                keyboardType: TextInputType.number,
                controller: amountController,
                onSubmitted: (_) => submitData(),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: FlatButton(
                  child: Text('Add Transaction'),
                  textColor: Colors.purple,
                  onPressed: submitData,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

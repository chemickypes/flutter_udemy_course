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
                height: 70,
                child: Row(
                  children: <Widget>[
                    Text("No Date Chosern!"),
                    FlatButton(
                        textColor: Theme.of(context).primaryColor,
                        child: Text(
                          "Choose Date",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {},
                      )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: RaisedButton(
                  textColor: Theme.of(context).textTheme.button.color,
                  color: Theme.of(context).primaryColor,
                  child: Text('Add Transaction'),
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

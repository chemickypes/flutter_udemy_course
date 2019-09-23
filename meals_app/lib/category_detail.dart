import 'package:flutter/material.dart';

class CategoryDetail extends StatefulWidget {
  CategoryDetail({Key key}) : super(key: key);

  _CategoryDetailState createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {

  @override
  Widget build(BuildContext context) {

    final arguments = ModalRoute.of(context).settings.arguments as Map<String,String>;
    final title = arguments['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('data'),
      ),
    );
  }
}
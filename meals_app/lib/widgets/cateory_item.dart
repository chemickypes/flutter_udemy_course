import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key key, this.title, this.color, this.id}) : super(key: key);
  final String title;
  final Color color;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('/category_detail',
          arguments: <String,String>{
            'id' : id,
            'title' : title
          });
        },
        borderRadius: BorderRadius.circular(16),
        splashColor: Theme.of(context).accentColor,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [color.withOpacity(0.7), color],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}

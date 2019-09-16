import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _calculateDim(int index) {
    final c = (index + 1) % 4;
    switch (c) {
      case 0:
        return 2;
      case 1:
        return 3;
      case 2:
        return 1;
      case 3:
        return 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16),
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            staggeredTileBuilder: (index) {
              return StaggeredTile.count(
                index == 0 ? 2 : 1,
                index == 0 ? 1.5 : _calculateDim(index),
              );
            },
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            itemCount: 15,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_back),
                        ),
                        IconButton(
                          icon: Icon(Icons.more_horiz),
                          onPressed: () {},
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://www.fillmurray.com/640/360"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 2,
                                  color: Color.fromARGB(255, 176, 190, 197),
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    Icons.add,
                                    color: Color.fromARGB(255, 176, 190, 197),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Follow',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 176, 190, 197),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Bill Murrey",
                      style: TextStyle(
                          color: Color.fromARGB(255, 62, 76, 91),
                          fontSize: 40,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Color.fromARGB(255, 176, 190, 197),
                        ),
                        Text(
                          'Roma, It',
                          style: TextStyle(
                            color: Color.fromARGB(255, 176, 190, 197),
                            fontSize: 18
                          ),
                        )
                      ],
                    )
                  ],
                );
              } else {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    child: Image.network(
                      "https://www.fillmurray.com/640/360",
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

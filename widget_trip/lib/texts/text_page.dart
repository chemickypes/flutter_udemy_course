import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  const TextPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text("Base Text"),
            Text(
              "Another text",
              style: TextStyle(
                  color: Colors.black,
                  background: Paint()..color = Colors.indigoAccent,
                  fontSize: 22,
                  letterSpacing: 3),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Laura TI AMO',
              style: TextStyle(
                  foreground: Paint()
                    ..color = Colors.black
                    ..strokeWidth = 2
                    ..style = PaintingStyle.stroke,
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                  background: Paint()..color = Colors.pink[200],
                  letterSpacing: 6),
            ),
            Text(
              'Stavolta scrivo qualcosa, qualcosa di più lungo per andare a capo, per raccontare la nostra storia, la storia di chi scrive codice e passa inosservato. Tanto importante quando nascosto.',
              style: TextStyle(
                fontSize: 18,
                letterSpacing: 2,
                wordSpacing: 3,
              ),
            ),
            Text(
              "Titolone",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.lime,
                  letterSpacing: 3,
                  shadows: <Shadow>[
                    Shadow(
                        color: Colors.black,
                        offset: Offset(1, 4),
                        blurRadius: 3)
                  ]),
            ),
            Text(
              'Titolone 2',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 3,
                  fontSize: 45,
                  shadows: <Shadow>[
                    Shadow(
                        color: Colors.blueGrey,
                        offset: Offset(1, 4),
                        blurRadius: 3),
                    Shadow(
                        color: Colors.pinkAccent,
                        offset: Offset(-2, -2),
                        blurRadius: 3),
                  ]),
            ),
            Text(
              'Altro testo lunghino per provare una nuova font',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Manjari',
              ),
            ),
            Text(
              'Altro testo lunghino per provare una nuova font con Manjari Daje',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Manjari',
                fontWeight: FontWeight.w200,
                color: Colors.pink[200],
                background: Paint()..color = Colors.brown,
              ),
            ),
            Text(
              "Testo da destra a sinistra",
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 22),
            ),
            Container(
              child: Center(
                child: Container(
                  color: Colors.indigoAccent,
                  constraints: BoxConstraints.expand(height: 40, width: 100),
                  child: Text(
                    'Testo bello bello',
                    softWrap: true,
                  ),
                ),
              ),
            ),
            Text(
              'Altra font: Chilanka',
              style: TextStyle(
                fontFamily: 'Chilanka',
                fontSize: 22,
              ),
            )
          ],
        ),
      ),
    );
  }
}

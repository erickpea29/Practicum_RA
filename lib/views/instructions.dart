import 'package:cook/views/Home.dart';
import 'package:cook/widgets/my_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:cook/app_styles.dart';
import '/size_configs.dart';
import 'tabs.dart';

class Instructions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Instrucciones"),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(255, 89, 0, 1)),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: [
                Text(
                  '\n 1. Selecciona el capítulo deseado',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Color.fromRGBO(255, 89, 0, 1),
                  ),
                  textAlign: TextAlign.center,
                ),
                Image.asset(
                  'assets/images/uno.jpeg',
                  height: 125.0,
                ),
                Text(
                  '\n2. Enfoca la cámara y apunta hacia una superficie plana',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Color.fromRGBO(255, 89, 0, 1),
                  ),
                  textAlign: TextAlign.center,
                ),
                Image.asset(
                  'assets/images/dos.gif',
                  height: 150.0,
                ),
                Text(
                  '\n3. Presiona play y da inicio a la animación',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Color.fromRGBO(255, 89, 0, 1),
                  ),
                  textAlign: TextAlign.center,
                ),
                Image.asset(
                  'assets/images/tres.jpeg',
                  height: 150.0,
                ),
                Text('\n'),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(255, 89, 0, 1),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
                  },
                  child: Text(
                    '¡Lo Tengo!',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

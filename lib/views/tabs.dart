import 'package:cook/views/pages.dart';
import 'package:cook/widgets/my_text_button.dart';
import 'package:flutter/material.dart';
import 'Home.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int mi_indice = 0;
  final pantallas = <Widget>[Home()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: IndexedStack(
            index: mi_indice,
            children: pantallas,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color.fromRGBO(255, 89, 0, 1),
            selectedItemColor: Colors.black,
            iconSize: 28,
            currentIndex: mi_indice,
            onTap: (index) => setState(() => mi_indice = index),
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.contact_mail), label: 'Contacto'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.question_answer), label: 'Acerca'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble), label: 'Chat')
            ],
          ),
        ));
  }
}

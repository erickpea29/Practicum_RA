import 'package:cook/views/contact.dart';
import 'package:cook/views/instructions.dart';
import 'package:cook/views/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'comment.dart';

import 'Home.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Facultad de Derecho'),
            accountEmail: Text('Universidad Anáhuac México Norte'),
            currentAccountPicture: CircleAvatar(
              child: Image.asset("assets/images/Logo_Anáhuac.png"),
              backgroundColor: Color.fromRGBO(255, 89, 0, 1), //Colors.black,
            ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 89, 0, 1),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Menu"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.web),
            title: Text("Tu Facultad"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebViewPage(
                      'https://www.anahuac.mx/mexico/EscuelasyFacultades/derecho/derecho'),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.menu_book_outlined),
            title: Text("Contacto"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Contact()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.insert_comment_outlined),
            title: Text("Enviar comentarios"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Comment()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.help_outline_rounded),
            title: Text("Ayuda"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Instructions()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Salir"),
            onTap: () {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
    );
  }
}

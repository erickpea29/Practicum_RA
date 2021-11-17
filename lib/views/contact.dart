import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'dart:io';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final double coverHeight = 250;
  final double profileHeight = 125;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Contacto"),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(255, 89, 0, 1)),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[buildTop(), buildContent()],
      ),
    );
  }

  Widget buildContent() => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Dra. Doraye Rueda Del Valle',
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
            ),
            Center(
                child: Text('\nCoordinadora del Área Fiscal Administrativa\n')),
                SizedBox(height:10),
                ListTile(
                  title: Icon(Icons.touch_app),
                  //title: Text('Presiona un icono para ponerte automaticamente en contacto', 
                    //textAlign:TextAlign.center,
                  //),
                  tileColor: Colors.orange.shade50,
                  onTap: (){
                    showDialog(
                      context: context, 
                      builder: (context) => AlertDialog(
                        backgroundColor: Color.fromRGBO(255, 89, 0, 1),
                        title: Text('Toca el icono de llamada o whatsapp para ponerte automáticamente en contacto',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      )
                    );
                  },
                ),
                SizedBox(height:10),
            ListTile(
              leading: Icon(
                Icons.email,
                color: Colors.black,
              ),
              title: Text("drueda@anahuac.mx"),
            ),
            ListTile(
              leading: Icon(
                Icons.phone_enabled_rounded,
                color: Colors.black,
              ),
              title: Text("(55) 5627 0210 - Ext. 8251"),
              selectedTileColor: Colors.orange,
              onTap: () {
                hacerLlamada();
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_phone, color: Colors.black),
              title: Text("Whatsapp"),
              onTap: () {
                String mensaje = "¡Buenas Tardes!";
                String destinatario = "+527221545067";
                openwhatsapp(mensaje, destinatario);
              },
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      );

  Widget buildTop() {
    final top = coverHeight - profileHeight / 3;
    final bottom = profileHeight / 1;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: bottom), child: buildCoverImage()),
        Positioned(
          top: top,
          child: buildProfileImage(),
        ),
      ],
    );
  }

  Widget buildCoverImage() {
    return Container(
      color: Color.fromRGBO(255, 89, 0, .7),
      child: Image.asset('assets/images/Contact.png'),
      width: double.infinity,
      height: coverHeight,
    );
  }

  Widget buildProfileImage() => CircleAvatar(
        radius: (profileHeight / 2) + 15,
        backgroundColor: Color.fromRGBO(255, 131, 3, 1), //Colors.black,
        child: Image.asset("assets/images/Profile.png"),
      );

  openwhatsapp(String message, String destinatario) async {
    var whatsapp = destinatario;
    var whatsappURl_android =
        "whatsapp://send?phone=" + whatsapp + "&text=" + message;
    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse(message)}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURL_ios)) {
        await launch(whatappURL_ios, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no instalado")));
      }
    } else {
      // android , web
      if (await canLaunch(whatsappURl_android)) {
        await launch(whatsappURl_android);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no instalado")));
      }
    }
  }

  hacerLlamada() async {
    const url = 'tel:+527221545067';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'error al llamar la $url';
    }
  }
}

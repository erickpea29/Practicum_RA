import 'package:cook/views/pages.dart';
import 'package:cook/widgets/my_text_button.dart';
import 'package:flutter/material.dart';
import 'sidebar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final samples = [
      Sample(
        'Introducción',
        'La importancia de estudiar Derecho Romano',
        Icons.looks_one,
        () => Navigator.of(context)
            .push<void>(MaterialPageRoute(builder: (c) => Instructions())),
      ),
    ];
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
          title: Text("Guía Interactiva Virtual"),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(255, 89, 0, 1)),
      body:
          ListView(children: samples.map((s) => SampleItem(item: s)).toList()),
    );
  }
}

class SampleItem extends StatelessWidget {
  const SampleItem({
    required this.item,
    Key? key,
  }) : super(key: key);
  final Sample item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => item.onTap(),
        child: ListTile(
          leading: Icon(
            item.icon,
            size: 35.0,
            color: Colors.black87,
          ),
          title: Text(
            item.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(255, 89, 0, 1),
            ),
          ),
          subtitle: Text(
            item.description,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
      ),
    );
  }
}

class Sample {
  const Sample(this.title, this.description, this.icon, this.onTap);
  final String title;
  final String description;
  final IconData icon;
  final Function onTap;
}

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class Comment extends StatefulWidget {
  const Comment({Key? key}) : super(key: key);

  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  //Controlers
  final TextEditingController _commentC = TextEditingController();
  var selectectedType; //Variable that catches the list element value
  //Asigns a level of importance to the comments
  List<String> _conceptType = <String>[
    'Urgente',
    'Importante',
    'Sin importancia'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comentarios"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(255, 89, 0, 1),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: Center(
                    child: Text(
                      'Escríbenos',
                      style: TextStyle(
                        fontSize: 25,
                        color: Color.fromRGBO(255, 89, 0, 1),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Center(
                    child: Column(
                      children: [
                        //  Center(
                        //    child: TextFormField(
                        //      controller: _commentC,
                        //      minLines: 1,
                        //      maxLines: 5,
                        //      keyboardType: TextInputType.multiline,
                        //      decoration: InputDecoration(
                        //        hintText: 'Ingresa tu comentario',
                        //        hintStyle: TextStyle(
                        //          color: Colors.grey,
                        //        ),
                        //        border: OutlineInputBorder(
                        //          borderSide: BorderSide(
                        //            color: Colors.deepOrangeAccent,
                        //          ),
                        //          borderRadius: BorderRadius.all(
                        //            Radius.circular(10),
                        //          ),
                        //        ),
                        //      ),
                        //    ),
                        //  ),
                        //DROPDOWN LIST
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.announcement_outlined,
                                color: Color.fromRGBO(255, 89, 0, 1)),
                            DropdownButton(
                              hint: Text('Selecciona importancia'),
                              items: _conceptType
                                  .map((value) => DropdownMenuItem(
                                      child: Text(
                                        value,
                                      ),
                                      value: value))
                                  .toList(),
                              onChanged: (selectedConceptType) {
                                setState(() {
                                  selectectedType = selectedConceptType;
                                });
                              },
                              value: selectectedType,
                              dropdownColor: Colors.white,
                              iconEnabledColor: Color.fromRGBO(255, 89, 0, 1),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _commentC,
                          minLines: 1,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            labelText: 'Comentario',
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(255, 89, 0, 1),
                            ),
                            hintText: 'Ingresa tu comentario (max 5 renglones)',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(90.0),
                              ),
                            ),
                          ),
                        ),
                        //SHOWS BUTTON AND IMAGE
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(255, 89, 0, 1),
                            ),
                            onPressed: () {
                              final String? a = selectectedType;
                              final String? c = _commentC.text;
                              if (a != null && c != '') {
                                Map<String, dynamic> data = {
                                  "Asunto": a,
                                  "Comentario": c
                                };
                                FirebaseFirestore.instance
                                    .collection("comentarios")
                                    .add(data);
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        "Su comentario ha sido enviado exitosamente!"),
                                    backgroundColor: Colors.green));
                                _commentC.text = '';
                                selectectedType = null;
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        "Error. Completa la información necesaria"),
                                    backgroundColor: Colors.red));
                              }
                            },
                            icon: Icon(Icons.send),
                            label: Text(
                              'Enviar',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        Text(''),
                        Image.asset('assets/images/Comment.png'),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Comment extends StatefulWidget {
  const Comment({Key? key}) : super(key: key);

  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  final TextEditingController _Textcontroller = TextEditingController();

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
                      'Enviar Comentarios',
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
                        Center(
                          child: TextFormField(
                            controller: _Textcontroller,
                            minLines: 1,
                            maxLines: 5,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              hintText: 'Ingresa tu comentario',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.deepOrangeAccent,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(255, 89, 0, 1),
                            ),
                            onPressed: () {},
                            icon: Icon(Icons.send),
                            label: Text(
                              'Enviar',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        Text('a '),
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

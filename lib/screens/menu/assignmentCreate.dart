import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class AssignmentCreate extends StatefulWidget {
  AssignmentCreate({Key? key}) : super(key: key);

  @override
  _AssignmentCreateState createState() => _AssignmentCreateState();
}

class _AssignmentCreateState extends State<AssignmentCreate> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailController = TextEditingController();
  final TextEditingController deadlineController = TextEditingController();
  var db = FirebaseFirestore.instance;

  _AssignmentCreateState() {
    _setDefaultDeadline();
  }

  void _setDefaultDeadline() {
    DateTime today = DateTime.now();
    deadlineController.text = DateFormat('dd-MM-yyyy').format(today);
  }

  Widget build(BuildContext context) {
    DateTime _dateTime = DateTime.now();

    void _showDatePicker() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme:
                  ColorScheme.light(primary: Color.fromARGB(255, 138, 94, 209)),
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!,
          );
        },
      ).then((value) {
        if (value != null) {
          setState(() {
            _dateTime = value;
            deadlineController.text =
                DateFormat('dd-MM-yyyy').format(_dateTime);
          });
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 138, 94, 209),
        title: const Text('Assignment'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height - 56,
            color: Color.fromARGB(255, 138, 94, 209),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height - 56,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              child: Container(
                margin: EdgeInsets.all(40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Title :",
                      style: TextStyle(
                        color: Color.fromARGB(255, 138, 94, 209),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: titleController,
                      maxLength: 21,
                      decoration: InputDecoration(
                        hintText: 'Enter notes title',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 193, 175, 219),
                          ),
                        ),
                      ),
                      cursorColor: Color.fromARGB(255, 138, 94, 209),
                      style: TextStyle(
                        color: Color.fromARGB(255, 138, 94, 209),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Deadline :",
                          style: TextStyle(
                            color: Color.fromARGB(255, 138, 94, 209),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: TextField(
                              controller: deadlineController,
                              readOnly: true,
                              enabled: false,
                              decoration: InputDecoration(
                                hintText: 'Select deadline date',
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 193, 175, 219),
                                  ),
                                ),
                              ),
                              cursorColor: Color.fromARGB(255, 138, 94, 209),
                              style: TextStyle(
                                color: Color.fromARGB(255, 138, 94, 209),
                              ),
                            )),
                            SizedBox(width: 10),
                            IconButton(
                              icon: Icon(Icons.calendar_today),
                              color: Color.fromARGB(255, 138, 94, 209),
                              onPressed: () {
                                _showDatePicker();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Detail :",
                      style: TextStyle(
                        color: Color.fromARGB(255, 138, 94, 209),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: detailController,
                      decoration: InputDecoration(
                        hintText: 'Enter notes detail',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 193, 175, 219),
                          ),
                        ),
                      ),
                      minLines: 1,
                      maxLines: 5,
                      cursorColor: Color.fromARGB(255, 138, 94, 209),
                      style: TextStyle(
                        color: Color.fromARGB(255, 138, 94, 209),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              height: 56,
              child: ElevatedButton(
                onPressed: () async {
                  var error = false;
                  var listerror = "list Error :";
                  bool containsSingleQuote() {
                    return [
                      titleController.text,
                      detailController.text,
                    ].any((field) => field.contains("'"));
                  }

                  bool anyFieldIsEmpty() {
                    return [
                      titleController.text,
                      detailController.text,
                    ].any((field) => field.isEmpty);
                  }

                  if (containsSingleQuote()) {
                    error = true;
                    listerror =
                        listerror + "\n There's a quote(') in your input";
                  }
                  if (anyFieldIsEmpty()) {
                    error = true;
                    listerror = listerror + "\n All form needs to be filled";
                  }
                  if (error == false) {
                    final user = <String, dynamic>{
                      "title": titleController.text.toString(),
                      "detail": detailController.text.toString(),
                      "deadline": deadlineController.text.toString(),
                    };
                    db.collection("assignment").add(user).then(
                        (DocumentReference doc) =>
                            print('DocumentSnapshot added with ID: ${doc.id}'));
                    Navigator.pop(context);
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Input Error'),
                          content: Text(listerror),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 138, 94, 209),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                  ),
                ),
                child: Text('Add Data'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

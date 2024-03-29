import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_flutter/screens/menu/notesCreate.dart';
import 'package:project_flutter/screens/menu/notesDetail.dart';
import 'package:intl/intl.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  void initState() {
    super.initState();
  }

  var db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 138, 94, 209),
        title: const Text('Notes'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotesCreate(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          color: Color.fromARGB(255, 138, 94, 209),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
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
                    child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      stream:
                          db.collection('notes').orderBy('date').snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.hasError) {
                          return const Center(
                            child: Text("Error"),
                          );
                        }
                        var data = snapshot.data!.docs;

                        data.sort((a, b) {
                          DateTime dateA;
                          DateTime dateB;

                          try {
                            dateA = DateFormat('dd-MM-yyyy').parse(a['date']);
                          } catch (e) {
                            dateA = DateTime(1900, 1, 1);
                          }

                          try {
                            dateB = DateFormat('dd-MM-yyyy').parse(b['date']);
                          } catch (e) {
                            dateB = DateTime(1900, 1, 1);
                          }

                          var dateComparison = dateB.compareTo(dateA);
                          if (dateComparison != 0) {
                            return dateComparison;
                          }

                          return a['title']
                              .toLowerCase()
                              .compareTo(b['title'].toLowerCase());
                        });
                        return Container(
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              final item = data[index];
                              return Card(
                                margin: EdgeInsets.symmetric(vertical: 8.0),
                                child: ListTile(
                                  title: Text(
                                    item['title'],
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 138, 94, 209),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  trailing: Text(
                                    item['date'],
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 193, 175, 219),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NotesDetail(
                                          documentId: item.id,
                                          notes: item.data(),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

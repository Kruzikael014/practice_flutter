import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pract/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
            primary: Colors.blue, secondary: Colors.cyan),
      ),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  final String title = 'Sebuah String';

  @override
  State<StatefulWidget> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  String? studentName, studentID, programID;
  double? gpa;

  final TextEditingController studentNameController = TextEditingController();
  final TextEditingController studentIDController = TextEditingController();
  final TextEditingController programIDController = TextEditingController();
  final TextEditingController gpaController = TextEditingController();

  setStudentName(String studentName) {
    this.studentName = studentName;
  }

  setStudentID(String studentID) {
    this.studentID = studentID;
  }

  setProgramID(String programID) {
    this.programID = programID;
  }

  setGPA(String gpa) {
    this.gpa = double.parse(gpa);
  }

  check() {
    log('data\n======================');
    log('StudentName : $studentName');
    log('StudentID   : $studentID');
    log('ProgramID   : $programID');
    log('StudentGPA  : $gpa');
    log('Testing success');
    clear();
  }

  clear() {
    studentNameController.clear();
    studentIDController.clear();
    programIDController.clear();
    gpaController.clear();
  }

  reset() {
    studentID = null;
    studentName = null;
    programID = null;
    gpa = null;
  }

  createData() {
    check();
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('student_scores').doc();

    Map<String, dynamic> student = {
      "studentID": studentID,
      "studentName": studentName,
      "programID": programID,
      "gpa": gpa
    };

    documentReference.set(student).whenComplete(() {
      log('data created');
      reset();
    }).onError((error, stackTrace) {
      log('$error occured during insertion!\nHere is the stack trace\n$stackTrace');
    });
  }

  updateData() async {
    check();

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('student_scores')
        .where('studentID', isEqualTo: '$studentID')
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      DocumentReference documentReference = querySnapshot.docs[0].reference;
      Map<String, dynamic> student = {
        "studentID": studentID,
        "studentName": studentName,
        "programID": programID,
        "gpa": gpa
      };
      documentReference.update(student).whenComplete(() {
        log('data updated');
        reset();
      }).onError((error, stackTrace) {
        log('$error occured during insertion!\nHere is the stack trace\n$stackTrace');
      });
    }
  }

  deleteData() async {
    check();

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('student_scores')
        .where('studentID', isEqualTo: '$studentID')
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      DocumentReference documentReference = querySnapshot.docs[0].reference;

      documentReference.delete().whenComplete(() {
        log('data deleted');
        reset();
      }).onError((error, stackTrace) {
        log('$error occured during insertion!\nHere is the stack trace\n$stackTrace');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter College App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: studentNameController,
                decoration: const InputDecoration(
                    labelText: 'Name',
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String name) => setStudentName(name),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: studentIDController,
                decoration: const InputDecoration(
                    labelText: 'Student ID',
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String studentID) => setStudentID(studentID),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: programIDController,
                decoration: const InputDecoration(
                    labelText: 'Study Program ID',
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String programID) => setProgramID(programID),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: gpaController,
                decoration: const InputDecoration(
                    labelText: 'GPA',
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String gpa) => setGPA(gpa),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                  child: const Text('Create'),
                  onPressed: () => createData(),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[500],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                  child: const Text('Update'),
                  onPressed: () => updateData(),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                  child: const Text('Delete'),
                  onPressed: () => deleteData(),
                ),
              ],
            ),
            const StudentInformation()
          ],
        ),
      ),
    );
  }
}

class StudentInformation extends StatefulWidget {
  const StudentInformation({super.key});

  @override
  State<StatefulWidget> createState() => _StudentInformationState();
}

class _StudentInformationState extends State<StudentInformation> {
  final CollectionReference _studentCollection =
      FirebaseFirestore.instance.collection('student_scores');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _studentCollection.orderBy('studentName').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;

        if (documents.isEmpty) {
          return const Text("No data available");
        }

        return Expanded(
            child: ListView(
          children: documents.map((document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return ListTile(
              title: Text('Name: ${data['studentName']}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('GPA: ${data['gpa']}'),
                  Text('Program ID: ${data['programID']}'),
                  Text('Student ID: ${data['studentID']}'),
                ],
              ),
            );
          }).toList(),
        ));
      },
    );
  }
}

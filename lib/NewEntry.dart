import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import './NavBar.dart';
import 'package:intl/intl.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
//import 'package:dropdown_search/dropdown_search.dart';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Entry extends StatefulWidget {
  const Entry({Key? key}) : super(key: key);

  @override
  State<Entry> createState() => _EntryState();
}

class Employee_details {
  late int id;
  late String name;
  late String designation;
  late String project;
  late String initiative;
  late String engagement_manager;
  late String start_date;
  late String end_date;

  Employee_details({
    required this.id,
    required this.name,
    required this.designation,
    required this.project,
    required this.initiative,
    required this.engagement_manager,
    required this.start_date,
    required this.end_date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'designation': designation,
      'project': project,
      'initiative': initiative,
      'engagement_manager': engagement_manager,
      'start_date': start_date,
      'end_date': end_date,
    };
  }
}

class _EntryState extends State<Entry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 48, 135),
        centerTitle: true,
        title: Text('EMPLOYEE DETAILS'),
      ),
      body: EntryForm(),
      drawer: NavBar(),
    );
  }
}

class EntryForm extends StatefulWidget {
  const EntryForm({Key? key}) : super(key: key);

  @override
  State<EntryForm> createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  void put_into_db(
    String jobRoleCtrl_a,
    String projectnmae_a,
    String initiativename_a,
    String jobRoleCtr_a,
    String startdate_a,
    String enddate_a,
  ) async {
    var fido = Employee_details(
      id: 0,
      name: '',
      designation: '',
      project: '',
      initiative: '',
      engagement_manager: '',
      start_date: '',
      end_date: '',
    );
  }

  void update() async {
    final todo = ParseObject('KPMG')
      ..set('designation', jobRoleCtrl.text)
      ..set('projectname', projectnmae.text)
      ..set('initiativename', initiativename.text)
      ..set('engagementmanager', jobRoleCtr.text)
      ..set('startdate', startdate.text)
      ..set('enddate', enddate.text);
    await todo.save();
  }

  final jobRoleCtrl = TextEditingController();
  final jobRoleCtr = TextEditingController();
  bool isChecked = false;
  bool Checked = true;

  final designation = TextEditingController();
  final projectnmae = TextEditingController();
  final initiativename = TextEditingController();
  final engagementmanager = TextEditingController();
  final startdate = TextEditingController();
  final enddate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 255, 255, 255),
      padding: EdgeInsets.fromLTRB(18, 10, 18, 0),
      child: ListView(
        children: [
          //Text(""),

          Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 5, 0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                      text: TextSpan(
                          text: 'Enter your designation:',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 82, 98, 127)),
                          children: [
                        //TextSpan(text: '*', style: TextStyle(color: Colors.red))
                      ])))),

          Container(
            padding: EdgeInsets.fromLTRB(5, 4, 5, 5),
            child: CustomDropdown(
              fillColor: Color.fromARGB(255, 240, 240, 240),
              borderSide: BorderSide(color: Color.fromARGB(255, 240, 240, 240)),
              borderRadius: BorderRadius.circular(6),
              hintText: 'Select designation',
              hintStyle: TextStyle(
                  fontSize: 16, color: Color.fromARGB(255, 101, 101, 101)),
              items: const [
                'Analyst',
                'Associate Consultant',
                'Consultant',
                'Assistant Manager'
              ],
              controller: jobRoleCtrl,
            ),
          ),

          Padding(
              padding: EdgeInsets.fromLTRB(10, 15, 5, 0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                      text: TextSpan(
                          text: 'Project:',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 82, 98, 127)),
                          children: [
                        //TextSpan(text: '*', style: TextStyle(color: Colors.red))
                      ])))),

          Container(
            padding: EdgeInsets.fromLTRB(5, 4, 5, 5),
            child: TextFormField(
                controller: projectnmae,
                decoration: InputDecoration(
                  alignLabelWithHint: true,

                  hintText: "Project Name",
                  filled: true, //<-- SEE HERE
                  fillColor: Color.fromARGB(255, 240, 240, 240),

                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 240, 240, 240)),
                      borderRadius: BorderRadius.circular(6)),
                )),
          ),

          Padding(
              padding: EdgeInsets.fromLTRB(10, 15, 5, 0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                      text: TextSpan(
                          text: 'Any Initiative:',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 82, 98, 127)),
                          children: [
                        //TextSpan(text: '*', style: TextStyle(color: Colors.red))
                      ])))),

          Container(
            padding: EdgeInsets.fromLTRB(5, 4, 5, 5),
            child: TextFormField(
                controller: initiativename,
                decoration: InputDecoration(
                  alignLabelWithHint: true,

                  hintText: "Initiative Name",
                  filled: true, //<-- SEE HERE
                  fillColor: Color.fromARGB(255, 240, 240, 240),

                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 240, 240, 240)),
                      borderRadius: BorderRadius.circular(6)),
                )),
          ),

          Padding(
              padding: EdgeInsets.fromLTRB(10, 15, 5, 0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                      text: TextSpan(
                          text: 'Who is your Engagement Manager:',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 82, 98, 127)),
                          children: [
                        //TextSpan(text: '*', style: TextStyle(color: Colors.red))
                      ])))),

          Container(
            padding: EdgeInsets.fromLTRB(5, 4, 5, 5),
            child: CustomDropdown(
              fillColor: Color.fromARGB(255, 240, 240, 240),
              borderSide: BorderSide(color: Color.fromARGB(255, 240, 240, 240)),
              borderRadius: BorderRadius.circular(6),
              hintText: 'Select Engagement Manager',
              hintStyle: TextStyle(
                  fontSize: 16, color: Color.fromARGB(255, 101, 101, 101)),
              items: const [
                "Subuhee Parray",
                "Nishanth Mallinath",
                "Arjun Malhotra",
                "Sumit Kapoor",
                "Sandeep Gill",
                "Chaitanya Karmakar",
                "Shivam Awasthi",
                "Ramesh Kadamata",
                "Rekha Madandas Vaishnav",
                "Avinash CH",
                "Yatin Gaind",
                "Ashish Agnihotri",
                "Kunal Roy",
                "Seema Singh",
                "Sonal Jain",
                "Samarth Arora",
                "Ritu Birla",
                "Ujjwal Agarwal",
                "Ankit Jain",
                "Bhanu Pratap",
                "Vinay Sharma",
                "Mahendra Pandey",
                "Arjun Iyer",
                "Yasharth Srivastava"
              ],
              controller: jobRoleCtr,
            ),
          ),

          Padding(
              padding: EdgeInsets.fromLTRB(10, 15, 5, 0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                      text: TextSpan(
                          text: 'Start & End Date of Project:',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 82, 98, 127)),
                          children: [
                        //TextSpan(text: '*', style: TextStyle(color: Colors.red))
                      ])))),

          Container(
            child: Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  //fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                      Checked = isChecked ? Checked = false : Checked = true;
                    });
                  },
                ),
                Text('I am currently working on this Project'),
              ],
            ),
          ),

          Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 5, 0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                      text: TextSpan(
                          text: 'Start Date:',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 82, 98, 127)),
                          children: [
                        //TextSpan(text: '*', style: TextStyle(color: Colors.red))
                      ])))),
          SizedBox(),

          Container(
            padding: EdgeInsets.fromLTRB(5, 4, 5, 5),
            child: TextFormField(
              controller: startdate,
              onTap: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(2010, 3, 5),
                    maxTime: DateTime(2030, 6, 7), onChanged: (date) {
                  print('change $date');
                }, onConfirm: (date) {
                  if (date != null) {
                    setState(() {
                      startdate.text = DateFormat('dd-MM-yyyy').format(date);
                    });
                  }
                  print('confirm $date');
                }, currentTime: DateTime.now(), locale: LocaleType.en);
                //if (date != null)
              },
              readOnly: true,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                suffixIcon: Icon(Icons.calendar_month),

                hintText: "Start Date",
                filled: true, //<-- SEE HERE
                fillColor: Color.fromARGB(255, 240, 240, 240),

                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 240, 240, 240)),
                    borderRadius: BorderRadius.circular(6)),
              ),
            ),
          ),

          Visibility(
            visible: Checked,
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 5, 0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: RichText(
                            text: TextSpan(
                                text: 'End Date:',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 82, 98, 127)),
                                children: [
                              //TextSpan(text: '*', style: TextStyle(color: Colors.red))
                            ])))),
                Container(
                  padding: EdgeInsets.fromLTRB(5, 4, 5, 5),
                  child: TextFormField(
                    controller: enddate,
                    enabled: Checked,
                    onTap: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2010, 3, 5),
                          maxTime: DateTime(2030, 6, 7), onChanged: (date) {
                        print('change $date');
                      }, onConfirm: (date) {
                        if (date != null) {
                          setState(() {
                            if (Checked) {
                              //   enddate.text = "Present";
                              // } else {
                              enddate.text =
                                  DateFormat('dd-MM-yyyy').format(date);
                            }
                          });
                        }
                        print('confirm $date');
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    readOnly: true,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      suffixIcon: Icon(Icons.calendar_month),

                      hintText: "End Date",
                      filled: true, //<-- SEE HERE
                      fillColor: Color.fromARGB(255, 240, 240, 240),

                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 240, 240, 240)),
                          borderRadius: BorderRadius.circular(6)),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Container(
          //   height: 48,
          //   margin: EdgeInsets.fromLTRB(5, 15, 5, 5),
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //         shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(6)),
          //         primary: Color.fromARGB(255, 240, 240, 240),
          //         minimumSize: Size.fromHeight(40)),
          //     child: const Text(
          //       'Choose Date',
          //       style: TextStyle(
          //           fontSize: 20,
          //           fontWeight: FontWeight.normal,
          //           color: Color.fromARGB(255, 129, 129, 129)),
          //     ),
          //     onPressed: () {
          //       DatePicker.showDatePicker(context,
          //           showTitleActions: true,
          //           minTime: DateTime(2010, 3, 5),
          //           maxTime: DateTime(2030, 6, 7), onChanged: (date) {
          //         print('change $date');
          //       }, onConfirm: (date) {
          //         print('confirm $date');
          //       }, currentTime: DateTime.now(), locale: LocaleType.en);
          //     },
          //   ),
          // ),

          Container(
              margin: EdgeInsets.fromLTRB(5, 15, 5, 5),
              height: 50,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      primary: Color.fromARGB(255, 0, 48, 135),
                      minimumSize: Size.fromHeight(40)),
                  child: const Text(
                    'SUBMIT',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    update();
                    put_into_db(
                        jobRoleCtrl.text,
                        projectnmae.text,
                        initiativename.text,
                        jobRoleCtr.text,
                        startdate.text,
                        enddate.text);
                    showSuccess(
                        "Your response has been submitted successfully");
                  })),
        ],
      ),
    );
  }

  void showSuccess(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: Text(message),
          actions: <Widget>[
            new TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}



/*
Container(
            padding: EdgeInsets.fromLTRB(5, 4, 5, 5),
            child: Checked
                ? TextFormField(
                    controller: enddate,
                    enabled: Checked,
                    onTap: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2010, 3, 5),
                          maxTime: DateTime(2030, 6, 7), onChanged: (date) {
                        print('change $date');
                      }, onConfirm: (date) {
                        if (date != null) {
                          setState(() {
                            enddate.text =
                                DateFormat('dd-MM-yyyy').format(date);
                          });
                        }
                        print('confirm $date');
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    readOnly: true,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      suffixIcon: Icon(Icons.calendar_month),

                      hintText: "End Date",
                      filled: true, //<-- SEE HERE
                      fillColor: Color.fromARGB(255, 240, 240, 240),

                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 240, 240, 240)),
                          borderRadius: BorderRadius.circular(6)),
                    ),
                  )
                : TextFormField(
                    enabled: Checked,
                    onTap: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2010, 3, 5),
                          maxTime: DateTime(2030, 6, 7), onChanged: (date) {
                        print('change $date');
                      }, onConfirm: (date) {
                        if (date != null) {
                          setState(() {
                            startdate.text =
                                DateFormat('dd-MM-yyyy').format(date);
                          });
                        }
                        print('confirm $date');
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    readOnly: true,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      suffixIcon: Icon(Icons.calendar_month),

                      hintText: "Present",
                      filled: true, //<-- SEE HERE
                      fillColor: Color.fromARGB(255, 240, 240, 240),

                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 240, 240, 240)),
                          borderRadius: BorderRadius.circular(6)),
                    ),
                  ),
          ),
*/
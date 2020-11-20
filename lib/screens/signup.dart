import 'package:blood_app/shared_ui/sharedui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Container(
          width: width,
          height: height,
          margin: EdgeInsets.symmetric(horizontal: width * 0.1),
          child: MyThirdForm(width, height * 0.8),
        ));
  }

  Form buildForm1() {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: height * 0.1,
          ),
          SharedUI.input('Full name'),
          SharedUI.input('Email Address'),
          SharedUI.input('Password'),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    height: width * 0.1,
                    width: width * 0.1,
                    decoration: BoxDecoration(
                        color: Color(0xff26FB81),
                        borderRadius: BorderRadius.circular(12)),
                    child: Icon(
                      Icons.check,
                      size: width * 0.07,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Text(
                    'at least 8 characters',
                    style: TextStyle(
                        color: Color(0xff26FB81),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  Container(
                    height: width * 0.1,
                    width: width * 0.1,
                    decoration: BoxDecoration(
                        color: Color(0xff8FA0B3),
                        borderRadius: BorderRadius.circular(12)),
                    child: Icon(
                      Icons.check,
                      size: width * 0.07,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Text(
                    'have a capital letter',
                    style: TextStyle(
                        color: Color(0xff8FA0B3),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  )
                ],
              ),
            ],
          ),
          SharedUI.drawButton(width, height * 0.9, 'Next')
        ],
      ),
    );
  }
}

class MySecondForm extends StatefulWidget {
  @override
  _MySecondFormState createState() => _MySecondFormState();
}

class _MySecondFormState extends State<MySecondForm> {
  final DateFormat formatter = DateFormat('yyyy\\MM\\dd');
  DateTime _dateTime;

  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width * 0.85,
                  height: height * 0.1,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.5, color: Color(0xffCBD5E0)),
                        borderRadius: BorderRadius.circular(40)),
                    child: Text(
                      _dateTime == null
                          ? 'Pick your birth date'
                          : formatter.format(_dateTime),
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          color: SharedUI.red,
                          fontSize: 22),
                    ),
                    color: SharedUI.white,
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate:
                            _dateTime == null ? DateTime.now() : _dateTime,
                        firstDate: DateTime(1920),
                        lastDate: DateTime(2020, 12, 31),
                        initialDatePickerMode: DatePickerMode.year,
                        builder: (BuildContext context, Widget child) {
                          return Theme(
                            data: ThemeData.light().copyWith(
                              primaryColor: SharedUI.red,
                              accentColor: SharedUI.red,
                              colorScheme:
                                  ColorScheme.light(primary: SharedUI.red),
                              buttonTheme: ButtonThemeData(
                                  textTheme: ButtonTextTheme.primary),
                            ),
                            child: child,
                          );
                        },
                      ).then((date) {
                        setState(() {
                          _dateTime = date;
                        });
                      });
                    },
                  ),
                ),
                SharedUI.input('Phone number'),
                SharedUI.drawButton(width, height * 0.9, 'Next')
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyThirdForm extends StatefulWidget {
  MyThirdForm(this.width, this.height);
  double width;
  double height;
  @override
  _MyThirdFormState createState() => _MyThirdFormState();
}

class _MyThirdFormState extends State<MyThirdForm> {
  String dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              SizedBox(
                height: widget.height * 0.2,
              ),
              DropdownButton<String>(
                itemHeight: widget.height * 0.15,
                isExpanded: true,
                hint: Text(
                  "Blood Type",
                  style:
                      SharedUI.textStyle(SharedUI.gray).copyWith(fontSize: 22),
                ),
                value: dropdownValue,
                icon: Icon(
                  Icons.expand_more,
                  color: SharedUI.red,
                ),
                iconSize: 24,
                elevation: 16,
                style: SharedUI.textStyle(Colors.black).copyWith(fontSize: 20),
                underline: Container(
                  height: 2,
                  color: SharedUI.red,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>[
                  'One',
                  'Two',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              DropdownButton<String>(
                itemHeight: widget.height * 0.15,
                isExpanded: true,
                hint: Text(
                  "State",
                  style:
                      SharedUI.textStyle(SharedUI.gray).copyWith(fontSize: 22),
                ),
                value: dropdownValue,
                icon: Icon(
                  Icons.expand_more,
                  color: SharedUI.red,
                ),
                iconSize: 24,
                elevation: 16,
                style: SharedUI.textStyle(Colors.black).copyWith(fontSize: 20),
                underline: Container(
                  height: 2,
                  color: SharedUI.red,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>[
                  'One',
                  'Two',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              DropdownButton<String>(
                itemHeight: widget.height * 0.15,
                isExpanded: true,
                hint: Text(
                  "Municipal",
                  style:
                      SharedUI.textStyle(SharedUI.gray).copyWith(fontSize: 22),
                ),
                value: dropdownValue,
                icon: Icon(
                  Icons.expand_more,
                  color: SharedUI.red,
                ),
                iconSize: 24,
                elevation: 16,
                style: SharedUI.textStyle(Colors.black).copyWith(fontSize: 20),
                underline: Container(
                  height: 2,
                  color: SharedUI.red,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>[
                  'One',
                  'Two',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(
                height: widget.height * 0.05,
              ),
            ],
          ),
        ),
        Expanded(
            child: Column(
          children: [
            SharedUI.drawButton(widget.width, widget.height, 'Next'),
          ],
        ))
      ],
    );
  }
}

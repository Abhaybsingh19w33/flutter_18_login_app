import 'package:flutter/material.dart';

class CustomLoginForm extends StatefulWidget {
  // returning the state of type _CustomLoginForm
  @override
  _CustomLoginForm createState() => _CustomLoginForm();
}

// Data Class
class _LoginData {
  String name = "";
  String password = "";
}

class _CustomLoginForm extends State<CustomLoginForm> {
  // this formstate has all the info about the form
  final _formKey = GlobalKey<FormState>();

  _LoginData _data = new _LoginData();
  @override
  Widget build(BuildContext context) {
    // return Form
    // form allow us to create a form
    // it is usefull for validating the data
    return Form(
      // in order to understood this form in this class
      key: _formKey,
      // creating the column to store the widgets vertically
      child: Column(
        // to make aevery thing aligned
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            // adding images
            child: Image.asset(
              // specifying the path of the image
              "images/face.png",
              // width height and color
              width: 90,
              height: 90,
              color: Colors.white,
            ),
          ),
          // adding padding to out textfield for name
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              // decorating the textfield
              decoration: InputDecoration(
                  // adding label
                  labelText: "Name",
                  // padding and border radius
                  border: OutlineInputBorder(
                      gapPadding: 3.3,
                      borderRadius: BorderRadius.circular(3.3))),
              // ignore: missing_return
              // checking if name field is empty or not
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter name";
                } else {
                  // print("All is Good");
                  // to access the value of name
                  // to use some where else in the app
                  _data.name = value;
                  // print("Data: ${_data.name}");
                }
                return "";
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              // this will hide the password with symbols
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                      gapPadding: 3.3,
                      borderRadius: BorderRadius.circular(3.3))),
              // ignore: missing_return
              // checking if password field is empty or not
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter password";
                } else {
                  // print("All is Good");
                  // to access the value of password
                  // to use some where else in the app
                  _data.password = value;
                  // print("Data: ${_data.password}");
                }
                return "";
              },
            ),
          ),
          Container(
            // adding widgets horizontally
            child: Row(
              // spaceevenly will make the distance between the widget even
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // adding padding to buttons
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    // function of the button
                    onPressed: () {
                      // it will check the validation
                      // and if it returns true this will print all is good
                      if (_formKey.currentState.validate()) {
                        // it refresh the data evrytime the state change
                        setState(() {
                          _data.name = _data.name;
                        });
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("All is good")));
                      }
                    },
                    // text will appear on the button
                    child: Text('Submit'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      // it will check the validation
                      if (_formKey.currentState.validate()) {
                        // _formkey holds all the data and the state
                        // here this will clear all the fields
                        _formKey.currentState.reset();
                        // it refresh the data evrytime the state change
                        setState(() {
                          _data.name = "";
                        });
                      }
                    },
                    child: Text('Clear'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              // printing welcome message if the login is success
              child: (_data.name.isEmpty || _data.password.isEmpty)
                  ? Text("")
                  : Text("Welcome ${_data.name}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 19.0)),
            ),
          )
        ],
      ),
    );
  }
}

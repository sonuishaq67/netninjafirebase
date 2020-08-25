import 'package:brewcrew/models/usernew.dart';
import 'package:brewcrew/services/database.dart';
import 'package:brewcrew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  String _currName;
  String _currSugars;
  int _currStren;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserNew>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          //
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: InputDecoration(
                      hintText: 'email',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.pink, width: 2.0)),
                    ),
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => _currName = val),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //dropdown
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      hintText: 'email',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.pink, width: 2.0)),
                    ),
                    value: _currSugars ?? userData.sugars,
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                          value: sugar, child: Text('sugar $sugar'));
                    }).toList(),
                    onChanged: (val) => setState(() => _currSugars = val),
                  ),
                  Slider(
                      min: 100,
                      max: 900,
                      activeColor:
                          Colors.brown[_currStren ?? userData.strength],
                      inactiveColor:
                          Colors.brown[_currStren ?? userData.strength],
                      divisions: 8,
                      value: (_currStren ?? userData.strength).toDouble(),
                      onChanged: (val) => setState(() {
                            _currStren = val.round();
                          })),
                  RaisedButton(
                    color: Colors.pink,
                    child: Text(
                      'update',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      print(_currName);
                      print(_currSugars);
                      print(_currStren);
                    },
                  ),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}

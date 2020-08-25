import 'package:flutter/material.dart';

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
            decoration: InputDecoration(
              hintText: 'email',
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink, width: 2.0)),
            ),
            validator: (val) => val.isEmpty ? 'Please enter a name' : null,
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
                  borderSide: BorderSide(color: Colors.pink, width: 2.0)),
            ),
            value: _currSugars ?? '0',
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                  value: sugar, child: Text('sugar $sugar'));
            }).toList(),
            onChanged: (val) => setState(() => _currSugars = val),
          ),
          Slider(
              min: 100,
              max: 900,
              activeColor: Colors.brown[_currStren ?? 100],
              inactiveColor: Colors.brown[_currStren ?? 100],
              divisions: 8,
              value: (_currStren ?? 100).toDouble(),
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
  }
}

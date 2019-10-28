import 'package:flutter/material.dart';

class HomeMaterial extends StatefulWidget {
  @override
  _HomeMaterialState createState() => _HomeMaterialState();
}

class _HomeMaterialState extends State<HomeMaterial> {
  final _formKey = GlobalKey<FormState>();
  final _user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Builder(
                  builder: (context) => Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'First name',
                                  border: OutlineInputBorder()),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your first name';
                                }
                              },
                              onSaved: (val) =>
                                  setState(() => _user.firstName = val),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'Last name',
                                    border: OutlineInputBorder()),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your last name.';
                                  }
                                },
                                onSaved: (val) =>
                                    setState(() => _user.lastName = val)),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                              child: Text('Subscribe'),
                            ),
                            SwitchListTile(
                                title: const Text('Monthly Newsletter'),
                                value: _user.newsletter,
                                onChanged: (bool val) =>
                                    setState(() => _user.newsletter = val)),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                              child: Text('Interests'),
                            ),
                            CheckboxListTile(
                                title: const Text('Cooking'),
                                value: _user.passions[User.PassionCooking],
                                onChanged: (val) {
                                  setState(() => _user
                                      .passions[User.PassionCooking] = val);
                                }),
                            CheckboxListTile(
                                title: const Text('Traveling'),
                                value: _user.passions[User.PassionTraveling],
                                onChanged: (val) {
                                  setState(() => _user
                                      .passions[User.PassionTraveling] = val);
                                }),
                            CheckboxListTile(
                                title: const Text('Hiking'),
                                value: _user.passions[User.PassionHiking],
                                onChanged: (val) {
                                  setState(() =>
                                      _user.passions[User.PassionHiking] = val);
                                }),
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 16.0),
                                child: RaisedButton(
                                    onPressed: () {
                                      final form = _formKey.currentState;
                                      if (form.validate()) {
                                        form.save();
                                        _user.save();
                                        _showDialog(context);
                                        Navigator.pushNamed(context, "/design");
                                      }
                                    },
                                    child: Text('Save'))),
                          ])))),
        ));
  }

  _showDialog(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Submitting form')));
  }
}

class User {
  static const String PassionCooking = 'cooking';
  static const String PassionHiking = 'hiking';
  static const String PassionTraveling = 'traveling';

  String firstName = '';
  String lastName = '';
  Map passions = {
    PassionCooking: false,
    PassionHiking: false,
    PassionTraveling: false
  };
  bool newsletter = false;

  save() {
    print('saving user using a web service');
  }
}

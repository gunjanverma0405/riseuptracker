import 'package:flutter/material.dart';

class PersonalDetails extends StatefulWidget {
  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final TextEditingController _aadharNumberController = TextEditingController();
  final TextEditingController _familyMembersController =
      TextEditingController();

  String educationStatus = "";
  int familyMembers = 0;
  String aadharNumber = "";
  String bloodGroup = "";
  bool hasBankAccount = false;
  bool hasPanCard = false;
  String panCardNumber = "";
  bool hasRationCard = false;
  String employmentStatus = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Education Status'),
                items: <String>[
                  'Didn\'t go to school',
                  'Less than secondary school'
                      'Secondary school',
                  'Senior secondary or equivalent',
                  'Bachelor\'s Degree',
                  'Master\'s Degree',
                  'Professional Degree',
                  'Doctorate Degree',
                  'Other'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select your education status';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    educationStatus = value!;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _familyMembersController,
                decoration: InputDecoration(labelText: 'Family Members'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the number of family members';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _aadharNumberController,
                decoration: InputDecoration(labelText: 'Aadhar Number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Aadhar number';
                  }
                  if (value.length != 12) {
                    return 'Aadhar number should be 12 digits';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Blood Group'),
                items: <String>[
                  'A+',
                  'A-',
                  'B+',
                  'B-',
                  'AB+',
                  'AB-',
                  'O+',
                  'O-'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select your blood group';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    bloodGroup = value!;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Employment Status'),
                items: <String>[
                  'Employed',
                  'Unemployed',
                  'Self-employed',
                  'Student'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select your employment status';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    employmentStatus = value!;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Do you have Bank Account?'),
                value: hasBankAccount,
                onChanged: (value) {
                  setState(() {
                    hasBankAccount = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Do you have PAN Card?'),
                value: hasPanCard,
                onChanged: (value) {
                  setState(() {
                    hasPanCard = value;
                  });
                },
              ),
              if (hasPanCard == true)
                TextFormField(
                  decoration: InputDecoration(labelText: 'PAN Card Number'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your PAN card number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    panCardNumber = value!;
                  },
                ),
              SwitchListTile(
                title: Text('Do you have Ration Card?'),
                value: hasRationCard,
                onChanged: (value) {
                  setState(() {
                    hasRationCard = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

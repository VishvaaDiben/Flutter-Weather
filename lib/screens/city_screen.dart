import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  String cityName;
  String _selectedCity = 'Kuala Lumpur' ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  controller: TextEditingController(text:'$_selectedCity'),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value) {
                      cityName = value;
                  },
                ),

              ),

              Container(
                padding: EdgeInsets.all(20.0),

                  child: DropdownButton<String>(
                    items: [
                      DropdownMenuItem<String>(
                        child: Text('Kuala Lumpur'),
                        value: 'Kuala Lumpur',
                      ),
                      DropdownMenuItem<String>(
                        child: Text('George Town'),
                        value: 'George Town',
                      ),
                      DropdownMenuItem<String>(
                        child: Text('Johor Bharu'),
                        value: 'Johor',
                      ),
                    ],
                    onChanged: (String value) {
                      setState(() {
                        _selectedCity = value;
                        cityName = value;
                      });
                    },
                    hint: Text('Select City'),
                    value: _selectedCity,
                  )
              ),

              FlatButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

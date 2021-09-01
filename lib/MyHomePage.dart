import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}
String mobno = '';
class _MyHomePageState extends State<MyHomePage> {
  //functions to be created here.


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    // String _url = "https://api.whatsapp.com/send/?phone=91$mobno&text&app_absent=0";
    // String _url = "https://flutter.io";
    // void _launchURL() async =>
    //     await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  onChanged: (value){
                    setState(() {
                      mobno = value;
                      // print(mobno);
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    else if(value.length>10 || value.length<10)
                      return 'Mobile Number should be equal to 10';

                    return null;
                  },

                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    hintText: 'Enter the number here',
                    prefixIcon: Icon(Icons.person, color: Colors.black),
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                ),
                SizedBox(height: 20.0,),
                ElevatedButton.icon(
                  onPressed:(){
                    if(_formKey.currentState!.validate()){
                      print('Validated');
                      print(mobno);
                      // _launchURL();//dont uncomment
                      // launch('https://api.whatsapp.com/send/?phone=91$mobno&text&app_absent=0');
                    }

                  },
                  icon: Icon(
                    Icons.message,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  style: ElevatedButton.styleFrom(
                        primary: Colors.green, // background
                        onPrimary: Colors.white, // foreground
                      ),
                  label: Text('Message'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

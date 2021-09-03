import 'package:flutter/cupertino.dart';
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
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.8,
          backgroundColor: Color(0xfff1f6f7),
          title: Text(
            widget.title,
            style: TextStyle(
                color: Color(0xff263734),
              fontSize: 25.0,
            ),
          ),
        ),
        // backgroundColor: Color(0xffF1F6F7),
        backgroundColor: Color(0xffe0f2f1),
        body: Container(

          padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    cursorColor: Colors.white,
                    textAlign: TextAlign.left,
                    maxLength: 10,
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500,
                        // color: Colors.white,
                        color: Color(0xff263734),
                    ),
                    onChanged: (value){
                      setState(() {
                        mobno = value;
                        // print(mobno);
                      });
                    },
                    validator: (value) {
                      String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                      RegExp regExp = new RegExp(patttern);
                      if (value == null || value.isEmpty)
                        return 'Please enter some text';

                      else if (!regExp.hasMatch(value))
                        return 'Please enter valid mobile number';

                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xff91c5bc).withOpacity(0.6),
                      // disabledBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.red),
                      // ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff4db6ac), width: 3.0),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(25.0), bottomLeft: Radius.circular(25.0)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffef9a9a), width: 3.0),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(25.0), bottomLeft: Radius.circular(25.0)),
                      ),
                      hintText: 'Enter the number here',
                      hintStyle: TextStyle(fontSize: 20.0, color: Color(0xff263734).withOpacity(0.5)),
                      prefixIcon: Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                          child: Icon(Icons.person, color: Colors.black,)
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  ElevatedButton.icon(
                    onPressed:(){
                      FocusManager.instance.primaryFocus!.unfocus();
                      if(_formKey.currentState!.validate()){
                        print('Validated');
                        // print(mobno);
                        // _launchURL();//don't uncomment
                        launch('https://api.whatsapp.com/send/?phone=91$mobno&text&app_absent=0');
                      }

                    },
                    icon: Icon(
                      Icons.navigation,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    style: ElevatedButton.styleFrom(
                          primary: Color(0xff65A69B), // background
                          onPrimary: Colors.white, // foreground
                      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                        ),
                    label: Text('Message',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
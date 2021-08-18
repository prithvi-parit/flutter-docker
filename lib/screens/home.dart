import 'package:youapp1/constants/app_constants.dart';
import 'package:youapp1/widgets/left_bar.dart';
import 'package:youapp1/widgets/right_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  web() async{
     var r=Uri.http("13.233.10.255", "/cgi-bin/flutter1.py",{"x": cmd});
    var r1=await http.get(r);
    setState(() {
       _bmiResult=r1.body;
    });
    
    print(r1.body);
    print(cmd);
    
    print(_bmiResult);
  }
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
 late  String _bmiResult = "";
 late String _textResult = "";
 late String cmd = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "DOCKER APP",
            style:
                TextStyle(fontSize: 60,color: accentHexColor, fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: mainHexColor,
        body:SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 140,
                    child: TextField(
                      onChanged: (value){
                            cmd=value;
                      },
                      controller: _heightController,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Your Command here.... ",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8)),
                      ),
                    ),
                  ),
                  
                ],
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: web,//() {
                //   _h = web;
                 // double _w = double.parse(_weightController.text);
             //     setState(() {
              //      _textResult = "output" ;// _w / (_h * _h);
 //                   if(_bmiResult > 25){
   //                   _textResult = "You\'re over weight";
     //               } else if(_bmiResult >= 18.5 && _bmiResult <= 25){
      //                _textResult = "You have normal weight";
       //             }else{
        //              _textResult = "You\'re under weight";
        //            }
       //           });
          //      },
                child: Container(
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: accentHexColor),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                child: Text(
                  "$_bmiResult", //toStringAsFixed(2),
                  style: TextStyle(fontSize: 30, color: accentHexColor),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Visibility(
                visible: _textResult.isNotEmpty,
                  child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: accentHexColor),
                ),
              )),
              SizedBox(
                height: 10,
              ),
              LeftBar(
                barWidth: 40,
              ),
              SizedBox(
                height: 20,
              ),
              LeftBar(barWidth: 70),
              SizedBox(
                height: 20,
              ),
              LeftBar(
                barWidth: 40,
              ),
              SizedBox(
                height: 20,
              ),
              RightBar(barWidth: 70),
              SizedBox(
                height: 50,
              ),
              RightBar(barWidth: 70),
            ],
          ),
        ));
  }
}
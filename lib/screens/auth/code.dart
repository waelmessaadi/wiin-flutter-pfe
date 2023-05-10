import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/screens/auth/register_screen.dart';

class code extends StatefulWidget {
  @override
  _codeState createState() =>
      _codeState();
}

class _codeState extends State<code> {
  /* final _phoneController = TextEditingController();
  final _codeController = TextEditingController();
  late String _verificationId;

  Future<void> _sendVerificationCode() async {
    final phoneNumber = _phoneController.text;
    final response = await http.post(
      Uri.parse('https://your-api.com/send-code'),
      body: {'phone_number': phoneNumber},
    );
    if (response.statusCode == 200) {
      setState(() {
        _verificationId = response.body;
      });
      // Code sent successfully.
    } else {
      // Error sending code.
    }
  }

  Future<void> _verifyCode() async {
    final code = _codeController.text;
    final response = await http.post(
      Uri.parse('https://your-api.com/verify-code'),
      body: {
        'verification_id': _verificationId,
        'code': code,
      },
    );
    if (response.statusCode == 200) {
      // User verified successfully.
    } else {
      // Verification failed.
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blueAccent,
        body: Container(
        alignment: Alignment.bottomLeft,
        margin:EdgeInsets.only(top:20,left:15,right:15),
    height:750,
    width: double.infinity,
    decoration: BoxDecoration(color: Colors.white,
    borderRadius: BorderRadius.all( Radius.circular(40)),),
    child:SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24,horizontal: 32),
          child: Column(
            children: [
              Image.asset('assets/images/logo.png'),

              SizedBox(height: 18,),
              Text("Verification",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text("Enter your code number ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black38),textAlign: TextAlign.center,),

              SizedBox(height: 38,),
              Container(padding: EdgeInsets.all(28),
                decoration: BoxDecoration(color:Colors.white,
                  borderRadius:BorderRadius.circular(12),

                ),
                child: Column(children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    _textFieldOPT(first: true,last:false ),
                    _textFieldOPT(first: false,last:false ),
                    _textFieldOPT(first: false,last:false ),
                    _textFieldOPT(first: false,last:true ),
                  ],
                  ),


                  SizedBox(height: 22,),
                ],),
              ),
              SizedBox(width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    },
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      shape:MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)))
                  ),
                  child: Padding(padding: EdgeInsets.all(14),
                      child: GestureDetector( child:
                    Text ("Verify ",style:TextStyle(fontSize: 16)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      },
                    )
                    ,

                  ),
                ),
              ),
              SizedBox(height: 18,),
              Text("Didn't you receive any code?",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.blue)),
              SizedBox(height: 18,),
              Text("Resend New Code",style:TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black38))
            ],
          ),
        ),
      ),),);
  }
  _textFieldOPT({required bool first,required bool last}){
    return Container(
      height: 85,
      child: AspectRatio(aspectRatio: 0.7,
      child: TextField(autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.length == 0 && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        showCursor: false,
        readOnly: false,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counter: Offstage(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2,color: Colors.black12),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder:OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.blue),
          borderRadius: BorderRadius.circular(12),
          )
        ),
      ),
      ),
    );
  }
}

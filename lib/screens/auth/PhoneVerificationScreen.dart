import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/screens/auth/code.dart';
import 'package:untitled/screens/auth/register_screen.dart';

class PhoneVerificationScreen extends StatefulWidget {
  @override
  _PhoneVerificationScreenState createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
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
            Text("Registration",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
           SizedBox(height: 10,),
            Text("Add your phone number,we'll send you a verification code ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black38),textAlign: TextAlign.center,),

            SizedBox(height: 38,),
Container(padding: EdgeInsets.fromLTRB(5, 28, 5, 28),
decoration: BoxDecoration(color:Colors.white,
    borderRadius:BorderRadius.circular(12),

),
  child: Column(children: [
    TextFormField(
      keyboardType: TextInputType.number,
      style: TextStyle(fontSize: 18,
      fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(borderSide:BorderSide(color: Colors.black12),
          borderRadius: BorderRadius.circular(10)
        ),
        focusedBorder: OutlineInputBorder(borderSide:BorderSide(color: Colors.black12),
            borderRadius: BorderRadius.circular(10)
        ),
        prefix: Padding(padding: EdgeInsets.symmetric(horizontal: 8),
        child: Text('(+216)',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        ),
        suffixIcon: Icon(Icons.check_circle,color: Colors.green,size: 32,)
      ),
    ),
    SizedBox(height: 22,),
  ],),
),
SizedBox(width: double.infinity,
child: ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>code()),);},
style: ButtonStyle(
foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
  shape:MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)))
),
  child: Padding(padding: EdgeInsets.all(14),
  child: Text('Send',    style:TextStyle(fontSize: 16),
  ),
  ),
),
)
          ],
        ),
      ),
    ),),);
  }
}

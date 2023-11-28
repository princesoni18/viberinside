import 'package:flutter/material.dart';
import 'package:viber/firebase/auth_methods.dart';
import 'package:viber/screens/home_screen.dart';
import 'package:viber/screens/welcome_screen.dart';
import 'package:viber/utils/utils.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final TextEditingController _emailcontroller=TextEditingController();

  final TextEditingController _passwordcontroller=TextEditingController();
  bool isloading=false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }
  void loginUser()async{
    setState(() {
      isloading=true;
    });
    String res=await AuthMethods().logInUser(email: _emailcontroller.text, password: _passwordcontroller.text);
    setState(() {
      isloading=false;
    });
    if(res=='Success'){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home_Screen(),), (route) => false);
    }
    else{
      showSnackbar(res, context);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(

          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
                children: [
            Container(
              height:MediaQuery.of(context).size.height, 
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 174, 185, 239),
            Color.fromARGB(255, 138, 99, 245),
                ]),
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 60.0, left: 22),
                child: Text(
                  'Hello\nSign in!',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 250.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                  color: Colors.white,
                ),
                height: MediaQuery.of(context).size.height-100,
                width: double.infinity,
                child:  Padding(
                  padding: const EdgeInsets.only(left: 18.0,right: 18),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       TextField(
                        controller: _emailcontroller,
                        decoration:const InputDecoration(
                          suffixIcon: Icon(Icons.check,color: Colors.grey,),
                          label: Text('Gmail',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            
                          ),)
                        ),
                      ),

                      
                       TextField(
                        controller: _passwordcontroller,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.visibility_off,color: Colors.grey,),
                            label: Text('Password',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              
                            ),)
                        ),
                      ),
                      const SizedBox(height: 20,),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text('Forgot Password?',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Color(0xff281537),
                        ),),
                      ),
                      const SizedBox(height: 70,),
                      GestureDetector(
                        onTap: ()=>loginUser(),
                        child: Container(
                          height: 55,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 142, 158, 236),
                                  Colors.deepPurpleAccent,
                              ]
                            ),
                          ),
                          child: const Center(child: Text('SIGN IN',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white
                          ),),),
                        ),
                      ),
                      const SizedBox(height: 100,),
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Don't have account?",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                            ),),
                            Text("Sign up",style: TextStyle(///done login page
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.black
                            ),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
                ],
              ),
          ),
        ));
  }
}
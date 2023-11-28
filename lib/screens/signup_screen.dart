import 'package:flutter/material.dart';
import 'package:viber/firebase/auth_methods.dart';
import 'package:viber/screens/home_screen.dart';
import 'package:viber/utils/utils.dart';

class RegScreen extends StatefulWidget {
 RegScreen({Key? key}) : super(key: key);

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  bool _isLoading=false;
  final TextEditingController _namecontroller=TextEditingController();

  final TextEditingController _emailcontroller=TextEditingController();

  final TextEditingController _passwordcontroller=TextEditingController();

  void signUpUser() async {
    setState(() {
      _isLoading=true;
    });
              String res = await AuthMethods().signUpUser(
                  email: _emailcontroller.text,
                  password: _passwordcontroller.text,
                  Username: _namecontroller.text,
                 
                  
                  );
                  setState(() {
                    
                    _isLoading=false;
                  });
                  if(res=='success') {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home_Screen(),), (route) => false);
                  }
                  if(res!='success'){
                    showSnackbar(res, context);
                  }
                  
              
            }


          @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _namecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height+50,
              child: Stack(//thanks for watching
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 174, 185, 239),
            Color.fromARGB(255, 138, 99, 245),
              
                      ]),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 100.0, left: 22),
                      child: Text(
                        'Create Your\nAccount',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 280.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                        color: Colors.white,
                      ),
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      child:  Padding(
                        padding: const EdgeInsets.only(left: 18.0,right: 18),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             TextField(
                              controller: _namecontroller,
                              decoration: const InputDecoration(
                                  suffixIcon: Icon(Icons.check,color: Colors.grey,),
                                  label: Text('Full Name',style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                   
                                  ),)
                              ),
                            ),
                             TextField(
                              controller: _emailcontroller,
                              decoration: const InputDecoration(
                                  suffixIcon: Icon(Icons.check,color: Colors.grey,),
                                  label: Text('Email address',style: TextStyle(
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
                            const TextField(
                              decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.visibility_off,color: Colors.grey,),
                                  label: Text('Confirm Password',style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    
                                  ),)
                              ),
                            ),
                
                          
                            const SizedBox(height: 40,),
                            GestureDetector(
                              onTap: ()=>signUpUser(),
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
                            const SizedBox(height: 10,),
                            
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
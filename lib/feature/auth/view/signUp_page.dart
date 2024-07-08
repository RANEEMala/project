
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/constant/string.dart';
import 'package:project/core/constant/style_string.dart';
import 'package:project/core/resources/color_palete.dart';
import 'package:project/feature/auth/bloc/auth_bloc.dart';
import 'package:project/feature/auth/bloc/auth_event.dart';
import 'package:project/feature/auth/bloc/auth_state.dart';
import 'package:project/feature/create_project/view/project_page.dart';
import 'package:project/model/signup_model.dart';

class signUpPage extends StatelessWidget {
   signUpPage({super.key});
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
      backgroundColor: primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
               Container(
                    width: 360,
                    height: 500,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 217, 217, 217),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                   
                      child: Form(
                      key: formKey,
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
                           Padding(
                            padding: const EdgeInsets.only(right: 220,top: 30),
                            child: Text("firstname",style: TextStyle(color: primary,
                                ),),
                          ),
                           Padding(
                              padding: const EdgeInsets.only(left: 30,right: 30,top: 8),
                           child: TextFormField(     
                          controller: firstnameController,            
                          decoration: InputDecoration(
                         filled: true,
                         fillColor: secondary,
                        hintText: "Example",
                        hintStyle: TextStyle(color: primary,) ,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: primary,width: 1.0)
                            )),
                             validator: (value) {
                          if (value!.isEmpty) {
                             return "Please enter your first name";
                             
                             }
                          return null;
                                },
                            
                             ),
                           ),
                             Padding(
                            padding: const EdgeInsets.only(right: 220,top: 30),
                            child: Text("lastname",style: TextStyle(color: primary,
                                ),),
                          ),
                           Padding(
                              padding: const EdgeInsets.only(left: 30,right: 30,top: 8),
                           child:   TextFormField(
                                      controller: lastnameController,
                                        decoration: InputDecoration(
                         filled: true,
                         fillColor: secondary,
                        hintText: "Example",
                        hintStyle: TextStyle(color: primary,) ,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: primary,width: 1.0)
                            )),
                           validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
            ),
                          SizedBox(height: 10),
                         Padding(
                            padding: const EdgeInsets.only(right: 250,top: 30),
                            child: Text("Email",style: TextStyle(color: primary,
                                ),),
                          ),
                           Padding(
                              padding: const EdgeInsets.only(left: 30,right: 30,top: 8),
                             child:  TextFormField(
                              controller: emailController,
                                        decoration: InputDecoration(
                         filled: true,
                         fillColor: secondary,
                        hintText: "Example@gmail.com",
                        hintStyle: TextStyle(color: primary,) ,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: primary,width: 1.0)
                            )),validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
            ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(right: 220,top: 30),
                            child: Text("Password",style: TextStyle(color: primary,
                                ),),
                          ),
                         Padding(
                           padding: const EdgeInsets.only(left: 30,right: 30,top: 8),
                           child: StatefulBuilder(
                                           builder: (BuildContext context, StateSetter setState) {
                                             bool obscureText = true;
                                             return TextFormField(
                                              controller: passwordController,
                                               obscureText: obscureText,
                                               decoration: InputDecoration(
                                                filled: true,
                                          fillColor: secondary,
                                          hintText: "*******",
                                           hintStyle: TextStyle(color: primary) ,
                                          suffixIcon: IconButton(
                                         icon: Icon(obscureText
                                         ? Icons.visibility
                                          : Icons.visibility_off,),
                                        onPressed: () {
                                           setState(() {
                                        obscureText = !obscureText;
                                          });
                                               },
                                                 ),
                            enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: primary,width: 1.0)
                            )), validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                                               
                                             );
                                           },
                                         ),
                         ),
                          SizedBox(height: 10),
                         
                        ],
                      ),
                    ),
                ),
                
                Positioned(
                  top: -50,
                  child: CircleAvatar(
                    radius: 50,
                    child: Image.asset('assets/images/image1.png'),
                  ),
                ),
                 
              ],
              
            ),
          ),
                 SizedBox(height: 20),
                 BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if(state is ErrorState){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)),);
                    }else if (state is SuccessState){
                      Navigator.push(context, MaterialPageRoute(builder:(context) => const HomePage(),),);
                    }
                  },
                  builder: (context, state) {
                    if (state is InitialState) {
                    return  InkWell(onTap: () {
                       if (formKey.currentState!.validate()) {
                         context.read<AuthBloc>().add(
                                  SignUp(
                                    user: SignupModel(
                                      firstName: firstnameController.text,
                                      lastName: lastnameController.text,
                                      email: emailController.text,
                                      role: 'USER',
                                      password: passwordController.text,
                                    ),
                                  ),
                                );
                }},
                  child: Container(
                    alignment: Alignment.center,
                    child: Text("Sign Up",
                      style: TextStyle(fontSize: 30, color: primary),
                    ),
                    width: 308,
                    height: 58,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), 
                      color: Color(0xFFECDAC4),
                    ),
                  ),
                );
                    } else if (state is ErrorState) {
                      return SizedBox(
                        height: 300,
                        child: Column(
                          children: [
                            InkWell(onTap: () {
                         context.read<AuthBloc>().add(
                                  SignUp(
                                    user: SignupModel(
                                      firstName: firstnameController.text,
                                      lastName: lastnameController.text,
                                      email: emailController.text,
                                      role: 'USER',
                                      password: passwordController.text,
                                    ),
                                  ),
                                );
                },),
                 Text(state.message,style: error),
                          ],
                        ),
                      );
                    } else if (state is ExceptionState) {
                      return SizedBox(
                        height: 300,
                        child: Column(
                          children: [
                            InkWell(onTap: () {
                         context.read<AuthBloc>().add(
                                  SignUp(
                                    user: SignupModel(
                                      firstName: firstnameController.text,
                                      lastName: lastnameController.text,
                                      email: emailController.text,
                                      role: 'USER',
                                      password: passwordController.text,
                                    ),
                                  ),
                                );
                               },),
                            Text(state.wrong,style: error,),
                          ],
                        ),
                      );}else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(str, style: TextStyle(color:Colors.white),),
                         TextButton(onPressed: () { 
                            
Navigator.push(context, MaterialPageRoute(builder:(context) => const loginPage(),),);
                          },
                         child: Text(' Log In', style: TextStyle(color: secondary),)),
              ],
            ),
        ],),
        );
      }),
    );
  }
}


class loginPage extends StatelessWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
               Container(
                    width: 360,
                    height: 450,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 217, 217, 217),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       
                        SizedBox(height: 20),
                       Padding(
                          padding: const EdgeInsets.only(right: 250,top: 30),
                          child: Text("Email",style: TextStyle(color: primary,
          ),),
                        ),
                         Padding(
                            padding: const EdgeInsets.only(left: 30,right: 30,top: 8),
                           child:  TextField(
                  decoration: InputDecoration(
                       filled: true,
                       fillColor: secondary,
                      hintText: "Example@gmail.com",
                      hintStyle: TextStyle(color: primary,) ,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: primary,width: 1.0)
                          )),
                          
                          
                ),
                         ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(right: 220,top: 30),
                          child: Text("Password",style: TextStyle(color: primary,
          ),),
                        ),
                       Padding(
                         padding: const EdgeInsets.only(left: 30,right: 30,top: 8),
                         child: StatefulBuilder(
                                         builder: (BuildContext context, StateSetter setState) {
                                           bool obscureText = true;
                                           return TextField(
                                             obscureText: obscureText,
                                             decoration: InputDecoration(
                                              filled: true,
                       fillColor: secondary,
                        hintText: "*******",
                      hintStyle: TextStyle(color: primary) ,
                                              
                                               suffixIcon: IconButton(
                          icon: Icon(
                            obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                                               ),
                                                enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: primary,width: 1.0)
                          )),
                                             
                                           );
                                         },
                                       ),
                       ),
                        SizedBox(height: 10),
                      ],
                    ),
                ),
                
                Positioned(
                  top: -50,
                  child: CircleAvatar(
                    radius: 50,
                    child: Image.asset('assets/images/image1.png'),
                  ),
                ),
                 
              ],
              
            ),
          ),
        
      
      SizedBox(height: 20),
          Container(
                  alignment: Alignment.center,
                  child: Text("Log In",
                    style: TextStyle(fontSize: 30, color: primary),
                  ),
                  width: 308,
                  height: 58,
                  decoration: BoxDecoration(
                    //border: Border.all(width: 2.0 ,color: Color.fromARGB(255, 70, 45, 36),),
                    borderRadius: BorderRadius.circular(10), 
                    color: Color(0xFFECDAC4),
                  ),
                ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don’t have an account ?', style: TextStyle(color:Colors.white),),
                         TextButton(onPressed: () { 
                          Navigator.push(context, MaterialPageRoute(builder:(context) => signUpPage(),),);
                          },
                         child: Text(' Sign Up', style: TextStyle(color: secondary),)),
                      ],
                    ),
        ],),);
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body:  Column(
        children: [
         Center(
           child: Container(
              child: Image.asset(
                'assets/images/image2.png'
              ),
            ),
         ),
          InkWell(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder:(context) =>  projectPage(),),);
          },
            child: Container(
                    alignment: Alignment.center,
                    child: Text("Create",
                      style: TextStyle(fontSize: 30, color: primary),
                    ),
                    width: 308,
                    height: 65,
                    decoration: BoxDecoration(
                    border: Border.all(width: 1.5 ,color: Colors.black),
                      borderRadius: BorderRadius.circular(20), 
                      color: Color(0xFFECDAC4),
                    ),
                  ),
          ),
                SizedBox(height: 60,),
                Center(
          child: DottedBorder(
            color: Colors.white,          // لون النقاط
            strokeWidth: 1,              // عرض الخط
            dashPattern: [16, 8],         // نمط النقاط: 8 وحدات مرئية و4 وحدات غير مرئية
            borderType: BorderType.RRect, // نوع الحدود
            radius: Radius.circular(12), // نصف قطر الزوايا
            child: Container(
              padding: EdgeInsets.all(16),
            child:   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Icon(Icons.add_circle,color: Colors.white,size: 40,),
                      Text('Join',style: TextStyle(color: Colors.white,fontSize: 30),),
                    ],),
                     width: 308,
                  height: 65,
            ),
          ),
        ),
      ],),
    );
  }
}
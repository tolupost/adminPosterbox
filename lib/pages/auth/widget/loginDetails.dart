

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:adminposterbox/utils/globalvariable.dart';
import '../../../controllers/menu_controller.dart';
import '../../home_page.dart';
import '../services/authservices.dart';

class logindetails extends StatefulWidget {
  const logindetails({
    Key? key,
  }) : super(key: key);

  @override
  State<logindetails> createState() => _logindetailsState();
}

class _logindetailsState extends State<logindetails> with SingleTickerProviderStateMixin {
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  bool isObscure = true;

  void signInUser() {
    setState(() {
      isLoading = true;
    });
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    ).then((value) => setState(() {
      isLoading = false;
    }));
    Timer(Duration(minutes: 1), () {
      setState(() {
        isLoading = false;
      });
    });
  }
  void signUpUser() {
    setState(() {
      isLoading = true;
    });
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
      code: _codeController.text,
    ).then((value) => setState(() {
      isLoading = false;
    }));
    Timer(Duration(minutes: 1), () {
      setState(() {
        isLoading = false;
      });
    });
  }
  var tweenLeft = Tween<Offset>(begin: Offset(2, 0), end: Offset(0, 0))
      .chain(CurveTween(curve: Curves.ease));
  var tweenRight = Tween<Offset>(begin: Offset(0, 0), end: Offset(2, 0))
      .chain(CurveTween(curve: Curves.ease));

  AnimationController? _animationController;

  var _isMoved = false;

  bool isChecked = false;
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _codeController.dispose();
    _animationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        SlideTransition(
          position:
          _animationController!.drive(tweenRight),
          child: Stack(
            fit: StackFit.loose,
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                color: Color.fromARGB(52, 117, 117, 117),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Login',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 18
                      ),),
                    SizedBox(height: 8,),
                    TextField(
                      controller: _emailController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(FontAwesomeIcons.mailchimp,
                          size: 15,
                          color: Colors.white12,),
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: Colors.grey[300],
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16
                        ),
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                    ),
                    SizedBox(height:8),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(FontAwesomeIcons.lock,
                          size: 15,
                          color: Colors.white12,),
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: Colors.grey[300],
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16
                        ),
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                    ),
                    SizedBox(height: 8,),
                    isLoading
                        ?Center(child: CircularProgressIndicator()):ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.all(16),
                        ),
                        onPressed: (){
                          signInUser();

                        },
                        child: Text("login")),
                    SizedBox(height: 24.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Checkbox(
                              side: BorderSide(color: Colors.white),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text("Remember Me",style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 4.0),
                    Center(
                      child: Wrap(
                        runAlignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            "Don't have an account yet?",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontWeight: FontWeight.w300,color: Colors.white),
                          ),
                          SizedBox(width: 10,),
                          InkWell(
                            onTap: () {
                              if (_isMoved) {
                                _animationController!.reverse();
                              } else {
                                _animationController!.forward();
                              }
                              _isMoved = !_isMoved;
                            },
                            child: Text("Sign up",
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontWeight: FontWeight.w400,color: globalvariable.primarycolor)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),

              ),
            ],
          ),
        ),
        SlideTransition(
          position:
          _animationController!.drive(tweenLeft),
          child: Stack(
            fit: StackFit.loose,
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                color: Color.fromARGB(52, 117, 117, 117),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Text('Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 18
                      ),),
                    SizedBox(height: 8,),
                    TextField(
                      controller: _emailController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(FontAwesomeIcons.mailchimp,
                          size: 15,
                          color: Colors.white12,),
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: Colors.grey[300],
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16
                        ),
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                    ),

                    SizedBox(height:8),
                    TextFormField(
                      controller: _nameController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(FontAwesomeIcons.mailchimp,
                          size: 15,
                          color: Colors.white12,),
                        hintText: "Name",
                        hintStyle: TextStyle(
                          color: Colors.grey[300],
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16
                        ),
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                    ),
                    SizedBox(height:8),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(FontAwesomeIcons.lock,
                          size: 15,
                          color: Colors.white12,),
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: Colors.grey[300],
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16
                        ),
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                    ),
                    SizedBox(height:8),
                    TextFormField(
                      controller: _codeController,
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(FontAwesomeIcons.lock,
                          size: 15,
                          color: Colors.white12,),
                        hintText: "Admin Code",
                        hintStyle: TextStyle(
                          color: Colors.grey[300],
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16
                        ),
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                    ),
                    SizedBox(height: 8,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.all(16),
                        ),
                        onPressed: (){
                          signUpUser();

                        },
                        child: Text("Sign Up")),

                          SizedBox(height: 24.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    side: BorderSide(color: Colors.white),
                                    value: isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                  ),
                                  Text("Remember Me",style: TextStyle(color: Colors.white),)
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 4.0),
                          Center(
                            child: Wrap(
                              runAlignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Text(
                                  "Already have an account?",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(fontWeight: FontWeight.w300,color: Colors.white),
                                ),
                               SizedBox(width: 10,),
                                InkWell(
                                  onTap: () {
                                    print(_isMoved);
                                    _animationController!.reverse();

                                    _isMoved = !_isMoved;
                                  },
                                  child: Text("Sign In",
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                        fontWeight: FontWeight.w400,color: globalvariable.primarycolor )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

              ),
            ],
          );



  }



}
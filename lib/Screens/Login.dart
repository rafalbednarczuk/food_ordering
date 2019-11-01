import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          // Background Image
            image: AssetImage('Assets/pizza.jpg'), 
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
              body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
          ),
          child: Padding(
            padding: const EdgeInsets.all(23.0),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                SizedBox(height: 200,),
                Form(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: TextFormField(
                          style: TextStyle(
        color: Colors.white,
    ),
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            labelText: 'Username',
                            labelStyle:
                                TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      ),
                      TextFormField(
                        style: TextStyle(
        color: Colors.white,
    ),
                        obscureText: true,
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          labelText: 'Password',
                          labelStyle:
                              TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 5),
                  child: Text('Forgot your password?',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'SFUIDisplay',
                    fontSize: 15,
                    color: Colors.white,
                  ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: MaterialButton(
                    onPressed: () {/*Login Logic here*/},
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'SFUIDisplay',
                          fontWeight: FontWeight.bold),
                    ),
                    color: Color(0xffff2d55),
                    elevation: 0,
                    minWidth: 350,
                    height: 60,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: MaterialButton(
                    onPressed: () {},//Apply Login Logic Here
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.facebookSquare),
                        Text(
                          'Sign up with Facebook',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'SFUIDisplay',
                          ),
                        ),
                      ],
                    ),
                    color: Colors.transparent,
                    elevation: 0,
                    minWidth: 350,
                    height: 60,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.white)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Center(
                    child:RichText(
    text: new TextSpan(
    children: [
    
	new TextSpan(
    text: "Don't have an account? ",
    style: TextStyle(
    fontFamily: 'SFUIDisplay',
    color: Colors.white,
    fontSize: 15,    
    )
    ),
	new TextSpan(
    text: "Sign up",
    style: TextStyle(
    fontFamily: 'SFUIDisplay',
    color: Color(0xffff2d55),
    fontSize: 15,
    )
    ),
    ]
  )
) 
                    ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

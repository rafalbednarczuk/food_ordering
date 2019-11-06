import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_ordering/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset("assets/pizza.jpg"),
            ),
            Padding(
              padding: contentDefaultHorizontalPadding,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  SizedBox(
                    height: 200,
                  ),
                  Form(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: TextFormField(
                            style: AppTextStyles.loginScreenDefault,
                            decoration: InputDecoration(
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                labelText: AppStrings.username,
                                labelStyle: AppTextStyles.loginScreenDefault),
                            textInputAction: TextInputAction.go,
                            onFieldSubmitted: (_){
                              FocusScope.of(context).requestFocus(_passwordFocusNode);
                            },
                          ),
                        ),
                        TextFormField(
                          focusNode: _passwordFocusNode,
                          style: AppTextStyles.loginScreenDefault,
                          obscureText: true,
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            labelText: AppStrings.password,
                            labelStyle: AppTextStyles.loginScreenDefault,
                          ),
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (value){
                            //TODO: Regular Login Logic
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 5),
                    child: Text(AppStrings.forgotPassword,
                        textAlign: TextAlign.right,
                        style: AppTextStyles.loginScreenDefault),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: MaterialButton(
                      onPressed: () {
                        //TODO: Regular Login Logic
                      },
                      child: Text(AppStrings.login,
                          style: AppTextStyles.loginScreenDefault),
                      color: Color(AppColors.login),
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
                      onPressed: () {
                        //TODO: Facebook Login Logic
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Icon(FontAwesomeIcons.facebookSquare),
                          Text(AppStrings.loginFacebook,
                              style: AppTextStyles.loginScreenDefault),
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
                        child: RichText(
                            text: TextSpan(children: [
                      TextSpan(
                          text: AppStrings.noAccount,
                          style: AppTextStyles.loginScreenDefault),
                      TextSpan(
                          text: AppStrings.signUp,
                          style: TextStyle(
                            fontFamily: 'SFUIDisplay',
                            color: Color(AppColors.login),
                            fontSize: 15,
                          )),
                    ]))),
                  )
                ],
              ),
            ),
          ],
        ),
      );
  }
}

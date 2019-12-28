import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_ordering/ui/screens/restaurants_screen.dart';
import 'package:food_ordering/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering/bloc/user_bloc/bloc.dart';

enum LoginRegisterPage { login, register }

class LoginRegisterScreen extends StatefulWidget {
  @override
  _LoginRegisterScreenState createState() => _LoginRegisterScreenState();
}

class _LoginRegisterScreenState extends State<LoginRegisterScreen> {
  FocusNode _passwordFocusNode;
  FocusNode _emailFocusNode;
  TextEditingController _passwordController;
  TextEditingController _usernameController;
  LoginRegisterPage _page;
  UserBloc _userBloc;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _page = LoginRegisterPage.login;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userBloc = BlocProvider.of<UserBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UserBloc, UserState>(
        condition: (previousState, currentState) =>
            previousState.user != currentState.user,
        listener: (context, state) {
          if (state.user != null) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => RestaurantsScreen()));
          }
        },
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                "assets/pizza.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: contentDefaultHorizontalPadding,
              child: ListView(
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
                            controller: _usernameController,
                            decoration: InputDecoration(
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                labelText: AppStrings.username,
                                labelStyle: AppTextStyles.loginScreenDefault),
                            textInputAction: TextInputAction.go,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_emailFocusNode);
                            },
                          ),
                        ),
                        AnimatedContainer(
                          curve: Curves.easeInCubic,
                          duration: Duration(milliseconds: 200),
                          padding: EdgeInsets.only(bottom: 20),
                          height:
                              _page == LoginRegisterPage.register ? 80.0 : 0.0,
                          child: TextFormField(
                            focusNode: _emailFocusNode,
                            style: AppTextStyles.loginScreenDefault,
                            decoration: InputDecoration(
                                enabledBorder:
                                    _page == LoginRegisterPage.register
                                        ? UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                            ),
                                          )
                                        : InputBorder.none,
                                labelText: AppStrings.email,
                                labelStyle: AppTextStyles.loginScreenDefault),
                            textInputAction: TextInputAction.go,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_passwordFocusNode);
                            },
                          ),
                        ),
                        TextFormField(
                          controller: _passwordController,
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
                          onFieldSubmitted: (value) {
                            _usernamePasswordLogin();
                          },
                        ),
                      ],
                    ),
                  ),
                  if (_page == LoginRegisterPage.login)
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 5),
                      child: InkWell(
                        onTap: () {
                          //TODO: forgot password logic
                        },
                        child: Text(AppStrings.forgotPassword,
                            textAlign: TextAlign.right,
                            style: AppTextStyles.loginScreenDefault),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: MaterialButton(
                      onPressed: () {
                        _usernamePasswordLogin();
                      },
                      child: Text(
                          _page == LoginRegisterPage.register
                              ? AppStrings.signUp
                              : AppStrings.login,
                          style: AppTextStyles.loginScreenDefault),
                      color: Color(AppColors.login),
                      elevation: 0,
                      minWidth: 350,
                      height: 60,
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
                        child: GestureDetector(
                      onTap: _switchPage,
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: _page == LoginRegisterPage.register
                                ? AppStrings.yesAccount
                                : AppStrings.noAccount,
                            style: AppTextStyles.loginScreenDefault),
                        TextSpan(
                            text: _page == LoginRegisterPage.register
                                ? AppStrings.login
                                : AppStrings.signUp,
                            style: TextStyle(
                              fontFamily: 'SFUIDisplay',
                              color: Color(AppColors.login),
                              fontSize: 15,
                            )),
                      ])),
                    )),
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _switchPage() {
    setState(() {
      if (_page == LoginRegisterPage.register) {
        _page = LoginRegisterPage.login;
      } else {
        _page = LoginRegisterPage.register;
      }
    });
  }

  void _usernamePasswordLogin() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    _userBloc.add(Login(username, password));
  }
}

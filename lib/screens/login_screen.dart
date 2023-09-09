import 'package:flutter/material.dart';
import 'package:furniture_app/common_widgets/custom_button.dart';
import 'package:furniture_app/constants/colors.dart';
import 'package:furniture_app/screens/sign_up.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: const Color.fromRGBO(189, 189, 189, 1),
                    height: 1,
                    width: MediaQuery.of(context).size.width * 0.28,
                  ),
                  Image.asset('assets/images/log_logo.png'),
                  Container(
                    color: const Color.fromRGBO(189, 189, 189, 1),
                    height: 1,
                    width: MediaQuery.of(context).size.width * 0.28,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              const Text(
                'Hello!',
                style: TextStyle(
                    fontSize: 30,
                    color: Color.fromRGBO(144, 144, 144, 1),
                    fontFamily: 'Merriweather'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const Text(
                'WELCOME BACK',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontFamily: 'Merriweather',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.53,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(-4, -4),
                      blurRadius: 15,
                      color: Color.fromRGBO(138, 149, 158, 0.15),
                    ),
                    BoxShadow(
                      offset: Offset(4, 4),
                      blurRadius: 15,
                      color: Color.fromRGBO(138, 149, 158, 0.15),
                    ),
                  ],
                ),
                child: Form(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(
                                color: hintTextColor,
                                fontSize: 14,
                                fontFamily: 'NunitoSans'),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                              color: hintTextColor,
                              fontSize: 14,
                              fontFamily: 'NunitoSans',
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                              icon: Icon(
                                !_showPassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                              ),
                            ),
                          ),
                          obscureText: !_showPassword,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        CustomButton(
                          function: () {},
                          text: 'Log in',
                          height: 50,
                          width: 285,
                          fontFamily: 'NunitoSans',
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                          },
                          child: const Text(
                            'SIGN UP',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
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

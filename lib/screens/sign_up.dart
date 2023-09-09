import 'package:flutter/material.dart';
import 'package:furniture_app/common_widgets/custom_button.dart';
import 'package:furniture_app/constants/colors.dart';
import 'package:furniture_app/screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              const Text(
                'WELCOME',
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
                height: MediaQuery.of(context).size.height * 0.67,
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
                            hintText: 'Name',
                            hintStyle: TextStyle(
                                color: hintTextColor,
                                fontSize: 14,
                                fontFamily: 'NunitoSans'),
                          ),
                        ),
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
                        CustomButton(
                          function: () {},
                          text: 'Sign up',
                          height: 50,
                          width: 285,
                          fontFamily: 'NunitoSans',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have account?',
                              style: TextStyle(
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color.fromARGB(255, 128, 128, 128),
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                              },
                              child: const Text(
                                'LOG IN',
                                style: TextStyle(
                                  fontFamily: 'NunitoSans',
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        )
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

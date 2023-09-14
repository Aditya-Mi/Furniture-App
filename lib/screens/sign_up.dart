import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_app/common_widgets/custom_button.dart';
import 'package:furniture_app/constants/colors.dart';
import 'package:furniture_app/providers/auth_provider.dart';
import 'package:furniture_app/screens/login_screen.dart';
import 'package:furniture_app/screens/main_screen.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _form = GlobalKey<FormState>();
  var _enteredEmail = '';
  var _enteredPassword = '';
  var _enteredUsername = '';
  var _enteredConfirmPassword = '';
  bool _showPassword = false;

  void _submit() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    if (_enteredPassword != _enteredConfirmPassword) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Confirm Password should be same as Password'),
          ),
        );
      }
      return;
    }
    _form.currentState!.save();
    try {
      final userCredential = await ref
          .read(authRepositoryProvider)
          .signUpWithEmailPassword(
              email: _enteredEmail,
              password: _enteredPassword,
              name: _enteredUsername);
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          if (context.mounted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MainScreen(),
              ),
            );
          }
        }
      });
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message ?? 'Authentication failed'),
          ),
        );
      }
    }
  }

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
                  key: _form,
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
                          enableSuggestions: false,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.trim().length < 4) {
                              return 'Please enter at least 4 characters long';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredUsername = value!;
                          },
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(
                                color: hintTextColor,
                                fontSize: 14,
                                fontFamily: 'NunitoSans'),
                          ),
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty ||
                                !value.contains('@')) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredEmail = value!;
                          },
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
                          validator: (value) {
                            if (value == null || value.trim().length < 6) {
                              return 'Password must be atleast 6 characters long.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredPassword = value!;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
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
                          validator: (value) {
                            if (value == null || value.trim().length < 6) {
                              return 'Password must be atleast 6 characters long.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredPassword = value!;
                          },
                        ),
                        CustomButton(
                          function: _submit,
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

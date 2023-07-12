import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../cubit/app_cubit.dart';
import '../cubit/app_states.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context, state) {
          if (state is LoginErrorState) {
            Fluttertoast.showToast(
                msg: state.error,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        builder: (BuildContext context, Object? state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Login'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                      TextFormField(
                        controller: _emailController,

                        validator: (value) {
                          // add email validation
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          }

                          bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);
                          if (!emailValid) {
                            return 'Please enter a valid email';
                          }

                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }

                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            prefixIcon: const Icon(Icons.lock_outline_rounded),
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(_isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            )),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                      ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        builder: (BuildContext context) { return ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Implement your login logic here
                              String email = _emailController.text;
                              String password = _passwordController.text;
                              // Call the login API or perform authentication
                              cubit.Login(email: email, password: password);
                            }
                          },
                          child: Text('Login'),
                        );  },
                        fallback: (BuildContext context) { return Center(child: CircularProgressIndicator(),);  },

                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
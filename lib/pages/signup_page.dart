import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              // back Button
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.purple[300],
                    )),
              ),
              // Logo
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 100,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        'Name',
                        style: TextStyle(
                          color: Colors.purple[300],
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Container with 2 textfield
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
                margin: const EdgeInsets.only(bottom: 50),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'Name'),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'Surname'),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'Email'),
                    ),
                    TextFormField(
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration: const InputDecoration(hintText: 'Password'),
                    ),
                    TextFormField(
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration:
                          const InputDecoration(hintText: 'Confirm password'),
                    ),
                  ],
                ),
              ),
              // Next button
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.grey,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  child: const Text('NEXT'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

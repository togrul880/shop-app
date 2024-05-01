import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopapp/datas/mock_data.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // top color
            Container(
              margin: const EdgeInsets.only(bottom: 50),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(255, 208, 207, 207),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 5))
                ],
              ),
            ),

            // Main info with for loop
            SizedBox(
              height: 340,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < contactPageMainInfo.length; i++)
                    Container(
                      height: 60,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      color: Colors.grey[200],
                      child: Row(
                        children: [
                          Image.asset(contactPageMainInfo[i][0]),
                          const SizedBox(width: 45),
                          Text(
                            contactPageMainInfo[i][1],
                            style: const TextStyle(
                              fontSize: 18,
                              letterSpacing: 5,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),

            // Send Message Button
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    color: Color.fromARGB(255, 163, 203, 235),
                  )
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 15),
              margin: const EdgeInsets.symmetric(vertical: 50),
              child: Text(
                'Send Message',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.purple[300],
                  letterSpacing: 3,
                ),
              ),
            ),

            // Additional Ingo
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 45),
              child: Text(
                'Additional Info',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),

            SizedBox(
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < contactPageAddtionalInfo.length; i++)
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                            color: Color.fromARGB(255, 163, 203, 235),
                          )
                        ],
                      ),
                      height: 80,
                      width: MediaQuery.of(context).size.width * 0.86,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Flexible(
                              flex: 20,
                              child: SvgPicture.asset(
                                  contactPageAddtionalInfo[i][0]),
                            ),
                          ),
                          Flexible(
                            flex: 70,
                            child: Text(
                              contactPageAddtionalInfo[i][1],
                              overflow: TextOverflow.visible,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Conatiner for image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/about_us.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),

          // Text title
          const Positioned(
            top: 150,
            left: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About',
                  style: TextStyle(
                      fontSize: 44,
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Us',
                  style: TextStyle(
                      fontSize: 44,
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          // Info with lorem ipsum
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(40),
              width: 350,
              height: 550,
              color: Colors.white,
              child: Text(
                lorem(paragraphs: 3, words: 75),
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

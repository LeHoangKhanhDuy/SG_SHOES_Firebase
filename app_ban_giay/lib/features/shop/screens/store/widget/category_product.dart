import 'package:flutter/material.dart';

class CategoryProduct extends StatelessWidget {
  const CategoryProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for(int i = 1; i < 8; i++)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFF0EEED),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/logos/adidaslogo.png", width: 40, height: 40),
                const Text("Nike", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
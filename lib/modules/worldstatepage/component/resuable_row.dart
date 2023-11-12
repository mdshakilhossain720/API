import 'package:flutter/material.dart';
class ResuableRow extends StatelessWidget {
  final String title,value;
  const ResuableRow({ required this.value,required this.title,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 5,left: 10,right: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
            Text(value),
            ],
          )
        ],
      ),
    );
  }
}

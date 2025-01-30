import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  Task({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.grey),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        contentPadding: EdgeInsets.all(8),
        leading: Checkbox(
          value: true,
          onChanged: (value) {},
        ),
        title: Text(
          'Descrição da TASK',
          style: TextStyle(
            decoration: TextDecoration.lineThrough,
          ),
        ),
        subtitle: Text(
          '28/01/2025',
          style: TextStyle(
            decoration: TextDecoration.lineThrough,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(width: 1),
        ),
      ),
    );
  }
}

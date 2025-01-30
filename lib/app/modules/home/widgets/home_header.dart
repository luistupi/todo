import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Text(
            'E ai, Nome do usuário',
            style: context.textTheme.headlineLarge,
          )
        ],
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                color: context.primaryColor.withAlpha(70),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Nome do usuário',
                          style: context.textTheme.bodySmall),
                    ),
                  )
                ],
              ),
              ),
              ListTile(title: Text('Alterar nome'),),
               ListTile(
//                onTap: () => context.read<AuthProvider>().logout(),
                title: Text('sair'),)
        ],
      ),
    );
  }
}

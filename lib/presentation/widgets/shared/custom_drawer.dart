import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/presentation/screens/screens.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff00E79D),
                    Color(0xff00ACEC),
                  ]),
            ),
            child: Icon(Icons.person_outline, size: 100, color: Colors.white),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            onTap: () => Get.toNamed(LatestMoviesScreen.screenName),
          ),
        ],
      ),
    );
  }
}

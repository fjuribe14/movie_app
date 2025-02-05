import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:new_app/config/constants/assets.dart';

enum CustomAppbarType { back, menu, close }

class CustomAppbar extends StatelessWidget {
  final String title;
  final CustomAppbarType type;

  const CustomAppbar({
    super.key,
    this.title = 'Latest',
    this.type = CustomAppbarType.menu,
  });

  @override
  Widget build(BuildContext context) {
    final icons = {
      CustomAppbarType.menu: Assets.menuIcon,
      CustomAppbarType.close: Assets.closeIcon,
      CustomAppbarType.back: Assets.arrowBackIcon,
    };

    final actions = {
      CustomAppbarType.back: () => Get.back(),
      CustomAppbarType.close: () => Get.back(),
      CustomAppbarType.menu: () => Scaffold.of(context).openDrawer(),
    };

    return SliverAppBar(
      leadingWidth: 90,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      floating: type != CustomAppbarType.menu,
      title: Text(type == CustomAppbarType.menu ? title : '',
          style: TextStyle(
            fontFamily: 'Baloo',
            fontSize: Get.textTheme.displayMedium!.fontSize,
          )),
      leading: Builder(
        builder: (context) => IconButton(
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () => actions[type]!(),
          icon: Transform.rotate(
              angle: type == CustomAppbarType.back ? 1.5 : 0,
              child: Image.asset(icons[type] ?? Assets.menuIcon)),
        ),
      ),
    );
  }
}

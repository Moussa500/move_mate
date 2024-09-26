import 'package:flutter/material.dart';
import 'package:move_mate/config/themes/ap_colors.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? action;
  final bool? hidBack;
  const BasicAppBar(
      {super.key, this.title, this.action, this.hidBack});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: title ?? const Text(""),
      actions: [action ?? Container()],
      centerTitle: true,
      elevation: 0,
      leading: hidBack == true
          ? null
          : IconButton(
              onPressed: () {},
              icon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.03),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 15,
                  color: Colors.black,
                ),
              )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

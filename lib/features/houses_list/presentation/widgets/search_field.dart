import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:move_mate/config/themes/ap_colors.dart';
import 'package:move_mate/core/common/widgets/appstyle.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});
  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        onChanged: (value) {},
        decoration: InputDecoration(
          filled: true,
          fillColor: kgrey,
          hintText: "search home",
          suffixIcon: GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.search_outlined,
              color: primaryColor,
            ),
          ),
          hintStyle: const Appstyle(
              fontWeight: FontWeight.w300,
              fontSize: 15,
              textColor: primaryColor),
        ).applyDefaults(Theme.of(context).inputDecorationTheme),
      ),
    );
  }
}

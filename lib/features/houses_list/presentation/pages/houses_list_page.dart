import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_mate/config/themes/ap_colors.dart';
import 'package:move_mate/core/common/widgets/appstyle.dart';
import 'package:move_mate/core/common/widgets/basic_app_bar.dart';
import 'package:move_mate/core/common/widgets/hight_spacer.dart';
import 'package:move_mate/features/houses_list/presentation/bloc/bloc.dart';
import 'package:move_mate/features/houses_list/presentation/bloc/houses_list_bloc.dart';
import 'package:move_mate/features/houses_list/presentation/widgets/houses_list.dart';
import 'package:move_mate/features/houses_list/presentation/widgets/search_field.dart';

class HousesListPage extends StatelessWidget {
  const HousesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HousesListBloc>(
      create: (context) => HousesListBloc()..add(const GetRentedHousesList()),
      child: const Scaffold(
        appBar: BasicAppBar(
          hidBack: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Hello,\nWelcome to the app",
                style: Appstyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 27,
                    textColor: primaryColor),
              ),
            ),
            HightSpacer(size: 100),
            HousesList()
          ],
        ),
      ),
    );
  }
}

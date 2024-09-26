
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mate/config/themes/ap_colors.dart';
import 'package:move_mate/core/common/widgets/appstyle.dart';
import 'package:move_mate/core/common/widgets/hight_spacer.dart';
import 'package:move_mate/core/common/widgets/outlinedButton.dart';
import 'package:move_mate/core/constants/app_constants.dart';
import 'package:move_mate/features/houses_list/presentation/bloc/houses_list_bloc.dart';
import 'package:move_mate/features/houses_list/presentation/widgets/search_field.dart';

class HousesList extends StatefulWidget {
  const HousesList({super.key});
  @override
  State<HousesList> createState() => _HousesListState();
}
class _HousesListState extends State<HousesList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HousesListBloc, HousesListState>(
      builder: <HousesListBloc, HousesListState>(context, state) {
        if (state is HousesListLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (state is RentedHousesListLoaded) {
          return Column(
            children: [
              const SearchField(),
              const HightSpacer(size: 100),
              SizedBox(
                height: hieght * 0.6,
                width: width * 0.9,
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return FittedBox(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 420.h,
                          width: width * 0.9,
                          decoration: const BoxDecoration(
                              color: kgrey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                width: 300.w,
                                height: 250.h,
                                child: Image.network(
                                  "http://10.0.2.2:8000/media/house/rentedHouse/pic.jpeg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 400.h,
                                width: 400.w,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        state.houses[index].title!,
                                        overflow: TextOverflow.fade,
                                        style: Appstyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 32.sp,
                                            textColor: primaryColor),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            color: primaryColor,
                                          ),
                                          SizedBox(
                                            width: 300.w,
                                            child: Text(
                                              state.houses[index].mapsLocation!,
                                              overflow: TextOverflow.clip,
                                              style: Appstyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 30.sp,
                                                  textColor: primaryColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                              width: 300.w,
                                              height: 100.h,
                                              child: CustomOutlinedbutton(
                                                  onPressed: () {},
                                                  label: '80dt/night')),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const HightSpacer(size: 20),
                    itemCount: state.houses.length),
              )
            ],
          );
        }
        if (state is HousesListFail) {
          return const Center(
            child: Text("Failed to load Houses"),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

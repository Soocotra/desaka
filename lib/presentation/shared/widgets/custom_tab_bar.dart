import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.tabs,
    this.tabController,
    this.onTap,
  });

  final List<Widget> tabs;
  final TabController? tabController;
  final void Function(int value)? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.h,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(30.r)),
      child: TabBar(
        tabAlignment: TabAlignment.center,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Theme.of(context).colorScheme.primary,
        tabs: tabs,
        labelPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        padding: EdgeInsets.all(3.w),
        dividerColor: Colors.transparent,
        controller: tabController,
        labelStyle: Theme.of(context).textTheme.labelMedium,
        unselectedLabelColor: Theme.of(context).colorScheme.onPrimary,
        indicator: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(30.r)),
        indicatorColor: Theme.of(context).colorScheme.onPrimary,
        onTap: onTap,
      ),
    );
  }
}
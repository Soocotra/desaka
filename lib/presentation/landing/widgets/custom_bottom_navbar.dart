import 'package:desaka/presentation/landing/controllers/landing.controller.dart';
import 'package:flutter/material.dart';

buildCustomBottomNavbar(BuildContext context, LandingController controller) {
  return BottomAppBar(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    height: 80,
    color: Theme.of(context).colorScheme.primaryContainer,
    shape: const CircularNotchedRectangle(),
    notchMargin: 5,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.home_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            controller.changeTabIndex(0);
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.calendar_month_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            controller.changeTabIndex(1);
          },
        ),
        const SizedBox(),
        IconButton(
          icon: const Icon(
            Icons.logout_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            controller.changeTabIndex(2);
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.notifications_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            controller.changeTabIndex(3);
          },
        ),
      ],
    ),
  );
}
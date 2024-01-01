import 'package:desaka/infrastructure/theme/color/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
  var initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: GetMaterialApp(
        initialRoute: initialRoute,
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme, fontFamily: "Poppins"),
        getPages: Nav.routes,
      ),
    );
  }
}

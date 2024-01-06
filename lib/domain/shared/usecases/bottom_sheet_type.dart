import 'package:flutter/material.dart';

import '../../../presentation/shared/bottom_sheet/base.dart';

enum BottomSheetType {
  base(BaseBottomSheet(
    text: "Absensi berhasil",
    buttonText: 'Oke',
    illustration: FlutterLogo(),
  ));

  const BottomSheetType(this.content);
  final Widget content;
}
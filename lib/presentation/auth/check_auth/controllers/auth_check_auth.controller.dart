import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthCheckAuthController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement AuthCheckAuthController

  final Rxn<AnimationController> _animationController =
      Rxn<AnimationController>();

  AnimationController? get animationController => _animationController.value;

  final _breathe = 0.0.obs;

  get breathe => _breathe.value;

  var _isLogged = false.obs;

  @override
  void onInit() {
    super.onInit();
    initAnimation();
    checkAuth();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    animationController?.dispose();
    super.onClose();
  }

  void initAnimation() {
    _animationController.value = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    _animationController.value?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.value?.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.value?.forward();
      }
    });

    _animationController.value?.addListener(() {
      _breathe.value = _animationController.value!.value;
    });
    _animationController.value?.forward();
  }

  //TODO temporary code
  Future<void> checkAuth() async {
    await Future.delayed(const Duration(seconds: 3));
    ever(_isLogged, fireRoute);
    _isLogged.value = true;
  }

  fireRoute(logged) {
    if (logged) {
      Get.offNamed("/auth-login");
    } else {}
  }
}

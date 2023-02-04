import 'dart:developer';

import 'package:animation_3d/ui/common/resources/app_colors.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final numberOfBoxes = AppColors.purple.length;
  late AnimationController _firstController;
  late AnimationController _secondController;
  late Animation<double> _firstAnimation;
  late Animation<double> _secondAnimation;

  @override
  void initState() {
    super.initState();
    _firstController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);
    _secondController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);
    _firstAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_firstController);
    _secondAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(_secondController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: List.generate(
          numberOfBoxes,
          (index) {
            return _box(index);
          },
        ),
      ),
    );
  }

  Widget _box(int index) {
    final i = numberOfBoxes - index;
    final size = MediaQuery.of(context).size.height * (i / 11);
    log('Size: $size');
    return Center(
      child: AnimatedBuilder(
        animation: index % 2 == 0 ? _secondAnimation : _firstAnimation,
        builder: (context, child) {
          final animationValue =
              index % 2 == 0 ? _secondAnimation.value : _firstAnimation.value;
          final radius = BorderRadius.circular(40 * animationValue);
          return PhysicalModel(
            color: AppColors.purple[index],
            elevation: 10.0,
            borderRadius: radius,
            child: Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                color: AppColors.purple[index],
                borderRadius: radius,
              ),
            ),
          );
        },
      ),
    );
  }
}

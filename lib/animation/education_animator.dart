import 'package:flutter/material.dart';
import 'package:myself/education/education.dart';
import 'package:myself/model/repo_data.dart';

class EducationAnimator extends StatefulWidget {
  const EducationAnimator({super.key});

  @override
  State<EducationAnimator> createState() => _EducationAnimatorState();
}

class _EducationAnimatorState extends State<EducationAnimator> with SingleTickerProviderStateMixin {

  AnimationController? _controller;

  @override
  void initState() {
    _controller = new AnimationController(duration:Duration(milliseconds: 1780),vsync: this);
    _controller!.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Education(company: RepoData.bawp, controller: _controller,)),
    );
  }
}

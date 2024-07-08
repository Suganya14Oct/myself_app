import 'package:flutter/material.dart';
import 'package:myself/model/repo_data.dart';
import 'package:myself/work_experience/work_experience.dart';

class WorkAnimator extends StatefulWidget {
  const WorkAnimator({super.key});

  @override
  State<WorkAnimator> createState() => _WorkAnimatorState();
}

class _WorkAnimatorState extends State<WorkAnimator> with SingleTickerProviderStateMixin {

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
      body: SafeArea(child: WorkExperience(company: RepoData.bawp, controller: _controller,)),
    );
  }
}

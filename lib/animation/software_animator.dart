import 'package:flutter/material.dart';
import 'package:myself/model/repo_data.dart';
import 'package:myself/software_skills/software_skills.dart';

class SoftwareAnimator extends StatefulWidget {
  const SoftwareAnimator({super.key});

  @override
  State<SoftwareAnimator> createState() => _SoftwareAnimatorState();
}

class _SoftwareAnimatorState extends State<SoftwareAnimator> with SingleTickerProviderStateMixin {

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
      body: SafeArea(child: SoftwareSkills(company: RepoData.bawp, controller: _controller,)),
    );
  }
}

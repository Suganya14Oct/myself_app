import 'package:flutter/material.dart';
import 'package:myself/personal_projects/project_one.dart';
import 'package:myself/model/repo_data.dart';

class ProOneAnimator extends StatefulWidget {
  const ProOneAnimator({super.key});

  @override
  State<ProOneAnimator> createState() => _ProOneAnimatorState();
}

class _ProOneAnimatorState extends State<ProOneAnimator> with SingleTickerProviderStateMixin {

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
      body: SafeArea(child: ProjectOne(company: RepoData.bawp, controller: _controller)),
    );
  }
}

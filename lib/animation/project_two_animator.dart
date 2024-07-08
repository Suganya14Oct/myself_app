import 'package:flutter/material.dart';
import 'package:myself/personal_projects/project_two.dart';
import 'package:myself/model/repo_data.dart';

class ProTwoAnimator extends StatefulWidget {
  const ProTwoAnimator({super.key});

  @override
  State<ProTwoAnimator> createState() => _ProTwoAnimatorState();
}

class _ProTwoAnimatorState extends State<ProTwoAnimator> with SingleTickerProviderStateMixin {

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
      body: SafeArea(child: ProjectTwo(company: RepoData.bawp, controller: _controller,)),
    );
  }
}

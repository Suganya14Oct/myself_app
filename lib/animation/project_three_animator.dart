import 'package:flutter/material.dart';
import 'package:myself/personal_projects/project_three.dart';
import 'package:myself/model/repo_data.dart';

class ProThreeAnimator extends StatefulWidget {
  const ProThreeAnimator({super.key});

  @override
  State<ProThreeAnimator> createState() => _ProThreeAnimatorState();
}

class _ProThreeAnimatorState extends State<ProThreeAnimator> with SingleTickerProviderStateMixin {

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
      body: SafeArea(child: ProjectThree(company: RepoData.bawp, controller: _controller,)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:myself/personal_projects/personal_projects.dart';
import 'package:myself/model/repo_data.dart';

class PersonalAnimator extends StatefulWidget {
  const PersonalAnimator({super.key});

  @override
  State<PersonalAnimator> createState() => _PersonalAnimatorState();
}

class _PersonalAnimatorState extends State<PersonalAnimator> with SingleTickerProviderStateMixin {

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
      body: SafeArea(child: PersonalProjects(company: RepoData.bawp, controller: _controller,)),
    );
  }
}

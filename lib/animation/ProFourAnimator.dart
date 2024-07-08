import 'package:flutter/material.dart';
import 'package:myself/model/repo_data.dart';
import 'package:myself/personal_projects/project_four.dart';

class Profouranimator extends StatefulWidget {
  const Profouranimator({super.key});

  @override
  State<Profouranimator> createState() => _ProfouranimatorState();
}

class _ProfouranimatorState extends State<Profouranimator> with SingleTickerProviderStateMixin {

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
      body: SafeArea(child: ProjectFour(company: RepoData.bawp, controller: _controller,)),
    );
  }
}

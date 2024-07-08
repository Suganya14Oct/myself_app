import 'package:flutter/material.dart';
import 'package:myself/detailed_profile_summary/detailed_profile_summary.dart';
import 'package:myself/model/repo_data.dart';

class DetailedAnimator extends StatefulWidget {
  const DetailedAnimator({super.key});

  @override
  State<DetailedAnimator> createState() => _DetailedAnimatorState();
}

class _DetailedAnimatorState extends State<DetailedAnimator> with SingleTickerProviderStateMixin{

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
      body: SafeArea(child: DetailedProfileSummary(company: RepoData.bawp, controller: _controller,)),
    );
  }
}

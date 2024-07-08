import 'package:flutter/material.dart';
import 'package:myself/language/languages.dart';
import 'package:myself/model/repo_data.dart';

class LanguageAnimator extends StatefulWidget {
  const LanguageAnimator({super.key});

  @override
  State<LanguageAnimator> createState() => _LanguageAnimatorState();
}

class _LanguageAnimatorState extends State<LanguageAnimator> with SingleTickerProviderStateMixin {

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
      body: SafeArea(child: Languages(company: RepoData.bawp, controller: _controller,)),
    );
  }
}

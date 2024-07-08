import 'package:flutter/material.dart';
import 'package:myself/model/repo_data.dart';
import '../certificate/certificate.dart';

class CertificateAnimator extends StatefulWidget {
  const CertificateAnimator({super.key});

  @override
  State<CertificateAnimator> createState() => _CertificateAnimatorState();
}

class _CertificateAnimatorState extends State<CertificateAnimator> with SingleTickerProviderStateMixin {

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
      body: SafeArea(child: Certicate(company: RepoData.bawp, controller: _controller,)),
    );
  }
}

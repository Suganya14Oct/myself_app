
import 'package:myself/model/company.dart';
import 'package:flutter/material.dart';
import 'package:myself/animation/detailed_animator.dart';

class RepoData {
  static final Company bawp = new Company(
    name: 'Suganya M',
    about: 'Flutter Developer with 2.3 years of experience in designing, developing  and deploying user-friendly mobile Apps using Dart Language in Mobile'
      'Application Development. Seeking a mid-senior level in flutter developing excellence to excel in a challenging and innovative mobile app developer and strive to exercise my full potential.',
    backdropPhoto: 'assets/background_img.jpg',
    courses: <Course>[
      new Course(
          title: 'Detailed Profile Summary',
          thumbnail: 'assets/profile_summary.webp',
      ),
      new Course(
          title: 'Personal Projects',
          thumbnail: 'assets/personal_projects.webp',
      ),
      new Course(
          title: 'Certificate',
          thumbnail: 'assets/certificate.jpg',
          //url: 'https://www.youtube.com/watch?v=5rtujDjt50I&list=PLlxmoA0rQ-LyHW9voBdNo4gEEIh0SjG-q'
      ),
      new Course(
          title: 'Education',
          thumbnail: 'assets/education.webp',
          //url: 'https://www.youtube.com/watch?v=sfA3NWDBPZ4&list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC'
      ),
      new Course(
        title: 'Work Experience',
        thumbnail: 'assets/work_experience.jpg',
      ),
      new Course(
        title: 'Software Skills',
        thumbnail: 'assets/software_skills.jpeg',
      ),
      new Course(
        title: 'Languages',
        thumbnail: 'assets/languages.webp',
      )
    ],
    location: 'PHONE NO: +91 7845503839', logo: 'assets/photo.jpg');
}
import 'package:meta/meta.dart';

class Company {

  Company({
    @required this.name,
    @required this.location,
    @required this.logo,
    @required this.backdropPhoto,
    @required this.about,
    @required this.courses
  });

  final String? name;
  final String? location;
  final String? logo;
  final String? backdropPhoto;
  final String? about;
  final List<Course>? courses;

}

class Course {
  Course( {
    @required this.title,
    @required this.thumbnail,
  });
  final String? title;
  final String? thumbnail;
}

class Course2 {
  Course2({
   @required this.title2,
   @required this.thumbnail2,
 });
  final String? title2;
  final String? thumbnail2;
}
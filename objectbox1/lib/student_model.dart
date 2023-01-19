import 'package:objectbox/objectbox.dart';

@Entity()
class StudentModel {
  @Id()
  int id = 0;

  // @Index(type: IndexType.hash)
  // int uId=0;

  String name;
  int roll;
  bool isMale;
  List<String> subjects;

  StudentModel(
      {required this.name,
      required this.roll,
      required this.subjects,
      this.isMale = true});
}

//-----------------for two model query
@Entity()
class StudentInfo {
  @Id()
  int id = 0;

  int roll;
  String name;
  String address;

  StudentInfo({required this.roll, required this.name, this.address = 'N/A'});
}

@Entity()
class StudentResult {
  @Id()
  int id = 0;

  int roll;
  String dep;
  double cgp;

  StudentResult({required this.roll, required this.dep, this.cgp = 0.0});
}

//-----------------for model in a model query
@Entity()
class Food {
  @Id()
  int id = 0;

  String foodName;
  double price;
  bool isVeg;

  Food(this.foodName, this.price, this.isVeg);
}

@Entity()
class Order1 {
  @Id()
  int id = 0;

  String name;
  String phone;

  ToOne<Food> fav = ToOne<Food>();
  ToMany<Food> items = ToMany<Food>();

  Order1(
    this.name,
    this.phone,
  );
}

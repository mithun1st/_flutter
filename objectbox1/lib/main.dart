import 'package:flutter/material.dart';
import 'package:objectbox/internal.dart';
import 'package:objectbox/objectbox.dart';
import 'package:objectbox1/objectbox_class.dart';
import 'package:objectbox1/objectbox.g.dart';
import 'package:objectbox1/student_model.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await ObjectBox.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State createState() {
    return HomePageState();
  }
}

///---------------------------- Single Value -------------------------
///
/// (for dependencies)
/// >>flutter pub add objectbox
/// >>flutter pub add objectbox_flutter_libs
///
///
/// (for dev_dependencies)
/// >>flutter pub add --dev build_runner
/// >>flutter pub add --dev objectbox_generator
///
///
///(generate class for objectbox)
/// >>flutter pub run build_runner build
///
///
///
///
///

//------------------------------------------------------------------------HomePageState

class HomePageState extends State<HomePage> {
  late Box<StudentModel> box1 = ObjectBox.store.box<StudentModel>();

  //for two model query
  late Box<StudentInfo> boxStudentInfo = ObjectBox.store.box<StudentInfo>();
  late Box<StudentResult> boxStudentResult =
      ObjectBox.store.box<StudentResult>();

  List<StudentModel> students = [
    StudentModel(
        name: 'mr x', roll: 12, subjects: ['bangla', 'english', 'cse']),
    StudentModel(
        name: 'ms y', roll: 10, subjects: ['math', 'english'], isMale: false),
    StudentModel(
        name: 'mr z', roll: 15, subjects: ['eee', 'cse'], isMale: true),
    StudentModel(
      name: 'mr m',
      roll: 26,
      subjects: ['ieee', 'bba'],
    ),
    StudentModel(
        name: 'ms n', roll: 23, subjects: ['law', 'history'], isMale: false),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Object Box'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            ElevatedButton(
                onPressed: () async {
                  // ObjectBox.store = await openStore();
                },
                child: const Text('Store Open')),
            ElevatedButton(
                onPressed: () {
                  print(ObjectBox.store.directoryPath);
                },
                child: const Text('Store Path')),
            ElevatedButton(
                onPressed: () {
                  print(ObjectBox.store.isClosed());
                },
                child: const Text('Store Is Close ?')),
            ElevatedButton(
                onPressed: () {
                  ObjectBox.store.close();
                },
                child: const Text('Store Close')),
            Text('---------------------'),
            ElevatedButton(
                onPressed: () {
                  print('--------------------student');
                  box1.getAll().forEach((element) {
                    print(
                        '${element.id} ${element.name} ${element.roll} ${element.isMale} ${element.subjects}');
                  });
                  print('--------------------/');

                  Query<StudentModel> query =
                      box1.query(StudentModel_.isMale.equals(false)).build();
                  List<StudentModel> r = query.find();
                  // query.close();
                  r.forEach((element) {
                    print(
                        '${element.id} ${element.name} ${element.roll} ${element.isMale} ${element.subjects}');
                  });
                  print('--------------------query');

                  // query.remove();
                  // query.close();
                  r.clear();

                  query = box1
                      .query(StudentModel_.subjects.containsElement('cse'))
                      .build();
                  r = query.find();
                  query.close();
                  r.forEach((element) {
                    print(
                        '${element.id} ${element.name} ${element.roll} ${element.isMale} ${element.subjects}');
                  });
                },
                child: const Text('Query')),
            ElevatedButton(
                onPressed: () async {
                  Query<StudentModel> query = box1
                      .query((StudentModel_.name.startsWith('mr') &
                              StudentModel_.roll.notEquals(10)) |
                          StudentModel_.name.endsWith('m'))
                      .build();
                  List<StudentModel> r = query.find();
                  query.close();
                  r.forEach((element) {
                    print(
                        '${element.id} ${element.name} ${element.roll} ${element.isMale}');
                  });
                },
                child: const Text('Query and/or')),
            ElevatedButton(
                onPressed: () async {
                  Query<StudentModel> query = box1
                      .query(StudentModel_.roll.greaterThan(20) |
                          StudentModel_.roll.lessOrEqual(12))
                      .build();
                  List<StudentModel> r = query.find();
                  query.close();
                  r.forEach((element) {
                    print(
                        '${element.id} ${element.name} ${element.roll} ${element.isMale}');
                  });
                },
                child: const Text('Query numCompare')),
            ElevatedButton(
                onPressed: () async {
                  //  asc> flag:0     des> flag:1
                  Query<StudentModel> query = box1
                      .query(StudentModel_.name.notEquals('test1'))
                      .order(StudentModel_.roll, flags: Order.descending)
                      .build();
                  List<StudentModel> r = query.find();
                  query.close();
                  r.forEach((element) {
                    print(
                        '${element.id} ${element.name} ${element.roll} ${element.isMale}');
                  });
                },
                child: const Text('Query Order asc/des')),
            ElevatedButton(
                onPressed: () async {
                  print(
                      '${boxStudentInfo.isEmpty()}  ${boxStudentResult.isEmpty()}');
                  if (boxStudentInfo.isEmpty()) {
                    boxStudentInfo.putMany([
                      StudentInfo(name: 'Mithun', roll: 112, address: 'Natore'),
                      StudentInfo(name: 'Mahadi', roll: 108, address: 'Dhaka'),
                      StudentInfo(
                          name: 'Hassan', roll: 116, address: 'Rajshahi'),
                    ]);
                  }

                  if (boxStudentResult.isEmpty()) {
                    boxStudentResult.putMany([
                      StudentResult(roll: 108, dep: 'CSE', cgp: 3.62),
                      StudentResult(roll: 116, dep: 'EEE', cgp: 2.93),
                      StudentResult(roll: 112, dep: 'IEE', cgp: 3.46),
                    ]);
                  }

                  //
                  //  108 Mahadi  Dhaka CSE 3.62
                  //  112 Mithun  Notore IEE  3.46
                  //  116 Hassan  Rajshahi EEE  2.90
                  //

                  //print StudentInfo StudentResult
                  print('--------------------------');
                  boxStudentInfo.getAll().forEach((element) {
                    print(
                        '${element.name}  ${element.roll}  ${element.address}');
                  });
                  print('   +   ');
                  boxStudentResult.getAll().forEach((element) {
                    print('${element.roll}  ${element.dep}  ${element.cgp}');
                  });
                  print('--------------------------');
                  print(
                      'find DEP & RESULT (from table2) of NAME=Mithun (from table1)');
                  Query<StudentInfo> query1 = boxStudentInfo
                      .query(StudentInfo_.name.equals('Mithun'))
                      .build();
                  StudentInfo? mithunInfo = query1.findFirst();
                  query1.close();
                  Query<StudentResult> query2 = boxStudentResult
                      .query(StudentResult_.roll.equals(mithunInfo!.roll))
                      .build();
                  StudentResult? mithunResult = query2.findFirst();
                  query2.close();
                  print('${mithunResult!.dep} ${mithunResult.cgp}');
                },
                child: const Text('Two Model Query')),
            ElevatedButton(
                onPressed: () {
                  //for Relation query
                  late Box<Order1> boxOrders = ObjectBox.store.box<Order1>();
                  late Box<Food> boxFoods = ObjectBox.store.box<Food>();

                  //-------create food
                  if (boxFoods.isEmpty()) {
                    print('Food Was Empty');
                    boxFoods.putMany([
                      Food('Apple_Chocelet', 17.40, true),
                      Food('Beef_Kabab', 32.21, false),
                      Food('Chicken_Tikka', 16.24, false),
                      Food('Dom_Alu', 14.65, true),
                      Food('Egg_cake', 12.23, false),
                      Food('Doi_Fuska', 34.49, true),
                      Food('Garlic_Vorta', 10.03, true),
                    ]);
                  }
                  print('-------------------Food');
                  boxFoods.getAll().forEach((f) {
                    print(
                        '${f.id} ${f.foodName} price:${f.price} isVeg:${f.isVeg}');
                  });
                  print('-------------------/\n');

                  //-------create order
                  Order1 orderObj1 = Order1('Mahadi', '0177');
                  orderObj1.fav.targetId = boxFoods
                      .query(Food_.foodName.equals('Beef_Kabab'))
                      .build()
                      .findFirst()!
                      .id;
                  orderObj1.items.addAll([
                    boxFoods.getAll()[0],
                    boxFoods.getAll()[1],
                    boxFoods.getAll()[3],
                  ]);

                  Order1 orderObj2 = Order1('Hassan', '0178');
                  orderObj2.fav.target = boxFoods.getAll()[0];
                  orderObj2.items.addAll([
                    boxFoods.getAll()[2],
                    boxFoods.getAll()[4],
                    boxFoods.getAll()[5],
                  ]);

                  Order1 orderObj3 = Order1('Mithun', '0179');
                  orderObj3.fav.target = Food('MOMO', 32.14, false);
                  orderObj3.items.addAll([
                    boxFoods.getAll()[6],
                    boxFoods.getAll()[1],
                  ]);
                  Order1 orderObj4 = Order1('MrX', '0173');
                  orderObj4.fav.target = boxFoods.getAll()[0];
                  orderObj4.items.addAll([
                    boxFoods.getAll()[0],
                    boxFoods.getAll()[1],
                  ]);

                  if (boxOrders.isEmpty()) {
                    print('Order Was Empty !');
                    boxOrders.put(orderObj1);
                    boxOrders.put(orderObj2);
                    boxOrders.putMany([orderObj3, orderObj4]);
                  }

                  print('-------------------Order');
                  boxOrders.getAll().forEach((o) {
                    print(
                        '${o.name} ${o.phone} (${o.fav.target?.foodName}:${o.fav.target?.price})');
                    o.items.forEach((f) {
                      print('\t\t${f.foodName}=${f.price} isVeg:${f.isVeg}');
                    });
                  });
                  print('-------------------/\n');

                  print(
                      '-------------------Query1(find order by favfood- apple)');
                  //make query builder
                  QueryBuilder<Order1> queryBuilder1 = boxOrders.query();
                  queryBuilder1.link(
                      Order1_.fav, Food_.foodName.equals('Apple_Chocelet'));

                  // to query
                  Query<Order1> query1 = queryBuilder1.build();

                  query1.find().forEach((o) {
                    print(
                        '${o.name} ${o.phone} (${o.fav.target?.foodName}:${o.fav.target?.price})');
                    o.items.forEach((f) {
                      print('\t\t${f.foodName}=${f.price} isVeg:${f.isVeg}');
                    });
                  });
                  query1.close();

                  print(
                      '-------------------Query2(find order by fooditems- beef and !mrx)');
                  //make query builder
                  QueryBuilder<Order1> queryBuilder2 =
                      boxOrders.query(Order1_.name.notEquals('MrX'));
                  queryBuilder2.linkMany(
                      Order1_.items, Food_.foodName.equals('Beef_Kabab'));

                  // to query
                  Query<Order1> query2 = queryBuilder2.build();

                  query2.find().forEach((o) {
                    print(
                        '${o.name} ${o.phone} (${o.fav.target?.foodName}:${o.fav.target?.price})');
                    o.items.forEach((f) {
                      print('\t\t${f.foodName}=${f.price} isVeg:${f.isVeg}');
                    });
                  });
                  query2.close();

                  print('-------------------/\n');
                  boxOrders.removeAll();
                  boxFoods.removeAll();
                },
                child: Text('Model In Model')),
            ElevatedButton(
                onPressed: () {
                  late Box<ChildModel> childBox =
                      ObjectBox.store.box<ChildModel>();
                  late Box<TeacherModel> teacherBox =
                      ObjectBox.store.box<TeacherModel>();

                  childBox.removeAll();
                  teacherBox.removeAll();

                  //create object
                  if (teacherBox.isEmpty()) {
                    print('Teacher Was Empty');

                    teacherBox.putMany([
                      TeacherModel('A', 36),
                      TeacherModel('B', 27),
                    ]);
                  }

                  if (childBox.isEmpty()) {
                    print('Child Was Empty');
                    childBox.putMany([
                      ChildModel('a1', 4),
                      ChildModel('a2', 6),
                      ChildModel('a3', 2),
                      ChildModel('b1', 9),
                      ChildModel('b2', 6),
                    ]);
                  }

                  //assign child
                  TeacherModel ta = teacherBox.getAll()[0];
                  ta.childs.addAll([
                    childBox.getAll()[0],
                    childBox.getAll()[1],
                    childBox.getAll()[2],
                  ]);
                  teacherBox.put(ta, mode: PutMode.update);

                  TeacherModel tb = teacherBox.getAll()[1];
                  tb.childs.addAll([
                    childBox.getAll()[3],
                    childBox.getAll()[4],
                  ]);
                  teacherBox.put(tb, mode: PutMode.update);

                  print('-------------------Child');
                  childBox.getAll().forEach((element) {
                    print(
                        '${element.name} ${element.classLevel} (${element.teacher.target?.teacherName}- ${element.teacher.target?.teacherAge})');
                  });

                  print('-------------------Teacher');
                  teacherBox.getAll().forEach((element) {
                    print('${element.teacherName} ${element.teacherAge}');
                    element.childs.forEach((e) {
                      print('\t${e.name} ${e.classLevel}');
                    });
                  });
                },
                child: Text('One To Many')),
            ElevatedButton(
                onPressed: () {
                  Box<TaskModel> taskBox = ObjectBox.store.box<TaskModel>();
                  Box<OwnerModel> ownerBox = ObjectBox.store.box<OwnerModel>();
                  taskBox.removeAll();
                  ownerBox.removeAll();

                  //create obj
                  if (ownerBox.isEmpty()) {
                    print('Owner Was Empty');
                    ownerBox.putMany([
                      OwnerModel('A Owner'),
                      OwnerModel('B Owner'),
                    ]);
                  }
                  if (taskBox.isEmpty()) {
                    print('Task Was Empty');
                    taskBox.putMany([
                      TaskModel('t-a1', true),
                      TaskModel('t-a2', false),
                      TaskModel('t-b3', false),
                      TaskModel('t-b4', false),
                      TaskModel('t-b5', true),
                      TaskModel('t-xx', false),
                    ]);
                  }

                  //add model
                  OwnerModel aw = ownerBox.getAll()[0];
                  aw.tasks.addAll([
                    taskBox.getAll()[0],
                    taskBox.getAll()[1],
                  ]);
                  ownerBox.put(aw, mode: PutMode.update);

                  OwnerModel bw = ownerBox.getAll()[1];
                  bw.tasks.addAll([
                    taskBox.getAll()[2],
                    taskBox.getAll()[3],
                    taskBox.getAll()[4],
                  ]);
                  ownerBox.put(bw, mode: PutMode.update);

                  TaskModel t = taskBox.getAll()[5];
                  t.owners.addAll(ownerBox.getAll());
                  taskBox.put(t, mode: PutMode.update);

                  //print
                  print('-------------------Task');
                  taskBox.getAll().forEach((element) {
                    print(
                        '${element.title} ${element.isDone} (${element.owners.length})');
                    element.owners.forEach((e) {
                      print('\t${e.name}');
                    });
                  });

                  print('-------------------Owner');
                  ownerBox.getAll().forEach((element) {
                    print('${element.name} (${element.tasks.length})');
                    element.tasks.forEach((e) {
                      print('\t${e.title} ${e.isDone}');
                    });
                  });
                },
                child: Text('Many to Many')),
          ]),
          //-------------------------------------------------- separate column
          Column(children: [
            ElevatedButton(
                onPressed: () {
                  box1.put(students[0], mode: PutMode.put);
                },
                child: const Text('Create list[0]')),
            ElevatedButton(
                onPressed: () {
                  box1.put(
                      StudentModel(
                          name: 'test1',
                          roll: 18,
                          subjects: ['s1', 's2', 's3', 's4'],
                          isMale: false),
                      mode: PutMode.put);
                },
                child: const Text('Create Manual')),
            ElevatedButton(
                onPressed: () {
                  box1.putMany(students);
                },
                child: const Text('Create All')),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(box1.getAll().length.toString())));
                  print('${box1.getAll().length} ' + box1.isEmpty().toString());
                  print(box1.get(1)?.name ?? 'no data by that id 1');
                  print('----------');
                  box1.getAll().forEach((element) {
                    print(
                        '${element.id} ${element.name} ${element.roll} ${element.isMale}');
                  });
                  print('----------/');
                },
                child: const Text('Read')),
            ElevatedButton(
                onPressed: () {
                  openStore().then((s) {
                    s.box<StudentModel>().getAll().forEach((element) {
                      print(
                          '${element.id} ${element.name} ${element.roll} ${element.isMale}');
                    });
                    s.close();
                  });
                },
                child: const Text('Read (Own store)')),
            ElevatedButton(
                onPressed: () async {
                  students[0].name = 'MR. XX';

                  box1.put(students[0], mode: PutMode.update);
                },
                child: const Text('Update')),
            ElevatedButton(
                onPressed: () async {
                  box1.remove(1);
                },
                child: const Text('Delete first 1')),
            ElevatedButton(
                onPressed: () async {
                  box1.removeAll();
                },
                child: const Text('Delete All')),
          ]),
        ],
      ),
    );
  }
}

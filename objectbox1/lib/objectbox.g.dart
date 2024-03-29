// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'student_model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 3554173747845164126),
      name: 'ChildModel',
      lastPropertyId: const IdUid(4, 8887764133800817253),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 4210755780628779397),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 7323371772317522954),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 3760149552534380406),
            name: 'classLevel',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 8887764133800817253),
            name: 'teacherId',
            type: 11,
            flags: 520,
            indexId: const IdUid(1, 416631290197887472),
            relationTarget: 'TeacherModel')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 4484210308011127119),
      name: 'Food',
      lastPropertyId: const IdUid(4, 4674993207355629552),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6298641759245116908),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5797641338214891803),
            name: 'foodName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 2871618745485655291),
            name: 'price',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 4674993207355629552),
            name: 'isVeg',
            type: 1,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 7031218630578448421),
      name: 'Order1',
      lastPropertyId: const IdUid(4, 2057048446036455476),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6661681746083642813),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5237904433857167498),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 8213285427792080291),
            name: 'phone',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 2057048446036455476),
            name: 'favId',
            type: 11,
            flags: 520,
            indexId: const IdUid(2, 7625625109931670499),
            relationTarget: 'Food')
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(1, 7669924631579525581),
            name: 'items',
            targetId: const IdUid(2, 4484210308011127119))
      ],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(4, 8773164261634187673),
      name: 'OwnerModel',
      lastPropertyId: const IdUid(2, 7005982510861975200),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3756705813878182376),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 7005982510861975200),
            name: 'name',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(2, 4346254738685398120),
            name: 'tasks',
            targetId: const IdUid(8, 6106509827133074994))
      ],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(5, 1282869633695929703),
      name: 'StudentInfo',
      lastPropertyId: const IdUid(4, 2579889082485398481),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 1330122103499132067),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 7927690090570799654),
            name: 'roll',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 5309040254306105925),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 2579889082485398481),
            name: 'address',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(6, 3774928798448233627),
      name: 'StudentModel',
      lastPropertyId: const IdUid(5, 9075973444986468982),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 651059771641347673),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 8347986072934179008),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 5733092493747229462),
            name: 'roll',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 8640191348395691538),
            name: 'isMale',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 9075973444986468982),
            name: 'subjects',
            type: 30,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(7, 1038291236013569792),
      name: 'StudentResult',
      lastPropertyId: const IdUid(4, 4958003274139392630),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 1246021876616525093),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3939912379333369087),
            name: 'roll',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 7919905281036240536),
            name: 'dep',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 4958003274139392630),
            name: 'cgp',
            type: 8,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(8, 6106509827133074994),
      name: 'TaskModel',
      lastPropertyId: const IdUid(3, 8440538617193097665),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 314243196962721702),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 7469387068594344439),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 8440538617193097665),
            name: 'isDone',
            type: 1,
            flags: 0)
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(3, 4879855383663445810),
            name: 'owners',
            targetId: const IdUid(4, 8773164261634187673))
      ],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(9, 6882503428573233220),
      name: 'TeacherModel',
      lastPropertyId: const IdUid(3, 8824419960398607046),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 9218774698083447528),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3628210512372949959),
            name: 'teacherName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 8824419960398607046),
            name: 'teacherAge',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(4, 6605582109715006768),
            name: 'childs',
            targetId: const IdUid(1, 3554173747845164126))
      ],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(9, 6882503428573233220),
      lastIndexId: const IdUid(2, 7625625109931670499),
      lastRelationId: const IdUid(4, 6605582109715006768),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    ChildModel: EntityDefinition<ChildModel>(
        model: _entities[0],
        toOneRelations: (ChildModel object) => [object.teacher],
        toManyRelations: (ChildModel object) => {},
        getId: (ChildModel object) => object.id,
        setId: (ChildModel object, int id) {
          object.id = id;
        },
        objectToFB: (ChildModel object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addInt64(2, object.classLevel);
          fbb.addInt64(3, object.teacher.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = ChildModel(
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          object.teacher.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0);
          object.teacher.attach(store);
          return object;
        }),
    Food: EntityDefinition<Food>(
        model: _entities[1],
        toOneRelations: (Food object) => [],
        toManyRelations: (Food object) => {},
        getId: (Food object) => object.id,
        setId: (Food object, int id) {
          object.id = id;
        },
        objectToFB: (Food object, fb.Builder fbb) {
          final foodNameOffset = fbb.writeString(object.foodName);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, foodNameOffset);
          fbb.addFloat64(2, object.price);
          fbb.addBool(3, object.isVeg);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Food(
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              const fb.Float64Reader().vTableGet(buffer, rootOffset, 8, 0),
              const fb.BoolReader().vTableGet(buffer, rootOffset, 10, false))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        }),
    Order1: EntityDefinition<Order1>(
        model: _entities[2],
        toOneRelations: (Order1 object) => [object.fav],
        toManyRelations: (Order1 object) =>
            {RelInfo<Order1>.toMany(1, object.id): object.items},
        getId: (Order1 object) => object.id,
        setId: (Order1 object, int id) {
          object.id = id;
        },
        objectToFB: (Order1 object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final phoneOffset = fbb.writeString(object.phone);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, phoneOffset);
          fbb.addInt64(3, object.fav.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Order1(
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          object.fav.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0);
          object.fav.attach(store);
          InternalToManyAccess.setRelInfo(object.items, store,
              RelInfo<Order1>.toMany(1, object.id), store.box<Order1>());
          return object;
        }),
    OwnerModel: EntityDefinition<OwnerModel>(
        model: _entities[3],
        toOneRelations: (OwnerModel object) => [],
        toManyRelations: (OwnerModel object) =>
            {RelInfo<OwnerModel>.toMany(2, object.id): object.tasks},
        getId: (OwnerModel object) => object.id,
        setId: (OwnerModel object, int id) {
          object.id = id;
        },
        objectToFB: (OwnerModel object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = OwnerModel(
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          InternalToManyAccess.setRelInfo(
              object.tasks,
              store,
              RelInfo<OwnerModel>.toMany(2, object.id),
              store.box<OwnerModel>());
          return object;
        }),
    StudentInfo: EntityDefinition<StudentInfo>(
        model: _entities[4],
        toOneRelations: (StudentInfo object) => [],
        toManyRelations: (StudentInfo object) => {},
        getId: (StudentInfo object) => object.id,
        setId: (StudentInfo object, int id) {
          object.id = id;
        },
        objectToFB: (StudentInfo object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final addressOffset = fbb.writeString(object.address);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.roll);
          fbb.addOffset(2, nameOffset);
          fbb.addOffset(3, addressOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = StudentInfo(
              roll: const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0),
              name: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              address: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, ''))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        }),
    StudentModel: EntityDefinition<StudentModel>(
        model: _entities[5],
        toOneRelations: (StudentModel object) => [],
        toManyRelations: (StudentModel object) => {},
        getId: (StudentModel object) => object.id,
        setId: (StudentModel object, int id) {
          object.id = id;
        },
        objectToFB: (StudentModel object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final subjectsOffset = fbb.writeList(
              object.subjects.map(fbb.writeString).toList(growable: false));
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addInt64(2, object.roll);
          fbb.addBool(3, object.isMale);
          fbb.addOffset(4, subjectsOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = StudentModel(
              name: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              roll: const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0),
              subjects: const fb.ListReader<String>(
                      fb.StringReader(asciiOptimization: true),
                      lazy: false)
                  .vTableGet(buffer, rootOffset, 12, []),
              isMale: const fb.BoolReader()
                  .vTableGet(buffer, rootOffset, 10, false))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        }),
    StudentResult: EntityDefinition<StudentResult>(
        model: _entities[6],
        toOneRelations: (StudentResult object) => [],
        toManyRelations: (StudentResult object) => {},
        getId: (StudentResult object) => object.id,
        setId: (StudentResult object, int id) {
          object.id = id;
        },
        objectToFB: (StudentResult object, fb.Builder fbb) {
          final depOffset = fbb.writeString(object.dep);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.roll);
          fbb.addOffset(2, depOffset);
          fbb.addFloat64(3, object.cgp);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = StudentResult(
              roll: const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0),
              dep: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              cgp:
                  const fb.Float64Reader().vTableGet(buffer, rootOffset, 10, 0))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        }),
    TaskModel: EntityDefinition<TaskModel>(
        model: _entities[7],
        toOneRelations: (TaskModel object) => [],
        toManyRelations: (TaskModel object) =>
            {RelInfo<TaskModel>.toMany(3, object.id): object.owners},
        getId: (TaskModel object) => object.id,
        setId: (TaskModel object, int id) {
          object.id = id;
        },
        objectToFB: (TaskModel object, fb.Builder fbb) {
          final titleOffset = fbb.writeString(object.title);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, titleOffset);
          fbb.addBool(2, object.isDone);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = TaskModel(
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              const fb.BoolReader().vTableGet(buffer, rootOffset, 8, false))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          InternalToManyAccess.setRelInfo(object.owners, store,
              RelInfo<TaskModel>.toMany(3, object.id), store.box<TaskModel>());
          return object;
        }),
    TeacherModel: EntityDefinition<TeacherModel>(
        model: _entities[8],
        toOneRelations: (TeacherModel object) => [],
        toManyRelations: (TeacherModel object) =>
            {RelInfo<TeacherModel>.toMany(4, object.id): object.childs},
        getId: (TeacherModel object) => object.id,
        setId: (TeacherModel object, int id) {
          object.id = id;
        },
        objectToFB: (TeacherModel object, fb.Builder fbb) {
          final teacherNameOffset = fbb.writeString(object.teacherName);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, teacherNameOffset);
          fbb.addInt64(2, object.teacherAge);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = TeacherModel(
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          InternalToManyAccess.setRelInfo(
              object.childs,
              store,
              RelInfo<TeacherModel>.toMany(4, object.id),
              store.box<TeacherModel>());
          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [ChildModel] entity fields to define ObjectBox queries.
class ChildModel_ {
  /// see [ChildModel.id]
  static final id =
      QueryIntegerProperty<ChildModel>(_entities[0].properties[0]);

  /// see [ChildModel.name]
  static final name =
      QueryStringProperty<ChildModel>(_entities[0].properties[1]);

  /// see [ChildModel.classLevel]
  static final classLevel =
      QueryIntegerProperty<ChildModel>(_entities[0].properties[2]);

  /// see [ChildModel.teacher]
  static final teacher =
      QueryRelationToOne<ChildModel, TeacherModel>(_entities[0].properties[3]);
}

/// [Food] entity fields to define ObjectBox queries.
class Food_ {
  /// see [Food.id]
  static final id = QueryIntegerProperty<Food>(_entities[1].properties[0]);

  /// see [Food.foodName]
  static final foodName = QueryStringProperty<Food>(_entities[1].properties[1]);

  /// see [Food.price]
  static final price = QueryDoubleProperty<Food>(_entities[1].properties[2]);

  /// see [Food.isVeg]
  static final isVeg = QueryBooleanProperty<Food>(_entities[1].properties[3]);
}

/// [Order1] entity fields to define ObjectBox queries.
class Order1_ {
  /// see [Order1.id]
  static final id = QueryIntegerProperty<Order1>(_entities[2].properties[0]);

  /// see [Order1.name]
  static final name = QueryStringProperty<Order1>(_entities[2].properties[1]);

  /// see [Order1.phone]
  static final phone = QueryStringProperty<Order1>(_entities[2].properties[2]);

  /// see [Order1.fav]
  static final fav =
      QueryRelationToOne<Order1, Food>(_entities[2].properties[3]);

  /// see [Order1.items]
  static final items =
      QueryRelationToMany<Order1, Food>(_entities[2].relations[0]);
}

/// [OwnerModel] entity fields to define ObjectBox queries.
class OwnerModel_ {
  /// see [OwnerModel.id]
  static final id =
      QueryIntegerProperty<OwnerModel>(_entities[3].properties[0]);

  /// see [OwnerModel.name]
  static final name =
      QueryStringProperty<OwnerModel>(_entities[3].properties[1]);

  /// see [OwnerModel.tasks]
  static final tasks =
      QueryRelationToMany<OwnerModel, TaskModel>(_entities[3].relations[0]);
}

/// [StudentInfo] entity fields to define ObjectBox queries.
class StudentInfo_ {
  /// see [StudentInfo.id]
  static final id =
      QueryIntegerProperty<StudentInfo>(_entities[4].properties[0]);

  /// see [StudentInfo.roll]
  static final roll =
      QueryIntegerProperty<StudentInfo>(_entities[4].properties[1]);

  /// see [StudentInfo.name]
  static final name =
      QueryStringProperty<StudentInfo>(_entities[4].properties[2]);

  /// see [StudentInfo.address]
  static final address =
      QueryStringProperty<StudentInfo>(_entities[4].properties[3]);
}

/// [StudentModel] entity fields to define ObjectBox queries.
class StudentModel_ {
  /// see [StudentModel.id]
  static final id =
      QueryIntegerProperty<StudentModel>(_entities[5].properties[0]);

  /// see [StudentModel.name]
  static final name =
      QueryStringProperty<StudentModel>(_entities[5].properties[1]);

  /// see [StudentModel.roll]
  static final roll =
      QueryIntegerProperty<StudentModel>(_entities[5].properties[2]);

  /// see [StudentModel.isMale]
  static final isMale =
      QueryBooleanProperty<StudentModel>(_entities[5].properties[3]);

  /// see [StudentModel.subjects]
  static final subjects =
      QueryStringVectorProperty<StudentModel>(_entities[5].properties[4]);
}

/// [StudentResult] entity fields to define ObjectBox queries.
class StudentResult_ {
  /// see [StudentResult.id]
  static final id =
      QueryIntegerProperty<StudentResult>(_entities[6].properties[0]);

  /// see [StudentResult.roll]
  static final roll =
      QueryIntegerProperty<StudentResult>(_entities[6].properties[1]);

  /// see [StudentResult.dep]
  static final dep =
      QueryStringProperty<StudentResult>(_entities[6].properties[2]);

  /// see [StudentResult.cgp]
  static final cgp =
      QueryDoubleProperty<StudentResult>(_entities[6].properties[3]);
}

/// [TaskModel] entity fields to define ObjectBox queries.
class TaskModel_ {
  /// see [TaskModel.id]
  static final id = QueryIntegerProperty<TaskModel>(_entities[7].properties[0]);

  /// see [TaskModel.title]
  static final title =
      QueryStringProperty<TaskModel>(_entities[7].properties[1]);

  /// see [TaskModel.isDone]
  static final isDone =
      QueryBooleanProperty<TaskModel>(_entities[7].properties[2]);

  /// see [TaskModel.owners]
  static final owners =
      QueryRelationToMany<TaskModel, OwnerModel>(_entities[7].relations[0]);
}

/// [TeacherModel] entity fields to define ObjectBox queries.
class TeacherModel_ {
  /// see [TeacherModel.id]
  static final id =
      QueryIntegerProperty<TeacherModel>(_entities[8].properties[0]);

  /// see [TeacherModel.teacherName]
  static final teacherName =
      QueryStringProperty<TeacherModel>(_entities[8].properties[1]);

  /// see [TeacherModel.teacherAge]
  static final teacherAge =
      QueryIntegerProperty<TeacherModel>(_entities[8].properties[2]);

  /// see [TeacherModel.childs]
  static final childs =
      QueryRelationToMany<TeacherModel, ChildModel>(_entities[8].relations[0]);
}

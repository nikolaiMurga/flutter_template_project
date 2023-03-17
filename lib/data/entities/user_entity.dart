import 'package:equatable/equatable.dart';
import 'package:flutter_template_project/data/db/persistence_helper.dart';
import 'package:hive/hive.dart';

part 'user_entity.g.dart';

@HiveType(typeId: HiveTypeIds.user)
class UserEntity extends Equatable {
  @HiveField(0)
  final int numberOfClicks;

  const UserEntity({
    required this.numberOfClicks,
  });

  @override
  List<Object?> get props => [
        numberOfClicks,
      ];
}

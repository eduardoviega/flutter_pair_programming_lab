import 'package:equatable/equatable.dart';
import 'package:flutter_pair_programming_lab/action/domain/entities/action_entity.dart';
import 'package:flutter_pair_programming_lab/action/domain/entities/action_enums.dart';

class ActionModel extends Equatable {
  final String id;
  final String title;
  final String description;
  final ActionTypeEnum type;
  final ActionStatusEnum status;

  const ActionModel({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.status,
  });

  ActionModel copyWith({
    String? id,
    String? title,
    String? description,
    ActionTypeEnum? type,
    ActionStatusEnum? status,
  }) {
    return ActionModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
      status: status ?? this.status,
    );
  }

  ActionEntity toEntity() {
    return ActionEntity(
      id: id,
      title: title,
      description: description,
      type: type,
      status: status,
    );
  }

  static List<ActionEntity> toEntityList(List<ActionModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'type': type.name,
      'status': status.name,
    };
  }

  factory ActionModel.fromJson(Map<String, dynamic> map) {
    return ActionModel(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      type: ActionTypeEnum.fromString(map['type'] as String),
      status: ActionStatusEnum.fromString(map['status'] as String),
    );
  }

  @override
  List<Object> get props {
    return [id, title, description, type, status];
  }
}

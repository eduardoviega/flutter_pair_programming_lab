import 'package:equatable/equatable.dart';
import 'package:flutter_pair_programming_lab/action/domain/entities/action_enums.dart';

class ActionEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final ActionTypeEnum type;
  final ActionStatusEnum status;

  const ActionEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.status,
  });

  @override
  List<Object?> get props => [id, title, description, type, status];
}
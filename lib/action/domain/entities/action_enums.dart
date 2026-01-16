import 'package:flutter_pair_programming_lab/extension/list_extension.dart';

enum ActionStatusEnum {
  pending,
  done;

  static ActionStatusEnum fromString(String value) {
    return ActionStatusEnum.values.firstWhereOrNull((e) => e.name == value) ??
        ActionStatusEnum.pending;
  }
}

enum ActionTypeEnum {
  shareLink,
  postStatus,
  postSocial,
  unknown;

  static ActionTypeEnum fromString(String value) {
    return ActionTypeEnum.values.firstWhereOrNull((e) => e.name == value) ??
        ActionTypeEnum.unknown;
  }
}

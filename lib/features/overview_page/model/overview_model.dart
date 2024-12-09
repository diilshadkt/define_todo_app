import 'package:freezed_annotation/freezed_annotation.dart';

part 'overview_model.freezed.dart';
part 'overview_model.g.dart';

@freezed
class OverviewModel with _$OverviewModel {
  factory OverviewModel(
      {required String id,
      required String task,
      @Default(false) bool isClicked,
      DateTime? createdAt}) = _OverviewModel;

  factory OverviewModel.fromJson(Map<String, dynamic> json) =>
      _$OverviewModelFromJson(json);
}

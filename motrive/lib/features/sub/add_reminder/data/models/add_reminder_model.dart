import 'package:motrive/features/sub/add_reminder/domain/entities/add_reminder_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_reminder_model.freezed.dart';
part 'add_reminder_model.g.dart';

@freezed
abstract class AddReminderModel with _$AddReminderModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: .snake)
  const factory AddReminderModel({
    required String title,
    required String category,
    required String triggerType,
    String? notes,
    DateTime? triggerDate,
    int? triggerOdometer,
    int? odometerAdvanceKm,
    int? dateAdvanceDays,
    required bool isRecurring,
    String? recurrenceUnit,
    int? recurrenceValue,
  }) = _AddReminderModel;

  factory AddReminderModel.fromJson(Map<String, Object?> json) =>
      _$AddReminderModelFromJson(json);
}

extension AddReminderModelMapper on AddReminderModel {
  AddReminderEntity toEntity() {
    return AddReminderEntity(
      title: title,
      category: category,
      triggerType: triggerType,
      isRecurring: isRecurring,
      dateAdvanceDays: dateAdvanceDays,
      odometerAdvanceKm: odometerAdvanceKm,
      recurrenceUnit: recurrenceUnit,
      recurrenceValue: recurrenceValue,
      triggerDate: triggerDate,
      triggerOdometer: triggerOdometer,
      notes: notes
    );
  }
}

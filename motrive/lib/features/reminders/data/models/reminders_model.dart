import 'package:motrive/features/reminders/domain/entities/reminders_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'reminders_model.freezed.dart';
part 'reminders_model.g.dart';

@freezed
abstract class RemindersModel with _$RemindersModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: .snake)
  const factory RemindersModel({
    required String id,
    required String userId,
    required String vehicleId,
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
    required bool isActive,
    required bool isDismissed,
    DateTime? dismissedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _RemindersModel;

  factory RemindersModel.fromJson(Map<String, Object?> json) =>
      _$RemindersModelFromJson(json);
}

extension RemindersModelMapper on RemindersModel {
  RemindersEntity toEntity() {
    return RemindersEntity(
      id: id,
      userId: userId,
      vehicleId: vehicleId,
      title: title,
      category: category,
      triggerType: triggerType,
      isRecurring: isRecurring,
      isActive: isActive,
      isDismissed: isDismissed,
      dateAdvanceDays: dateAdvanceDays,
      odometerAdvanceKm: odometerAdvanceKm,
      recurrenceUnit: recurrenceUnit,
      recurrenceValue: recurrenceValue,
      triggerDate: triggerDate,
      triggerOdometer: triggerOdometer,
      createdAt: createdAt,
      dismissedAt: dismissedAt,
      updatedAt: updatedAt,
      notes: notes

    );
  }
}

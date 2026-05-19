/// Hive storage key references for SafeCarHer local cache.
/// One abstract class per database table — use these constants everywhere
/// instead of raw strings to avoid typos and make refactoring safe.
library;

// ════════════════════════════════════════════════════════════════
// BOX NAMES  — one Hive box per table
// ════════════════════════════════════════════════════════════════

abstract class HiveBoxes {
  HiveBoxes._();

  static const String vehicles = 'vehicles';
  static const String userSettings = 'user_settings';
  static const String maintenanceLogs = 'maintenance_logs';
  static const String servicesInfo = 'services_info';
  static const String servicePartsInfo = 'service_parts_info';
  static const String parking = 'parking';
  static const String profile = 'parking';
  static const String auth = 'auth';
  static const theme = 'theme';
static const language = 'language';
}

// ════════════════════════════════════════════════════════════════
// vehicles
// ════════════════════════════════════════════════════════════════

abstract class VehicleKeys {
  VehicleKeys._();

  static const String id = 'id';
  static const String userId = 'user_id';
  static const String make = 'make';
  static const String model = 'model';
  static const String year = 'year';
  static const String color = 'color';
  static const String licensePlate = 'license_plate';
  static const String vin = 'vin';
  static const String currentOdometer = 'current_odometer';
  static const String createdAt = 'created_at';
  static const String carInfoId = 'car_info_id';
  static const String odometerAtRegistered = 'odometer_at_registered';
}

// ════════════════════════════════════════════════════════════════
// user_settings
// ════════════════════════════════════════════════════════════════

abstract class UserSettingsKeys {
  UserSettingsKeys._();

  static const String id = 'id';
  static const String userId = 'user_id';
  static const String preferredTheme = 'preferred_theme';
  static const String preferredLang = 'preferred_lang';
  static const String updatedAt = 'updated_at';

  // ── Default values (mirrors Supabase column defaults) ──────────
  static const String defaultTheme = 'system_theme';
  static const String defaultLang = 'ar';
}

// ════════════════════════════════════════════════════════════════
// maintenance_logs
// ════════════════════════════════════════════════════════════════

abstract class MaintenanceLogKeys {
  MaintenanceLogKeys._();

  static const String id = 'id';
  static const String vehicleId = 'vehicle_id';
  static const String serviceId = 'service_id';
  static const String serviceType = 'service_type';
  static const String odometerAtService = 'odometer_at_service';
  static const String cost = 'cost';
  static const String providerName = 'provider_name';
  static const String notes = 'notes';
  static const String serviceDate = 'service_date';
  static const String userId = 'user_id';
}

// ════════════════════════════════════════════════════════════════
// services_info
// ════════════════════════════════════════════════════════════════

abstract class ServiceInfoKeys {
  ServiceInfoKeys._();

  static const String id = 'id';
  static const String carId = 'car_id';
  static const String serviceOdometer = 'service_odometer';
  static const String dateIntervalMonths = 'date_interval_months';
  static const String severity = 'severity';
  static const String recommendation = 'recommendation';
  static const String createdAt = 'created_at';

  // ── Severity enum values ────────────────────────────────────────
  static const String severityCritical = 'critical';
  static const String severityRoutine = 'routine';
  static const String severityConditional = 'conditional';
}

// ════════════════════════════════════════════════════════════════
// service_parts_info
// ════════════════════════════════════════════════════════════════

abstract class ServicePartKeys {
  ServicePartKeys._();

  static const String id = 'id';
  static const String serviceId = 'service_id';
  static const String partName = 'part_name';
  static const String oemPartNumber = 'oem_part_number';
  static const String action = 'action';
  static const String specification = 'specification';
  static const String quantity = 'quantity';
  static const String quantityUnit = 'quantity_unit';
  static const String createdAt = 'created_at';

  // ── Action enum values ──────────────────────────────────────────
  static const String actionReplace = 'replace';
  static const String actionInspect = 'inspect';
  static const String actionRefill = 'refill';
  static const String actionClean = 'clean';
  static const String actionAdjust = 'adjust';
  static const String actionLubricate = 'lubricate';

  // ── Quantity unit values ────────────────────────────────────────
  static const String unitLitre = 'L';
  static const String unitMl = 'ml';
  static const String unitGram = 'g';
  static const String unitKg = 'kg';
  static const String unitItem = 'item';
}

// ════════════════════════════════════════════════════════════════
// META KEYS  — app-level Hive entries (not tied to a table)
// ════════════════════════════════════════════════════════════════

abstract class HiveMeta {
  HiveMeta._();

  /// Box name for app-level meta values
  static const String box = 'app_meta';

  static const String lastSyncedAt = 'last_synced_at';
  static const String cachedUserId = 'cached_user_id';
  static const String activeVehicleId = 'active_vehicle_id';
  static const String onboardingComplete = 'onboarding_complete';
  static const String appVersion = 'app_version';
}

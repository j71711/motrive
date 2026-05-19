class MaintenanceNormalizer {
  /// ----------------------------
  /// DEFAULT SAFE VALUES
  /// ----------------------------

  static String safeText(dynamic value) {
    if (value == null ||
        value.toString().trim().isEmpty ||
        value.toString().toLowerCase() == 'null') {
      return 'no data';
    }

    return value.toString();
  }

  static num safeNumber(dynamic value) {
    if (value == null) return 0;

    if (value is num) return value;

    return num.tryParse(value.toString()) ?? 0;
  }

  /// ----------------------------
  /// DEFAULT ROUTINE PARTS
  /// ----------------------------

  static List<Map<String, dynamic>> defaultRoutineParts() {
    return [
      {
        "part_name": "Engine Oil",
        "oem_part_number": "no data",
        "action": "replace",
        "specification": "no data",
        "quantity": 0,
        "quantity_unit": "no data",
      },
      {
        "part_name": "Engine Oil Filter",
        "oem_part_number": "no data",
        "action": "replace",
        "specification": "no data",
        "quantity": 0,
        "quantity_unit": "no data",
      },
    ];
  }

  /// ----------------------------
  /// NORMALIZE WHOLE JSON
  /// ----------------------------

  static Map<String, dynamic> normalizeCarData(Map<String, dynamic> data) {
    print('1');
    final carInfo = data['car_info'] ?? {};

    final interval = safeNumber(
      carInfo['maintenance_odometer_interval'] ??
          carInfo['maintenance_odometer_interva'],
    ).toInt();
    print('2');

    List services = List.from(data['services'] ?? []);

    print('3');

    print('Ensured data, start normalizing');

    /// Normalize all existing services
    services = services.map((service) {
      final parts = List.from(service['parts'] ?? []);

      return {
        "service_odometer": safeNumber(service['service_odometer']).toInt(),

        "date_interval_months": safeNumber(
          service['date_interval_months'],
        ).toInt(),

        "severity": safeText(service['severity']),

        "recommendation": safeText(service['recommendation']),

        "parts": parts.map((part) {
          return {
            "part_name": safeText(part['part_name']),
            "oem_part_number": safeText(part['oem_part_number']),
            "action": safeText(part['action']),
            "specification": safeText(part['specification']),
            "quantity": safeNumber(part['quantity']),
            "quantity_unit": safeText(part['quantity_unit']),
          };
        }).toList(),
      };
    }).toList();

    print('Normalize all existing services');

    /// ----------------------------
    /// ENSURE ALL INTERVAL SERVICES EXIST
    /// ----------------------------

    final Map<String, dynamic> defaultService = services.firstWhere(
      (element) => element['service_odometer'] == interval,
    );
    
    final existingOdometers = services
        .map((e) => e['service_odometer'] as int)
        .toSet();

    final maxOdometer = existingOdometers.isEmpty
        ? interval
        : existingOdometers.reduce((a, b) => a > b ? a : b);

    for (int km = interval; km <= maxOdometer; km += interval) {
      if (!existingOdometers.contains(km)) {
        services.add({
          "service_odometer": km,
          "date_interval_months": (km / interval * 6).round(),
          "severity": "routine",
          "recommendation": "no data",
          "parts": (defaultService['parts'] as List),
        });
      }
    }

    print('Done Ensuring  ALL INTERVAL SERVICES EXIST');

    /// Sort services
    services.sort(
      (a, b) => a['service_odometer'].compareTo(b['service_odometer']),
    );

    return {
      "car_info": {
        "make": safeText(carInfo['make']),
        "model": safeText(carInfo['model']),
        "year": safeNumber(carInfo['year']).toInt(),
        "engine": safeText(carInfo['engine']),
        "maintenance_odometer_interval": interval,
        "manual_source": safeText(carInfo['manual_source']),
        "extraction_confidence": safeNumber(carInfo['extraction_confidence']),
      },
      "services": services,
    };
  }
}

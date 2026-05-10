import 'api_service.dart';

class TripService {
  static Future<List<dynamic>> getTrips(int userId, {String? status}) async {
    String path = "api/trips?userId=$userId";
    if (status != null) {
      path += "&status=$status";
    }
    final response = await ApiService.get(path);
    return response as List<dynamic>;
  }

  static Future<void> updateTripStatus(int tripId, String status) async {
    await ApiService.patch("api/trips/$tripId", {
      "status": status,
    });
  }

  static Future<void> deleteTrip(int tripId) async {
    // Note: ApiService needs a delete method if we want to use it
    // For now we'll stick to what we have or add it to ApiService if needed
  }
}

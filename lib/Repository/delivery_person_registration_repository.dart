import 'package:dartz/dartz.dart';
import '../model/delivery_person_registration_id_model.dart';
import '../model/delivery_person_registration_model.dart';
import '../services/api_exception.dart';
import '../services/api_manager.dart';
import '../utils/failure.dart';

class DeliveryPersonRegistrationRepository {
  final _apiManager = ApiManager();

  Future<Either<Failure, DeliveryPersonRegistration>>
      createDeliveryPersonRegistration(
          {String? phoneNumber,
          String? name,
          String? address,
          String? pan,
          String? photo,
          String? aadhaar,
          String? drivingLicense,
          String? status,
          String? vehicleRegistration,
          String? emergencyContact,
          bool? availability,
          String? password,
          String? firstName,
          String? lastName,
          String? email,
          String? userName,
          String? team,
          String? role,
          String? type,
          String? geofence,
          String? transportType,
          String? transportDescription,
          String? licensePlate,
          String? color,
          double? latitude,
          double? longitude}) async {
    try {
      var jsonResponse = await _apiManager.post(
        "https://586q1uovb9.execute-api.ap-south-1.amazonaws.com/v1/delivery-person",
        {
          "phoneNumber": phoneNumber,
          "name": name,
          "address": address,
          "pan": pan,
          "photo": photo,
          "aadhaar": aadhaar,
          "drivingLicense": drivingLicense,
          "status": status,
          "vehicleRegistration": vehicleRegistration,
          "emergencyContact": emergencyContact,
          "availability": availability,
          "email": email,
          "firstName": firstName,
          "lastName": lastName,
          "password": password,
          "userName": userName,
          "team": team,
          "role": role,
          "type": type,
          "geofence": geofence,
          "transportType": transportType,
          "transportDescription": transportDescription,
          "licensePlate": licensePlate,
          "color": color,
          "latitude": latitude,
          "longitude": longitude
        },
        isTokenMandatory: false,
      );

      var response = DeliveryPersonRegistration.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, DeliveryPersonRegistrationModel>>
      getDeliveryPersonRegistrationByPhoneNumber(String phoneNumber) async {
    try {
      var jsonResponse = await _apiManager.get(
        "https://586q1uovb9.execute-api.ap-south-1.amazonaws.com/v1/delivery-person/phone-number/$phoneNumber",
        isTokenMandatory: false,
      );

      var response = DeliveryPersonRegistrationModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, DeliveryPersonRegistrationModel>>
      updateDeliveryPersonRegistrationByID(
          {int? id,
          String? phoneNumber,
          String? name,
          String? address,
          String? pan,
          String? photo,
          String? aadhaar,
          String? drivingLicense,
          String? status,
          String? vehicleRegistration,
          String? emergencyContact,
          String? availability}) async {
    try {
      var jsonResponse = await _apiManager.put(
        "https://586q1uovb9.execute-api.ap-south-1.amazonaws.com/v1/delivery-person/id/$id",
        {
          "phoneNumber": phoneNumber,
          "name": name,
          "address": address,
          "pan": pan,
          "photo": photo,
          "aadhaar": aadhaar,
          "drivingLicense": drivingLicense,
          "status": status,
          "vehicleRegistration": vehicleRegistration,
          "emergencyContact": emergencyContact,
          "availability": availability
        },
        isTokenMandatory: false,
      );

      var response = DeliveryPersonRegistrationModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }

  Future<Either<Failure, DeliveryPersonRegistrationModel>>
      updateDeliveryPersonRegistrationStatus(id, status) async {
    try {
      var jsonResponse = await _apiManager.put(
        "https://586q1uovb9.execute-api.ap-south-1.amazonaws.com/v1/delivery-person/id/$id",
        {
          "availability": status,
        },
        isTokenMandatory: false,
      );

      var response = DeliveryPersonRegistrationModel.fromJson(jsonResponse);
      return right(response);
    } on AppException catch (error) {
      return left(ApiFailure(message: error.message));
    } catch (error) {
      return left(ApiFailure(message: error.toString()));
    }
  }
}

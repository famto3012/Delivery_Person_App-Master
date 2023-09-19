import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/delivery_person_registration_model.dart';
import '../repository/delivery_person_registration_repository.dart';

class RegistrationController extends GetxController {
  final DeliveryPersonRegistrationRepository _registrationRepository =
      DeliveryPersonRegistrationRepository();

  final _registrationModel = DeliveryPersonRegistration().obs;
  DeliveryPersonRegistration get registrationModel => _registrationModel.value;

  final _registrationAllDataModel = <DeliveryPersonRegistration>[].obs;
  List<DeliveryPersonRegistration> get registrationAllDataModel =>
      _registrationAllDataModel;

  final _registrationAvailableDeliveryPersonModel =
      <DeliveryPersonRegistration>[].obs;
  List<DeliveryPersonRegistration>
      get registrationAvailableDeliveryPersonModel =>
          _registrationAvailableDeliveryPersonModel;

  // final _freeDeliveryPerson = <DeliveryPersonRegistration>[].obs;
  // List<DeliveryPersonRegistration> get freeDeliveryPerson =>
  //     _freeDeliveryPerson;

  // final _busyDeliveryPerson = <DeliveryPersonRegistration>[].obs;
  // List<DeliveryPersonRegistration> get busyDeliveryPerson =>
  //     _busyDeliveryPerson;

  // final _inactiveAgentsList = <DeliveryPersonRegistration>[].obs;
  // List<DeliveryPersonRegistration> get inactiveAgentsList =>
  //     _inactiveAgentsList;

  final TextEditingController _nameController = TextEditingController();

  TextEditingController get nameController => _nameController;

  final TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController get phoneNumberController => _phoneNumberController;

  final TextEditingController _addressController = TextEditingController();
  TextEditingController get addressController => _addressController;

  final TextEditingController _panController = TextEditingController();
  TextEditingController get panController => _panController;

  final TextEditingController _aadharController = TextEditingController();
  TextEditingController get aadharController => _aadharController;

  final TextEditingController _photoController = TextEditingController();
  TextEditingController get photoController => _photoController;

  final TextEditingController _drivingLicenseController =
      TextEditingController();
  TextEditingController get drivingLicenseController =>
      _drivingLicenseController;

  final TextEditingController _vehicleRegistrationController =
      TextEditingController();
  TextEditingController get vehicleRegistrationController =>
      _vehicleRegistrationController;

  final TextEditingController _emergencyContactNumberController =
      TextEditingController();
  TextEditingController get emergencyContactNumberController =>
      _emergencyContactNumberController;

  final TextEditingController _vehicleTypeController = TextEditingController();
  TextEditingController get vehicleTypeController => _vehicleTypeController;

  final TextEditingController _vehicleLicenseNumberController =
      TextEditingController();
  TextEditingController get vehicleLicenseNumberController =>
      _vehicleLicenseNumberController;

  final _isEditMode = false.obs;
  bool get isEditMode => _isEditMode.value;
  set setEditMode(bool value) => _isEditMode.value = value;

  final Rx<String> _errorMessage = "".obs;
  String get errorMessage => _errorMessage.value;

  final Rx<String> _successMessage = "".obs;
  String get successMessage => _successMessage.value;

  clearData() {
    _aadharController.clear();
    _addressController.clear();
    _drivingLicenseController.clear();
    _emergencyContactNumberController.clear();
    _panController.clear();
    _phoneNumberController.clear();
    _vehicleLicenseNumberController.clear();
    _vehicleRegistrationController.clear();
    _vehicleTypeController.clear();
  }

  createDeliveryPersonRegistration(
      {phoneNumber,
      address,
      pan,
      photo,
      aadhaar,
      drivingLicense,
      status,
      vehicleRegistration,
      emergencyContact,
      availability,
      email,
      password,
      userName,
      firstName,
      lastName,
      team,
      role,
      type,
      geofence,
      transportType,
      transportDescription,
      licensePlate,
      color,
      latitude,
      longitude}) async {
    // _isDataLoading(true);

    var response =
        await _registrationRepository.createDeliveryPersonRegistration(
            phoneNumber: phoneNumber,
            address: address,
            pan: pan,
            photo: photo,
            aadhaar: aadhaar,
            drivingLicense: drivingLicense,
            status: status,
            vehicleRegistration: vehicleRegistration,
            emergencyContact: emergencyContact,
            availability: availability,
            email: email,
            firstName: firstName,
            lastName: lastName,
            password: password,
            userName: userName,
            team: team,
            role: role,
            type: type,
            geofence: geofence,
            transportType: transportType,
            transportDescription: transportDescription,
            licensePlate: licensePlate,
            color: color,
            latitude: latitude,
            longitude: longitude);

    response.fold((failure) {
      print("Failure");
      // _isDataLoading(false);
      // _errorMessage.value = failure.message;
    }, (data) async {
      print("Success");
      // _isDataLoading(false);
      _errorMessage.value = "";
      _successMessage.value = "Agent Successfully Added";
      _registrationModel.value = data;
      print(data.email);
    });
  }

  getDeliveryPersonRegistrationByPhoneNumber(String phoneNumber) async {
    // _isDataLoading(true);

    var response = await _registrationRepository
        .getDeliveryPersonRegistrationByPhoneNumber(phoneNumber);
    response.fold((failure) {
      // _isDataLoading(false);
      // _errorMessage.value = failure.message;
      print("failure");
    }, (data) async {
      // _isDataLoading(false);
      // _errorMessage.value = "";
      print("success");
      print("----- id === ${data.payload?.deliveryUserId}");

      int id;
      id = data.payload?.deliveryUserId ?? 0;
      // bool availability;
      // availability =
      //     _registrationController.registrationModel.availability ?? false;
      // updateDeliveryPersonRegistrationStatus(id: id, status: false);

      _registrationModel.value = data.payload ?? DeliveryPersonRegistration();
      _aadharController.text = data.payload?.aadhaar ?? "";
      _addressController.text = data.payload?.address ?? "";
      _drivingLicenseController.text = data.payload?.drivingLicense ?? "";
      _emergencyContactNumberController.text =
          data.payload?.emergencyContact ?? "";
      _panController.text = data.payload?.pan ?? "";
      _phoneNumberController.text = data.payload?.phoneNumber ?? "";
      _photoController.text = data.payload?.photo ?? "";
      _vehicleRegistrationController.text =
          data.payload?.vehicleRegistration ?? "";
    });
  }

  updateDeliveryPersonRegistrationStatus({id, status}) async {
    var response = await _registrationRepository
        .updateDeliveryPersonRegistrationStatus(id, status);
    response.fold((failure) {
      // _isDataLoading(false);
      // _errorMessage.value = failure.message;
      print("failed update status");
    }, (data) async {
      print("success update status");
      print("-- ${data.payload?.phoneNumber}");

      // _isDataLoading(false);
      // _errorMessage.value = "";
      _registrationModel.value = data.payload ?? DeliveryPersonRegistration();
      // // _registrationModel.refresh();
      // getDeliveryPersonRegistrationByPhoneNumber(
      //     data.payload?.phoneNumber ?? "");
    });
  }

  updateDeliveryPersonRegistrationDetail(
      {id,
      phoneNumber,
      name,
      address,
      pan,
      photo,
      aadhaar,
      drivingLicense,
      status,
      vehicleRegistration,
      emergencyContact,
      availability}) async {
    // _isDataLoading(true);

    var response =
        await _registrationRepository.updateDeliveryPersonRegistrationByID(
            id: id,
            phoneNumber: phoneNumber,
            name: name,
            address: address,
            pan: pan,
            photo: photo,
            aadhaar: aadhaar,
            drivingLicense: drivingLicense,
            status: status,
            vehicleRegistration: vehicleRegistration,
            emergencyContact: emergencyContact,
            availability: availability);
    response.fold((failure) {
      // _isDataLoading(false);
      // _errorMessage.value = failure.message;
    }, (data) async {
      // _isDataLoading(false);
      // _errorMessage.value = "";
      _registrationModel.value = data.payload ?? DeliveryPersonRegistration();
    });
  }
}

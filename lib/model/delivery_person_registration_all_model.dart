import 'package:json_annotation/json_annotation.dart';

import 'delivery_person_registration_model.dart';

part 'delivery_person_registration_all_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DeliveryPersonRegistrationAll {
  List<DeliveryPersonRegistration>? payload;

  DeliveryPersonRegistrationAll({
    this.payload,
  });

  factory DeliveryPersonRegistrationAll.fromJson(Map<String, dynamic> json) =>
      _$DeliveryPersonRegistrationAllFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryPersonRegistrationAllToJson(this);
}

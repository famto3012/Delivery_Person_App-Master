import 'package:famto_delivery_person_app/Controller/registration_controller.dart';
import 'package:famto_delivery_person_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:mapmyindia_gl/mapmyindia_gl.dart';

import '../Controller/storage_controller.dart';

class DeliveryPersonHomePage extends StatefulWidget {
  DeliveryPersonHomePage({super.key});

  String? phoneNumber;

  @override
  State<DeliveryPersonHomePage> createState() => _DeliveryPersonHomePageState();
}

class _DeliveryPersonHomePageState extends State<DeliveryPersonHomePage> {
  final RegistrationController _registrationController =
      RegistrationController();

  final MainController _mainController = Get.put(MainController());

  @override
  void initState() {
    _mainController.box.read("phoneNumber").then((value) {
      print(value);
      setState(() {
        widget.phoneNumber = value;
      });
    });
    super.initState();
  }

  bool isSwitched = false;
  var textValue = 'Not Available';
  String screen = "Active Orders";

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Available';
      });
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Not Available';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("Phone Number: ${widget.phoneNumber}");
    return Scaffold(
      drawer: Column(
        children: [
          DrawerHeader(
            child: Text("Delivery Person"),
          ),
          ListTile(
            title: Text("Active Orders"),
            onTap: () {
              setState(() {
                screen = "Active Orders";
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            title: Text("Orders History"),
            onTap: () {
              setState(() {
                screen = "Orders History";
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            title: Text("View Profile"),
            onTap: () {
              setState(() {
                screen = "View Profile";
                Navigator.pop(context);
                // code to close drawer;
              });
            },
          ),
          ListTile(
            title: Text("View Location"),
            onTap: () {
              setState(() {
                screen = "View Location";
                Navigator.pop(context);
                // code to close drawer;
              });
            },
          ),
          ListTile(
            title: Text("Log Out"),
            onTap: () {
              setState(() {
                screen = "Log Out";
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
                // code to close drawer;
              });
            },
          ),
        ],
      ),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Welcome"),
        actions: [
          Center(
              child: Row(
            children: [
              Text("$textValue"),
              Switch(
                onChanged: toggleSwitch,
                value: isSwitched,
                activeColor: Colors.green,
                activeTrackColor: Colors.white,
                inactiveThumbColor: Colors.red,
                inactiveTrackColor: Colors.white,
              ),
            ],
          )),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            screen == "Active Orders"
                ? Text("Active Orders")
                : screen == "Orders History"
                    ? Text("Orders History")
                    : screen == "View Profile"
                        ? Obx(
                            () => Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Profile Details",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage: NetworkImage(
                                        _registrationController
                                                .registrationModel.photo ??
                                            " "),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  Text(
                                      "Name: ${_registrationController.registrationModel.firstName}"),
                                  Text(
                                      "Phone Number: ${_registrationController.registrationModel.phoneNumber}"),
                                  Text(
                                      "Address: ${_registrationController.registrationModel.address}"),
                                  Text(
                                      "PAN: ${_registrationController.registrationModel.pan}"),
                                  Text(
                                      "Aadhar: ${_registrationController.registrationModel.aadhaar}"),
                                  Text(
                                      "Driving License: ${_registrationController.registrationModel.drivingLicense}"),
                                  Text(
                                      "Vehicle Registration: ${_registrationController.registrationModel.vehicleRegistration}"),
                                  Text(
                                      "Emergency Contact: ${_registrationController.registrationModel.emergencyContact}"),
                                ],
                              ),
                            ),
                          )
                        : screen == "View Location"
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                child: MapmyIndiaMap(
                                  initialCameraPosition: CameraPosition(
                                    target: LatLng(28.550264, 77.250612),
                                    zoom: 14,
                                  ),
                                  myLocationEnabled: true,
                                  myLocationTrackingMode:
                                      MyLocationTrackingMode.Tracking,
                                  onMapCreated: (MapmyIndiaMapController
                                      controller) async {
                                    // _controller = controller;
                                    // _controller.setMapStyle(_mapStyle);
                                  },
                                  onUserLocationUpdated: (location) => {
                                    print(
                                        "Location updated: ${location.position}")
                                  },
                                ),
                              )
                            : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

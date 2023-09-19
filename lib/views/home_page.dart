// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class DeliveryPersonHomePage extends StatefulWidget {
//   const DeliveryPersonHomePage({super.key});

//   @override
//   State<DeliveryPersonHomePage> createState() => _DeliveryPersonHomePageState();
// }

// class _DeliveryPersonHomePageState extends State<DeliveryPersonHomePage> {
//   bool isSwitched = false;
//   var textValue = 'Inactive';

//   void toggleSwitch(bool value) {
//     if (isSwitched == false) {
//       setState(() {
//         isSwitched = true;
//         textValue = 'Active';
//       });
//       print('Switch Button is ON');
//     } else {
//       setState(() {
//         isSwitched = false;
//         textValue = 'Not Available';
//       });
//       print('Switch Button is OFF');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Welcome"),
//         actions: [
//           // Transform.scale(
//           //     scale: 2,
//           //     child: Switch(
//           //       onChanged: toggleSwitch,
//           //       value: isSwitched,
//           //       activeColor: Colors.blue,
//           //       activeTrackColor: Colors.yellow,
//           //       inactiveThumbColor: Colors.redAccent,
//           //       inactiveTrackColor: Colors.orange,
//           //     )),
//           Text(
//             '$textValue',
//             style: TextStyle(fontSize: 20),
//           ),
//         ],
//       ),
//       body: Row(
//         children: [
//           Column(
//             children: [
//               Text("List of Assigned Orders"),
//               SizedBox(height: 10),
//               Text("Orders History"),
//             ],
//           ),
//           Text("Live Orders"),
//           SizedBox(height: 10),
//           ListView.builder(
//               itemCount: 10,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text("Order No."),
//                   subtitle: Text("Order Details"),
//                   trailing: Text("Order Status"),
//                 );
//               })
//         ],
//       ),
//     );
//   }
// }

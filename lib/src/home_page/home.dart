import 'package:flutter/material.dart';

import 'package:plant_disease_detector/constants/constants.dart';

import 'package:plant_disease_detector/src/home_page/components/hidden_drawer.dart';
import 'package:plant_disease_detector/src/home_page/components/home_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const routeName = '/';
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  double xOffset = 0.0, yOffset = 0.0, rotateAngle = 0.0, scaleFactor = 1.0;
  bool isDrawerOpen = false, isLoading = true;
  bool isAnimating = false;

  Future<void> loading() async {
    await Future.delayed(const Duration(milliseconds: 3000));

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    loading();

    return Scaffold(
      backgroundColor: AppColors.kWhite,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animationController,
        ),
        onPressed: () {
          isAnimating = !isAnimating;

          isAnimating
              ? _animationController.forward()
              : _animationController.reverse();

          if (isDrawerOpen) {
            setState(() {
              xOffset = 0;
              yOffset = 0;
              scaleFactor = 1;
              rotateAngle = 0;
              isDrawerOpen = false;
            });
          } else {
            setState(() {
              xOffset = 280;
              yOffset = 170;
              scaleFactor = 0.7;
              rotateAngle = -0.1;
              isDrawerOpen = true;
            });
          }
        },
      ),
      body: Stack(
        children: [
          HiddenDrawer(),
          AnimatedContainer(
            transform: Matrix4.translationValues(
                xOffset - (isDrawerOpen ? 10 : 0),
                yOffset + (isDrawerOpen ? 30 : 0),
                0)
              ..rotateZ(rotateAngle)
              ..scale(scaleFactor - (isDrawerOpen ? 0.07 : 0)),
            duration: const Duration(milliseconds: 250),
            child: Container(
              color: Color.fromARGB(109, 236, 253, 232),
            ),
          ),
          AnimatedContainer(
            transform: Matrix4.translationValues(
                xOffset - (isDrawerOpen ? 20 : 0),
                yOffset + (isDrawerOpen ? 55 : 0),
                0)
              ..rotateZ(rotateAngle)
              ..scale(scaleFactor - (isDrawerOpen ? 0.12 : 0)),
            duration: const Duration(milliseconds: 250),
            child: Container(
              color: Color.fromARGB(66, 236, 253, 232),
            ),
          ),
          AnimatedContainer(
            alignment: Alignment.topCenter,
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..rotateZ(rotateAngle)
              ..scale(scaleFactor),
            duration: const Duration(milliseconds: 250),
            child: Homescreen(),
          )
        ],
      ),
    );
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Crop Insurance'),
//         backgroundColor: Colors.green[700],
//       ),
//       backgroundColor: AppColors.kWhite,
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: FloatingActionButton(
//         child: AnimatedIcon(
//           icon: AnimatedIcons.menu_close,
//           progress: _animationController,
//         ),
//         onPressed: () {
//           isAnimating = !isAnimating;

//           isAnimating
//               ? _animationController.forward()
//               : _animationController.reverse();

//           if (isDrawerOpen) {
//             setState(() {
//               xOffset = 0;
//               yOffset = 0;
//               scaleFactor = 1;
//               rotateAngle = 0;
//               isDrawerOpen = false;
//             });
//           } else {
//             setState(() {
//               xOffset = 280;
//               yOffset = 170;
//               scaleFactor = 0.7;
//               rotateAngle = -0.1;
//               isDrawerOpen = true;
//             });
//           }
//         },
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.green[200],
//               ),
//               padding: EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     'Policy Summary',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green[700],
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Policy Name',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             'Crop Insurance Policy',
//                             style: TextStyle(
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Coverage Amount',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             '\$10,000',
//                             style: TextStyle(
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Premium',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             '\$500',
//                             style: TextStyle(
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Policy Dates',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             'Jan 1, 2023 - Dec 31, 2023',
//                             style: TextStyle(
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Days Remaining: 15',
//                         style: TextStyle(
//                           fontSize: 16,
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           // TODO: Implement policy renewal functionality
//                         },
//                         child: Text(
//                           'Renew Policy',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.white,
//                           ),
//                         ),
//                         style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.all<Color>(
//                               Colors.green[700]!),
//                           shape:
//                               MaterialStateProperty.all<RoundedRectangleBorder>(
//                             RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 30),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.green[200],
//               ),
//               padding: EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     'Recent Claims',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green[700],
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ClaimItem(
//                         claimId: '123456',
//                         claimDate: 'April 20, 2023',
//                         claimedAmount: '\$8,000',
//                         status: 'Approved',
//                       ),
//                       SizedBox(height: 15),
//                       ClaimItem(
//                         claimId: '789012',
//                         claimDate: 'April 15, 2023',
//                         claimedAmount: '\$5,000',
//                         status: 'Pending',
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 30),
//             ElevatedButton.icon(
//               onPressed: () {
//                 // TODO: Implement file a new claim functionality
//               },
//               icon: Icon(Icons.add, size: 24),
//               label: Text(
//                 'File a New Claim',
//                 style: TextStyle(
//                   fontSize: 16,
//                 ),
//               ),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.green[700],
//                 padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//             SizedBox(height: 30),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.green[200],
//               ),
//               padding: EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     'Weather Information',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green[700],
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Location',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             'Sample City',
//                             style: TextStyle(
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Temperature',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             '26°C',
//                             style: TextStyle(
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     'Sunny with occasional clouds',
//                     style: TextStyle(
//                       fontSize: 16,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 30),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.green[200],
//               ),
//               padding: EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     'Crop Market Prices',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green[700],
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     'Corn: \$10 per kg',
//                     style: TextStyle(
//                       fontSize: 16,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Wheat: \$8 per kg',
//                     style: TextStyle(
//                       fontSize: 16,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Rice: \$12 per kg',
//                     style: TextStyle(
//                       fontSize: 16,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ClaimItem extends StatelessWidget {
//   final String claimId;
//   final String claimDate;
//   final String claimedAmount;
//   final String status;

//   const ClaimItem({
//     Key? key,
//     required this.claimId,
//     required this.claimDate,
//     required this.claimedAmount,
//     required this.status,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.white,
//       ),
//       padding: EdgeInsets.all(15),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Claim ID: $claimId',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 5),
//           Text(
//             'Claim Date: $claimDate',
//             style: TextStyle(
//               fontSize: 16,
//             ),
//           ),
//           SizedBox(height: 5),
//           Text(
//             'Claimed Amount: $claimedAmount',
//             style: TextStyle(
//               fontSize: 16,
//             ),
//           ),
//           SizedBox(height: 5),
//           Text(
//             'Status: $status',
//             style: TextStyle(
//               fontSize: 16,
//             ),
//           ),
//         ],
//       ),
//     );
  }
}

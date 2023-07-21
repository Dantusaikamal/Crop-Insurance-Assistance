import 'package:flutter/material.dart';
import 'package:crop_insurance_assistance/constants/constants.dart';
import 'package:crop_insurance_assistance/src/widgets/big_text.dart';
import 'package:crop_insurance_assistance/src/widgets/small_text.dart';
import 'package:crop_insurance_assistance/src/widgets/spacing.dart';

import '../../constants/dimensions.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
        backgroundColor: Colors.green[700],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigText(
              text: 'Insurance Providers',
              color: Colors.green[700],
            ),
            verticalSpacing(20),
            ContactCard(
              title: 'Insurance Provider 1',
              phoneNumber: '1234567890',
              email: 'provider1@example.com',
            ),
            verticalSpacing(20),
            ContactCard(
              title: 'Insurance Provider 2',
              phoneNumber: '9876543210',
              email: 'provider2@example.com',
            ),
            verticalSpacing(40),
            BigText(
              text: 'Government Helplines',
              color: Colors.green[700],
            ),
            verticalSpacing(20),
            ContactCard(
              title: 'Agricultural Helpline',
              phoneNumber: '1800-123-4567',
              email: 'agriculture-helpline@example.com',
            ),
            verticalSpacing(20),
            ContactCard(
              title: 'Crop Insurance Helpline',
              phoneNumber: '1800-987-6543',
              email: 'crop-insurance-helpline@example.com',
            ),
          ],
        ),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String title;
  final String phoneNumber;
  final String email;

  const ContactCard({
    required this.title,
    required this.phoneNumber,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmallText(
              text: title,
              color: Colors.black87,
              size: Dimensions.font16,
              fontWeight: FontWeight.bold,
            ),
            verticalSpacing(10),
            Row(
              children: [
                Icon(Icons.phone, color: Colors.green[700]),
                horizontalSpacing(10),
                SmallText(
                  text: phoneNumber,
                  color: Colors.black87,
                ),
              ],
            ),
            verticalSpacing(10),
            Row(
              children: [
                Icon(Icons.email, color: Colors.green[700]),
                horizontalSpacing(10),
                SmallText(
                  text: email,
                  color: Colors.black87,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

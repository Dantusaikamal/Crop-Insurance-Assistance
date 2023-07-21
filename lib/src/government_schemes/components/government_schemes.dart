import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crop_insurance_assistance/constants/constants.dart';
import 'package:crop_insurance_assistance/constants/dimensions.dart';
import 'package:crop_insurance_assistance/helper/lang_controller.dart';
import 'package:crop_insurance_assistance/src/home_page/components/greeting.dart';
import 'package:crop_insurance_assistance/src/government_schemes/components/schemes.dart';
import 'package:crop_insurance_assistance/src/home_page/components/titlesection.dart';
import 'package:crop_insurance_assistance/src/widgets/spacing.dart';
import 'package:provider/provider.dart';
import 'package:translator/translator.dart';
import 'package:crop_insurance_assistance/src/widgets/spacing.dart';

class GovernmentSchemescreen extends StatelessWidget {
  const GovernmentSchemescreen({Key? key}) : super(key: key);

  static const routeName = '/government_schemes';

  Widget verticalSpacing(double height) {
    return SizedBox(height: height);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Government Schemes'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bgr.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SchemesSection(),
            verticalSpacing(Dimensions.height30),
          ],
        ),
      ),
    );
  }
}

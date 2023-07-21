import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_disease_detector/constants/constants.dart';
import 'package:plant_disease_detector/constants/dimensions.dart';
import 'package:plant_disease_detector/helper/lang_controller.dart';
import 'package:plant_disease_detector/src/home_page/components/greeting.dart';
import 'package:plant_disease_detector/src/insurance/components/insurances.dart';
import 'package:plant_disease_detector/src/home_page/components/titlesection.dart';
import 'package:plant_disease_detector/src/widgets/spacing.dart';
import 'package:provider/provider.dart';
import 'package:translator/translator.dart';
import 'package:plant_disease_detector/src/widgets/small_text.dart';

// }
class InsuranceProvidersscreen extends StatelessWidget {
  static const routeName = '/insurance_providers';

  final List<InsuranceProvider> insuranceProviders = [
    InsuranceProvider(
        name: 'Insurance Provider 1',
        description: 'Description of Insurance Provider 1',
        imageUrl: 'assets/images/logo1.jpg',
        website: 'google.com',
        claimDetails: 'No'),
    InsuranceProvider(
        name: 'Insurance Provider 2',
        description: 'Description of Insurance Provider 2',
        imageUrl: 'assets/images/logo1.jpg',
        website: 'google.com',
        claimDetails: 'No'),
    // Add more insurance providers as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insurance Providers'),
        backgroundColor: Colors.green[700],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bgr.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          padding: EdgeInsets.all(Dimensions.height20),
          itemCount: insuranceProviders.length,
          itemBuilder: (context, index) {
            return InsuranceCard(
              provider: insuranceProviders[index],
            );
          },
        ),
      ),
    );
  }
}

class InsuranceCard extends StatefulWidget {
  final InsuranceProvider provider;

  const InsuranceCard({
    required this.provider,
  });

  @override
  _InsuranceCardState createState() => _InsuranceCardState();
}

class _InsuranceCardState extends State<InsuranceCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      color: AppColors.kMain,
      child: InkWell(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.kAccentLight,
                backgroundImage: AssetImage(widget.provider.imageUrl),
              ),
              title: SmallText(
                text: widget.provider.name,
                color: AppColors.kWhite,
                size: Dimensions.font16,
              ),
              trailing: Icon(
                isExpanded ? Icons.expand_less : Icons.expand_more,
                color: AppColors.kWhite,
              ),
            ),
            if (isExpanded)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(
                      text: widget.provider.description,
                      color: AppColors.kWhite.withOpacity(0.7),
                      size: Dimensions.font16,
                    ),
                    verticalSpacing(Dimensions.height10),
                    SmallText(
                      text: 'Website: ${widget.provider.website}',
                      color: AppColors.kWhite,
                      size: Dimensions.font16,
                    ),
                    verticalSpacing(Dimensions.height10),
                    SmallText(
                      text: 'Claim Details: ${widget.provider.claimDetails}',
                      color: AppColors.kWhite,
                      size: Dimensions.font16,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class InsuranceProvider {
  final String name;
  final String description;
  final String imageUrl;
  final String website;
  final String claimDetails;

  InsuranceProvider({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.website,
    required this.claimDetails,
  });
}

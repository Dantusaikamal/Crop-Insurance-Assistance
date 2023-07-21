import 'package:flutter/material.dart';
import 'package:crop_insurance_assistance/constants/constants.dart';
import 'package:crop_insurance_assistance/constants/dimensions.dart';
import 'package:crop_insurance_assistance/src/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:crop_insurance_assistance/src/widgets/spacing.dart';

class SchemesSection extends StatefulWidget {
  const SchemesSection({Key? key}) : super(key: key);

  @override
  _SchemesSectionState createState() => _SchemesSectionState();
}

Widget verticalSpacing(height) {
  return SizedBox(height: height);
}

class _SchemesSectionState extends State<SchemesSection> {
  List<bool> isExpandedList = List.filled(governmentSchemes.length, false);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.width20,
      ),
      height: Dimensions.height45 * 12,
      child: ScrollConfiguration(
        behavior: MaterialScrollBehavior().copyWith(overscroll: false),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: governmentSchemes.length,
          itemBuilder: (context, index) {
            final scheme = governmentSchemes[index];
            return SchemeCard(
              scheme: scheme,
              isExpanded: isExpandedList[index],
              onToggleExpansion: () {
                setState(() {
                  isExpandedList[index] = !isExpandedList[index];
                });
              },
            );
          },
        ),
      ),
    );
  }
}

class SchemeCard extends StatelessWidget {
  final GovernmentScheme scheme;
  final bool isExpanded;
  final VoidCallback onToggleExpansion;

  const SchemeCard({
    required this.scheme,
    required this.isExpanded,
    required this.onToggleExpansion,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      color: AppColors.kMain,
      child: InkWell(
        onTap: onToggleExpansion,
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.kAccentLight,
                child: Text(
                  scheme.id.toString(),
                  style: TextStyle(color: AppColors.kWhite),
                ),
              ),
              title: SmallText(
                text: scheme.name,
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
                      text: scheme.description,
                      color: AppColors.kWhite.withOpacity(0.7),
                      size: Dimensions.font16,
                    ),
                    verticalSpacing(Dimensions.height10),
                    SmallText(
                      text: 'Website: ${scheme.website}',
                      color: AppColors.kWhite,
                      size: Dimensions.font16,
                    ),
                    verticalSpacing(Dimensions.height10),
                    SmallText(
                      text: 'Benefits: ${scheme.benefits}',
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

class GovernmentScheme {
  final int id;
  final String name;
  final String description;
  final String website;
  final String benefits;

  GovernmentScheme({
    required this.id,
    required this.name,
    required this.description,
    required this.website,
    required this.benefits,
  });
}

final List<GovernmentScheme> governmentSchemes = [
  GovernmentScheme(
    id: 1,
    name: 'Scheme 1',
    description: 'This is the description of scheme 1.',
    website: 'www.scheme1.gov.in',
    benefits: 'This scheme provides benefits for...',
  ),
  GovernmentScheme(
    id: 2,
    name: 'Scheme 2',
    description: 'This is the description of scheme 2.',
    website: 'www.scheme2.gov.in',
    benefits: 'This scheme provides benefits for...',
  ),
  // Add more government schemes here
];

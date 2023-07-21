import 'package:flutter/material.dart';
import 'package:plant_disease_detector/constants/constants.dart';
import 'package:plant_disease_detector/constants/dimensions.dart';
import 'package:plant_disease_detector/src/widgets/small_text.dart';
import 'package:get/get.dart';

// class InsurancesSection extends StatelessWidget {
//   const InsurancesSection({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(
//         horizontal: Dimensions.width20,
//       ),
//       height: Dimensions.height45 * 12,
//       child: ScrollConfiguration(
//         behavior: MaterialScrollBehavior().copyWith(overscroll: false),
//         child: ListView(
//           physics: BouncingScrollPhysics(),
//           children: [
//             Card(
//               elevation: 8,
//               color: AppColors.kMain,
//               child: ListTile(
//                 leading: CircleAvatar(
//                   backgroundColor: AppColors.kAccentLight,
//                   child: Text(
//                     '1',
//                     style: TextStyle(color: AppColors.kWhite),
//                   ),
//                 ),
//                 title: SmallText(
//                   text: "insurance1".tr,
//                   color: AppColors.kWhite,
//                   size: Dimensions.font16,
//                 ),
//               ),
//             ),
//             Card(
//               elevation: 8,
//               color: AppColors.kMain,
//               child: ListTile(
//                 leading: CircleAvatar(
//                   backgroundColor: AppColors.kAccentLight,
//                   child: Text(
//                     '2',
//                     style: TextStyle(color: AppColors.kWhite),
//                   ),
//                 ),
//                 title: SmallText(
//                   text: 'insurance2'.tr,
//                   color: AppColors.kWhite,
//                   size: Dimensions.font16,
//                 ),
//               ),
//             ),
//             Card(
//               elevation: 8,
//               color: AppColors.kMain,
//               child: ListTile(
//                 leading: CircleAvatar(
//                   backgroundColor: AppColors.kAccentLight,
//                   child: Text(
//                     '3',
//                     style: TextStyle(color: AppColors.kWhite),
//                   ),
//                 ),
//                 title: SmallText(
//                   text: 'insurance3'.tr,
//                   color: AppColors.kWhite,
//                   size: Dimensions.font16,
//                 ),
//               ),
//             ),
//             Card(
//               elevation: 8,
//               color: AppColors.kMain,
//               child: ListTile(
//                 leading: CircleAvatar(
//                   backgroundColor: AppColors.kAccentLight,
//                   child: Text(
//                     '3',
//                     style: TextStyle(color: AppColors.kWhite),
//                   ),
//                 ),
//                 title: SmallText(
//                   text: 'insurance4'.tr,
//                   color: AppColors.kWhite,
//                   size: Dimensions.font16,
//                 ),
//               ),
//             ),
//             Card(
//               elevation: 8,
//               color: AppColors.kMain,
//               child: ListTile(
//                 leading: CircleAvatar(
//                   backgroundColor: AppColors.kAccentLight,
//                   child: Text(
//                     '3',
//                     style: TextStyle(color: AppColors.kWhite),
//                   ),
//                 ),
//                 title: SmallText(
//                   text: 'insurance5'.tr,
//                   color: AppColors.kWhite,
//                   size: Dimensions.font16,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class InsurancesSection extends StatelessWidget {
  const InsurancesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.width20,
      ),
      height: Dimensions.height45 * 12,
      child: ScrollConfiguration(
        behavior: MaterialScrollBehavior().copyWith(overscroll: false),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            InsuranceCard(
              provider: InsuranceProvider(
                name: 'Insurance 1',
                description: 'Description of Insurance 1',
                imageUrl: 'assets/images/plant.png',
              ),
            ),
            InsuranceCard(
              provider: InsuranceProvider(
                name: 'Insurance 2',
                description: 'Description of Insurance 2',
                imageUrl: 'assets/images/plant.png',
              ),
            ),
            InsuranceCard(
              provider: InsuranceProvider(
                name: 'Insurance 3',
                description: 'Description of Insurance 3',
                imageUrl: 'assets/images/plant.png',
              ),
            ),
            InsuranceCard(
              provider: InsuranceProvider(
                name: 'Insurance 4',
                description: 'Description of Insurance 4',
                imageUrl: 'assets/images/plant.png',
              ),
            ),
            InsuranceCard(
              provider: InsuranceProvider(
                name: 'Insurance 5',
                description: 'Description of Insurance 5',
                imageUrl: 'assets/images/plant.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InsuranceCard extends StatelessWidget {
  final InsuranceProvider provider;

  const InsuranceCard({
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      color: AppColors.kMain,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.kAccentLight,
          backgroundImage: AssetImage(provider.imageUrl),
        ),
        title: SmallText(
          text: provider.name,
          color: AppColors.kWhite,
          size: Dimensions.font16,
        ),
        subtitle: SmallText(
          text: provider.description,
          color: AppColors.kWhite.withOpacity(0.7),
          size: Dimensions.font16,
        ),
        onTap: () {
          // TODO: Implement provider details screen or action
        },
      ),
    );
  }
}

class InsuranceProvider {
  final String name;
  final String description;
  final String imageUrl;

  InsuranceProvider({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

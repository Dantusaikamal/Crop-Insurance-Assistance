import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:crop_insurance_assistance/constants/constants.dart';
import 'package:crop_insurance_assistance/constants/dimensions.dart';
import 'package:crop_insurance_assistance/data/languages.dart';
import 'package:crop_insurance_assistance/helper/lang_controller.dart';
import 'package:crop_insurance_assistance/services/classify.dart';
import 'package:crop_insurance_assistance/services/disease_provider.dart';
import 'package:crop_insurance_assistance/services/hive_database.dart';
import 'package:crop_insurance_assistance/src/home_page/models/disease_model.dart';
import 'package:crop_insurance_assistance/src/suggestions_page/suggestions.dart';
import 'package:crop_insurance_assistance/src/insurance/components/insurance_providers.dart';
import 'package:crop_insurance_assistance/src/government_schemes/components/government_schemes.dart';
import 'package:crop_insurance_assistance/src/widgets/big_text.dart';
import 'package:crop_insurance_assistance/src/widgets/small_text.dart';
import 'package:crop_insurance_assistance/src/widgets/spacing.dart';
import 'package:provider/provider.dart';
import 'package:translator/translator.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:crop_insurance_assistance/src/blog/blog_screen.dart';
import 'package:crop_insurance_assistance/src/contact/contact_screen.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({Key? key}) : super(key: key);

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final translator = GoogleTranslator();

  LangController langController = Get.put(LangController());

  PackageInfo? packageInfo;

  String selectedOption = "";

  updateLocale(Locale locale, BuildContext context) {
    Get.updateLocale(locale);
  }

  void getPackage() async {
    packageInfo = await PackageInfo.fromPlatform();
    String _version = packageInfo!.version;

    langController.setAppVersion(_version);
  }

  @override
  void initState() {
    super.initState();
    getPackage();
  }

  @override
  Widget build(BuildContext context) {
    // Get disease from provider
    final _diseaseService = Provider.of<DiseaseService>(context);

    // Hive service
    HiveService _hiveService = HiveService();

    final Classifier classifier = Classifier();
    late Disease _disease;

    return Scaffold(
      key: this._scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
            opacity: 0.1,
          ),
          color: Color.fromARGB(255, 2, 148, 46),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.height20,
          vertical: Dimensions.height45,
        ),
        child: langController.loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GetBuilder<LangController>(
                          builder: (_) => SmallText(
                                text:
                                    "version: " + langController.getAppVersion,
                                fontStyle: FontStyle.italic,
                                size: Dimensions.font16 * 1.2,
                                color: AppColors.kWhite,
                              ))
                    ],
                  ),
                  Container(
                    height: Dimensions.height45 * 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpacing(Dimensions.height45 * 1.5),
                        Container(
                          height: Dimensions.height45 * 3,
                          width: Dimensions.height45 * 3,
                          child: Center(
                            child: Image.asset(
                              "assets/images/plant.png",
                              height: Dimensions.height45 * 2.5,
                            ),
                          ),
                        ),
                        verticalSpacing(Dimensions.height45),
                        InkWell(
                            onTap: () => showModalBottomSheet(
                                context: context,
                                builder: (ctx) => _buildBottomSheet(ctx)),
                            child: Row(
                              children: [
                                const FaIcon(
                                  FontAwesomeIcons.language,
                                  color: AppColors.kWhite,
                                ),
                                horizontalSpacing(Dimensions.width15),
                                SmallText(
                                  text: "chooseLanguage".tr,
                                  size: Dimensions.font16 * 1.2,
                                  color: AppColors.kWhite,
                                )
                              ],
                            )),
                        verticalSpacing(Dimensions.height30),
                        InkWell(
                          onTap: () async {
                            late double _confidence;
                            await classifier
                                .getDisease(ImageSource.gallery)
                                .then((value) {
                              _disease = Disease(
                                  name: value![0]["label"],
                                  imagePath: classifier.imageFile.path);

                              _confidence = value[0]['confidence'];
                            });
                            // Check confidence
                            if (_confidence > 0.8) {
                              // Set disease for Disease Service
                              _diseaseService.setDiseaseValue(_disease);

                              // Save disease
                              _hiveService.addDisease(_disease);

                              Navigator.restorablePushNamed(
                                context,
                                Suggestions.routeName,
                              );
                            } else {
                              // Display unsure message
                            }
                          },
                          child: Row(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.file,
                                color: AppColors.kWhite,
                              ),
                              horizontalSpacing(Dimensions.width15),
                              SmallText(
                                text: "chooseImage".tr,
                                color: AppColors.kWhite,
                                size: Dimensions.font16 * 1.2,
                              )
                            ],
                          ),
                        ),
                        verticalSpacing(Dimensions.height45),
                        InkWell(
                          onTap: () async {
                            Get.to(InsuranceProvidersscreen());
                          },
                          child: Row(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.list,
                                color: AppColors.kWhite,
                              ),
                              horizontalSpacing(Dimensions.width15),
                              SmallText(
                                text: "insuranceProviders".tr,
                                color: AppColors.kWhite,
                                size: Dimensions.font16 * 1.2,
                              )
                            ],
                          ),
                        ),
                        verticalSpacing(Dimensions.height45),
                        InkWell(
                            onTap: () async {
                              Get.to(GovernmentSchemescreen());
                            },
                            child: Row(
                              children: [
                                const FaIcon(
                                  FontAwesomeIcons.handsHelping,
                                  color: AppColors.kWhite,
                                ),
                                horizontalSpacing(Dimensions.width15),
                                SmallText(
                                  text: "Government Schemes".tr,
                                  size: Dimensions.font16 * 1.2,
                                  color: AppColors.kWhite,
                                )
                              ],
                            )),
                        verticalSpacing(Dimensions.height45),
                        InkWell(
                          onTap: () => Get.to(
                              BlogScreen()), // Replace BlogScreen with your actual blog screen
                          child: Row(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.blog,
                                color: AppColors.kWhite,
                              ),
                              horizontalSpacing(Dimensions.width15),
                              SmallText(
                                text: "Blog".tr,
                                size: Dimensions.font16 * 1.2,
                                color: AppColors.kWhite,
                              )
                            ],
                          ),
                        ),
                        verticalSpacing(Dimensions.height45),
                        InkWell(
                          onTap: () => Get.to(
                              ContactScreen()), // Replace ContactScreen with your actual contact screen
                          child: Row(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.headphones,
                                color: AppColors.kWhite,
                              ),
                              horizontalSpacing(Dimensions.width15),
                              SmallText(
                                text: "Contact".tr,
                                size: Dimensions.font16 * 1.2,
                                color: AppColors.kWhite,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }

  // bottomsheet container

  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      height: Dimensions.height45 * 6,
      child: Column(
        children: [
          verticalSpacing(Dimensions.height10 * 2),
          BigText(
            text: "chooseLanguage".tr,
            color: AppColors.kMain,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width20, vertical: Dimensions.height20),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: Dimensions.width20,
              children: Languages.options
                  .map((option) => buildChip(option.tr, context))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget buildChip(String option, BuildContext context) {
    bool isSelected = selectedOption == option;

    return GestureDetector(
      onTap: () async {
        setState(() {
          selectedOption = option;
        });

        Get.back();

        if (selectedOption == "English") {
          updateLocale(Locale("en", "US"), context);
          langController.setLanguagecode("en");
        } else if (selectedOption == "Hindi") {
          updateLocale(Locale("hi", "IN"), context);
          langController.setLanguagecode("hi");
        } else if (selectedOption == "Telugu") {
          updateLocale(Locale("te", "IN"), context);
          langController.setLanguagecode("te");
        } else if (selectedOption == "Gujarati") {
          updateLocale(Locale("gu", "IN"), context);
          langController.setLanguagecode("gu");
        } else if (selectedOption == "Marathi") {
          updateLocale(Locale("mr", "IN"), context);
          langController.setLanguagecode("mr");
        }
      },
      child: Chip(
        backgroundColor: isSelected ? AppColors.kMain : AppColors.kWhite,
        shape: StadiumBorder(
            side: BorderSide(
          color: AppColors.kMain,
        )),
        label: Text(
          option,
          style: TextStyle(
            color: isSelected ? AppColors.kWhite : AppColors.kMain,
            fontSize: Dimensions.font16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

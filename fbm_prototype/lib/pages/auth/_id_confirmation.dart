import 'package:FBM/components/_custom_button.dart';
import 'package:FBM/components/_custom_input.dart';
import 'package:FBM/pages/auth/_id_uploader.dart';
import 'package:flutter/material.dart';
import 'package:FBM/components/_custom_colors.dart';
import 'package:FBM/components/_custom_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IDConfirmation extends StatefulWidget {
  @override
  _IDConfirmationState createState() => _IDConfirmationState();
}

class _IDConfirmationState extends State<IDConfirmation> {
  String? selectedIdType;

  final List<String> idTypes = [
    "Philippine Passport",
    "Driver’s License",
    "SSS ID",
    "PhilHealth ID",
    "TIN ID",
    "Postal ID",
    "Voter’s ID",
    "PRC ID",
    "UMID",
    "National ID (PhilSys)"
  ];

  void _showIdTypeSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.all(0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // so modal takes only needed height
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 18.0, top: 18.0),
                  child: CustomText(
                      style: TextStyle(),
                      text: 'Select ID Type',
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: idTypes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.only(left: 18.0),
                      title: CustomText(
                        text: idTypes[index],
                        fontSize: 14,
                      ),
                      onTap: () {
                        setState(() {
                          selectedIdType = idTypes[index];
                        });
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void _verifySelfie(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // allows full-screen height if needed
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(top: 30, bottom: 20, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Take a Selfie',
                        fontSize: 20,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(height: 12),
                      CustomText(
                        textAlign: TextAlign.center,
                        height: 1.25,
                        text: 'We use your selfie to compare to your ID Photo',
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: Image.asset('assets/img/bg/img-selfie.png'),
                ),
                _buildTip(
                  icon: 'assets/img/icon/icon-check-green.svg',
                  title: 'Good lighting and no glare',
                  text:
                      'Make sure you are in well lit area and both ears are uncovered',
                ),
                const SizedBox(height: 20),
                _buildTip(
                  icon: 'assets/img/icon/icon-check-green.svg',
                  title: 'Look Straight',
                  text:
                      'Hold your phone at eye level and look straight to the camera',
                ),
                const SizedBox(height: 30),
                CustomButton(
                    text: 'Take Selfie',
                    onPressed: () {
                      Navigator.pushNamed(context, '/selfie-verification');
                    }),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTip(
      {required String icon, required String title, required String text}) {
    return SizedBox(
      width: 350,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(icon, width: 30, height: 30),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                CustomText(
                  text: text,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                  softWrap: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: 'Registration',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Personal Information',
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 8),
                CustomText(
                  text: 'Fill your personal information below.',
                  fontSize: 14,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Column(children: [
                    Row(
                      children: [
                        CustomText(
                          text: 'ID Type ',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                        CustomText(
                          text: '*',
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    GestureDetector(
                      onTap: () => _showIdTypeSelector(context),
                      child: CustomInput(
                        onTap: () => _showIdTypeSelector(context),
                        readOnly: true,
                        controller:
                            TextEditingController(text: selectedIdType ?? ""),
                        placeholder: "Select ID type",
                        iconAlignment: CustomIconAlignment.right,
                        icon: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: SvgPicture.asset(
                              "assets/img/icon/icon-arrow.svg"),
                        ),
                      ),
                    ),
                  ]),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text: 'ID Number ',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                            CustomText(
                              text: '*',
                              color: AppColors.primary,
                            ),
                          ],
                        ),
                        const SizedBox(height: 6.0),
                        CustomInput(
                          placeholder: "Enter ID number",
                        ),
                      ],
                    )),
                const SizedBox(height: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomText(
                          text: 'Upload ID ',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                        CustomText(
                          text: '*',
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                    IDUploader(),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(20.0),
          child: CustomButton(
              text: 'Next',
              onPressed: () => {
                    _verifySelfie(context),
                  }),
        ));
  }
}

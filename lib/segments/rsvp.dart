import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RsvpForm extends StatefulWidget {
  const RsvpForm({super.key});

  @override
  State<RsvpForm> createState() => _RsvpFormState();
}

class _RsvpFormState extends State<RsvpForm> {
  final _formKey = GlobalKey<FormState>();

  String? selectedOption;
  String firstName = '';
  String email = '';
  String mobile = '';

  final textColor = const Color(0xFF0B2911);
  final bgColor = const Color(0xFFF6EAEA);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    final isMobile = screenWidth < 400;
    final isTablet = screenWidth >= 400 && screenWidth <= 800;

    final labelFontSize =
        isMobile
            ? 12.0
            : isTablet
            ? 13.0
            : 14.0;
    final radioLabelFontSize =
        isMobile
            ? 10.0
            : isTablet
            ? 11.0
            : 12.0;
    final radioTitleFontSize =
        isMobile
            ? 12.0
            : isTablet
            ? 13.0
            : 14.0;
    final buttonFontSize =
        isMobile
            ? 14.0
            : isTablet
            ? 15.0
            : 16.0;

    final formPadding =
        isMobile
            ? 12.0
            : isTablet
            ? 16.0
            : 24.0;
    final svgSpacing =
        isMobile
            ? 16.0
            : isTablet
            ? 20.0
            : 24.0;

    final buttonHorizontalPadding =
        isMobile
            ? 32.0
            : isTablet
            ? 40.0
            : 48.0;
    final buttonVerticalPadding =
        isMobile
            ? 12.0
            : isTablet
            ? 14.0
            : 16.0;
    final verticalSpacing =
        isMobile
            ? 16.0
            : isTablet
            ? 20.0
            : 24.0;
    final largeVerticalSpacing =
        isMobile
            ? 24.0
            : isTablet
            ? 32.0
            : 40.0;

    final svgSize =
        isMobile
            ? 40.0
            : isTablet
            ? 50.0
            : 60.0;
    final radioCircleSize =
        isMobile
            ? 40.0
            : isTablet
            ? 44.0
            : 48.0;

    return Column(
      children: [
        (isMobile || (isTablet && screenWidth < 600))
            ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildLabel("NAME", labelFontSize),
                        buildTextField(
                          (val) => firstName = val ?? '',
                          padding: formPadding,
                        ),
                        buildLabel("email", labelFontSize),
                        buildTextField(
                          (val) => email = val ?? '',
                          padding: formPadding,
                        ),
                        buildLabel("MOBILE NUMBER", labelFontSize),
                        buildTextField(
                          (val) => mobile = val ?? '',
                          keyboardType: TextInputType.phone,
                          padding: formPadding,
                        ),
                        SizedBox(height: verticalSpacing),
                        Text(
                          "WILL YOU BE ATTENDING BOTH OR DROPPING BY FOR A PORTION?",
                          style: GoogleFonts.montserrat(
                            fontSize: radioTitleFontSize,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                        SizedBox(height: verticalSpacing),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildRadioOption(
                              "Baby Kais\nDebut",
                              radioLabelFontSize,
                              radioCircleSize,
                            ),
                            buildRadioOption(
                              "Alyse + Jordan’s\nEngagement Party",
                              radioLabelFontSize,
                              radioCircleSize,
                            ),
                            buildRadioOption(
                              "Both",
                              radioLabelFontSize,
                              radioCircleSize,
                            ),
                          ],
                        ),
                        SizedBox(height: largeVerticalSpacing),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: verticalSpacing),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/x.svg",
                      height: svgSize,
                      width: svgSize,
                    ),
                    SizedBox(width: svgSpacing),
                    SvgPicture.asset(
                      "assets/y.svg",
                      height: svgSize,
                      width: svgSize,
                    ),
                  ],
                ),
              ],
            )
            : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildLabel("NAME", labelFontSize),
                          buildTextField(
                            (val) => firstName = val ?? '',
                            padding: formPadding,
                          ),
                          buildLabel("email", labelFontSize),
                          buildTextField(
                            (val) => email = val ?? '',
                            padding: formPadding,
                          ),
                          buildLabel("MOBILE NUMBER", labelFontSize),
                          buildTextField(
                            (val) => mobile = val ?? '',
                            keyboardType: TextInputType.phone,
                            padding: formPadding,
                          ),
                          SizedBox(height: verticalSpacing),
                          Text(
                            "WILL YOU BE ATTENDING BOTH OR DROPPING BY FOR A PORTION?",
                            style: GoogleFonts.montserrat(
                              fontSize: radioTitleFontSize,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                          SizedBox(height: verticalSpacing),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildRadioOption(
                                "Baby Kais\nDebut",
                                radioLabelFontSize,
                                radioCircleSize,
                              ),
                              buildRadioOption(
                                "Alyse + Jordan’s\nEngagement Party",
                                radioLabelFontSize,
                                radioCircleSize,
                              ),
                              buildRadioOption(
                                "Both",
                                radioLabelFontSize,
                                radioCircleSize,
                              ),
                            ],
                          ),
                          SizedBox(height: largeVerticalSpacing),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: svgSpacing),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/x.svg"),
                      SizedBox(width: svgSpacing),
                      SvgPicture.asset("assets/y.svg"),
                    ],
                  ),
                ),
              ],
            ),
        SizedBox(height: svgSpacing),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: textColor,
              padding: EdgeInsets.symmetric(
                horizontal: buttonHorizontalPadding,
                vertical: buttonVerticalPadding,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            onPressed: () async {
              if (_formKey.currentState?.validate() ?? false) {
                _formKey.currentState?.save();

                if (selectedOption == null || selectedOption!.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please select an option.')),
                  );
                  return;
                }

                final data = {
                  "name": firstName.trim(),
                  "phone": mobile.trim(),
                  "email": email.trim(),
                  "option": selectedOption?.replaceAll('\n', ' ').trim(),
                  "timestamp": FieldValue.serverTimestamp(),
                };

                try {
                  await FirebaseFirestore.instance
                      .collection('rsvps')
                      .add(data);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('RSVP submitted successfully!'),
                    ),
                  );
                  Navigator.of(context).pop();
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error submitting RSVP}')),
                  );
                }
              }
            },
            child: Text(
              "RSVP",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: buttonFontSize,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildLabel(String text, double fontSize) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 4),
      child: Text(
        text.toUpperCase(),
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
          color: textColor,
        ),
      ),
    );
  }

  Widget buildTextField(
    FormFieldSetter<String> onSaved, {
    TextInputType? keyboardType,
    required double padding,
  }) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      keyboardType: keyboardType,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: padding),
      ),
    );
  }

  Widget buildRadioOption(String label, double fontSize, double circleSize) {
    final isSelected = selectedOption == label;
    return GestureDetector(
      onTap: () => setState(() => selectedOption = label),
      child: Column(
        children: [
          Container(
            width: circleSize,
            height: circleSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? textColor : Colors.transparent,
              border: Border.all(color: textColor, width: 2),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label.toUpperCase(),
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}

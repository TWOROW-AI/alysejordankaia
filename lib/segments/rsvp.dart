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
    final screenWidth = MediaQuery.of(context).size.width;

    // Define breakpoints for responsiveness
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth <= 1024;

    // Dynamic sizing based on screen width
    final labelFontSize =
        isMobile
            ? 12.0
            : isTablet
            ? 13.0
            : 14.0;
    final radioLabelFontSize =
        isMobile
            ? 8.0
            : isTablet
            ? 11.0
            : 12.0;
    final radioTitleFontSize =
        isMobile
            ? 8.0
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
            ? 12.0
            : isTablet
            ? 20.0
            : 24.0;

    final buttonHorizontalPadding =
        isMobile
            ? 24.0
            : isTablet
            ? 32.0
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
            ? 40.0
            : 60.0;
    final radioCircleSize =
        isMobile
            ? 20.0
            : isTablet
            ? 44.0
            : 48.0;

    // Dynamic form width to prevent overflow
    final formWidth = screenWidth > 900 ? 900.0 : screenWidth * 0.9;

    return SingleChildScrollView(
      padding: EdgeInsets.all(isMobile ? 16.0 : 24.0), // Responsive padding
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: formWidth),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flex(
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: isMobile ? 0 : 2,
                  child: Form(
                    key: _formKey,
                    child: SizedBox(
                      width:
                          isMobile
                              ? formWidth
                              : null, // Constrain form width on mobile
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildLabel("Name", labelFontSize),
                          buildTextField(
                            (val) => firstName = val ?? '',
                            padding: formPadding,
                          ),
                          buildLabel("Email", labelFontSize),
                          buildTextField(
                            (val) => email = val ?? '',
                            padding: formPadding,
                          ),
                          buildLabel("Mobile Number", labelFontSize),
                          buildTextField(
                            (val) => mobile = val ?? '',
                            keyboardType: TextInputType.phone,
                            padding: formPadding,
                          ),
                          SizedBox(height: verticalSpacing),
                          Text(
                            "Will you be attending both or dropping by for a portion?",
                            style: GoogleFonts.montserrat(
                              fontSize: radioTitleFontSize,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                          SizedBox(height: verticalSpacing),
                          Wrap(
                            spacing:
                                isMobile
                                    ? 4.0
                                    : 8.0, // Adjusted spacing for mobile
                            runSpacing: 12.0,
                            alignment: WrapAlignment.center,
                            children: [
                              buildRadioOption(
                                "Baby Kais\nDebut",
                                radioLabelFontSize,
                                radioCircleSize,
                              ),
                              buildRadioOption(
                                "Alyse + Jordan’s\nEngagement",
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
                if (!isMobile) SizedBox(width: svgSpacing),
                if (!isMobile)
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/x.svg",
                          width: svgSize,
                          height: svgSize + 200,
                        ),
                        SizedBox(width: svgSpacing),
                        SvgPicture.asset(
                          "assets/y.svg",
                          width: svgSize,
                          height: svgSize + 50,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            if (isMobile) SizedBox(),
            // Padding(
            //   padding: EdgeInsets.only(bottom: verticalSpacing),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       SvgPicture.asset(
            //         "assets/x.svg",
            //         width: svgSize,
            //         height: svgSize,
            //       ),
            //       SizedBox(width: svgSpacing),
            //       SvgPicture.asset(
            //         "assets/y.svg",
            //         width: svgSize,
            //         height: svgSize,
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width:
                    isMobile
                        ? formWidth * 0.6
                        : formWidth * 0.4, // Responsive button width
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
                  onPressed: submitForm,
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
            ),
          ],
        ),
      ),
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

    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth <= 1024;

    final textWidth =
        isMobile
            ? screenWidth * 0.25
            : isTablet
            ? screenWidth * 0.15
            : 120.0;

    // Adjust spacing between circle and text dynamically
    final spacing =
        isMobile
            ? 6.0
            : isTablet
            ? 8.0
            : 10.0;

    return GestureDetector(
      onTap: () => setState(() => selectedOption = label),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
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
          SizedBox(height: spacing), // Dynamic spacing
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: textWidth, // Dynamic max width for text
              minWidth: 80.0, // Ensure a minimum width for readability
            ),
            child: Text(
              label.toUpperCase(),
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> submitForm() async {
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
        await FirebaseFirestore.instance.collection('rsvps').add(data);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('RSVP submitted successfully!')),
        );
        Navigator.of(context).pop();
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error submitting RSVP: $e')));
      }
    }
  }
}

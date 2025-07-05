import 'package:family_tree/constants/color_constants.dart';
import 'package:family_tree/constants/constants.dart';
import 'package:family_tree/utils/common_button.dart';
import 'package:flutter/material.dart';

import '../../utils/common_textstyles.dart';

class ExportScreen extends StatefulWidget {
  const ExportScreen({super.key});

  @override
  State<ExportScreen> createState() => _ExportScreenState();
}

class _ExportScreenState extends State<ExportScreen> {
  String? _selectedFormat;
  String? selectedOption;
  bool includeImages = false;
  bool includeContactDetails = false;
  bool includeBirthDate = false;
  bool includeAddress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.export, style: appBarStyle()),
        centerTitle: true,
        elevation: 1,
        shadowColor: Colors.grey,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(Constants.selectFormat, style: headingStyle()),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(Constants.selctFormatDetails, style: textfieldHint()),
            ),
            SizedBox(height: 20),
            _buildExportOption(
              Constants.exportAsPDF,
              Constants.exportAsPDFDetails,
              Constants.exportAsPDF,
              Icons.picture_as_pdf,
              Color(0xffdc2626),
              Color(0xfffee2e2),
            ),
            _buildExportOption(
              Constants.exportAsCSV,
              Constants.exportAsCSVDetails,
              Constants.exportAsCSV,
              Icons.table_chart,
              Color(0xff16a34a),
              Color(0xfff0fdf4),
            ),
            _buildExportOption(
              Constants.exportAsPNG,
              Constants.exportAsPNGDetails,
              Constants.exportAsPNG,
              Icons.image,
              Color(0xff2563eb),
              Color(0xffeff6ff),
            ),
            _buildCustomizations(),
          ],
        ),
      ),
    );
  }

  Widget _buildExportOption(
    String title,
    String details,
    String kValue,
    IconData icon,
    Color iconColor,
    Color backgroundColor,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
      child: Card(
        color: Colors.white,
        child: ListTile(
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 25),
          ),
          title: Text(title, style: textFieldLable()),
          subtitle: Text(details, style: textfieldHint()),
          contentPadding: EdgeInsets.all(10),
          trailing: Radio.adaptive(
            activeColor: ColorConstant.primaryColor,
            value: kValue,
            groupValue: _selectedFormat,
            onChanged: (value) {
              setState(() {
                _selectedFormat = value;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCustomizations() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(Constants.exportOptions, style: headingStyle()),
          SizedBox(height: 10),
          CheckboxListTile(
            activeColor: ColorConstant.primaryColor,

            value: includeImages,
            onChanged: (value) {
              setState(() {
                includeImages = value!;
              });
            },
            title: Text(Constants.includePhotos, style: textFieldLable()),
          ),
          CheckboxListTile(
            activeColor: ColorConstant.primaryColor,
            value: includeContactDetails,
            onChanged: (value) {
              setState(() {
                includeContactDetails = value!;
              });
            },
            title: Text(Constants.includeContactInfo, style: textFieldLable()),
          ),
          CheckboxListTile(
            activeColor: ColorConstant.primaryColor,
            value: includeAddress,
            onChanged: (value) {
              setState(() {
                includeAddress = value!;
              });
            },
            title: Text(Constants.includeAddress, style: textFieldLable()),
          ),
          CheckboxListTile(
            activeColor: ColorConstant.primaryColor,
            value: includeBirthDate,
            onChanged: (value) {
              setState(() {
                includeBirthDate = value!;
              });
            },
            title: Text(Constants.includeBirthDate, style: textFieldLable()),
          ),

          CommonButton(text: Constants.exportFamilyTree, onPressed: () {}),
        ],
      ),
    );
  }
}

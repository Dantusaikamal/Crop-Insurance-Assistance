import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ClaimFilingScreen extends StatefulWidget {
  const ClaimFilingScreen({Key? key}) : super(key: key);

  @override
  _ClaimFilingScreenState createState() => _ClaimFilingScreenState();
}

class _ClaimFilingScreenState extends State<ClaimFilingScreen> {
  PickedFile? _verificationImage;

  Future<void> _captureVerificationImage() async {
    final picker = ImagePicker();
    final image = await picker.getImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _verificationImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File a Claim'),
        backgroundColor: Colors.green[700],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Claim Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Policy Number',
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Claim Type',
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              maxLines: 4,
            ),
            SizedBox(height: 20),
            Text(
              'Live Verification',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
            ),
            SizedBox(height: 10),
            _verificationImage != null
                ? Image.file(
                    File(_verificationImage!.path),
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Container(),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _captureVerificationImage,
              child: Text(
                'Capture Verification Image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green[700],
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement the logic to submit the claim with live verification
              },
              child: Text(
                'Submit Claim',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green[700],
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

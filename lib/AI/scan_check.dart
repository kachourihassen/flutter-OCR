import 'dart:io';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'check_details.dart';

class Cam extends StatefulWidget {
  @override
  _CamState createState() => _CamState();
}

class _CamState extends State<Cam> {
  String _text = '';
  File _image;
  String result;

  Future loadModel() async {
    Tflite.close();
    try {
      String res;
      res = await Tflite.loadModel(
        model: "assets/model.tflite",
        labels: "assets/labels.txt",
      );
      print(res);
    } on PlatformException {
      print("Failed to load the model");
    }
  }

  Future predict(File image) async {
    var recognitions = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 2,
        threshold: 0.2,
        asynch: true);

    return recognitions;
  }

  Future _getImage() async {
    this._image = await ImagePicker.pickImage(source: ImageSource.camera);
    await predict(this._image).then((value) {
      print("value");
      print(value);
      if (value[0]['confidence'] < 0.55) {
        showCupertinoDialog(
            context: context,
            builder: (context) => Center(
                  child: Text('Ce n\'est pas un chèque'),
                ));
        setState(() {
          result = "not a check";
        });
      } else if (value[0]['label'] == "0 Signed checks") {
        scanText();
        setState(() {
          result = "signed check";
        });
        print("signed check");
      } else {
        scanText();
        setState(() {
          result = "unsigned check";
        });
        print("unsigned check");
      }
    });
  }

  Future scanText() async {
    showDialog(
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ),
        context: context);
    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFile(File(_image.path));
    final TextRecognizer textRecognizer =
        FirebaseVision.instance.textRecognizer();
    final VisionText visionText =
        await textRecognizer.processImage(visionImage);
    _text = visionText.text;
    _regex(_text);
  }

  Future<dynamic> _regex(String text) async {
    RegExp _bankname1 = new RegExp(r"(((?<=BANQUE).*)|((.*?).bank))");
    String _bankname = _bankname1.stringMatch(text).toString();
    print("Banque" + _bankname);

    RegExp _prix1 = new RegExp(
        r"((B.P \d.* DT)|(BPD \d.* DT)|((?<=B.P )|(?<=BPD ))\d.* DT)");
    String _prix = _prix1.stringMatch(text).toString();

    print("Montant" + _prix);

    RegExp _date1 = new RegExp(r"(\d{2}/\d{2}/\d{4})");
    String _date = _date1.stringMatch(text).toString();
    print("Date" + _date);

    RegExp _pays1 = new RegExp(
        r"((((?<=A).*) le (\d{2}/\d{2}/\d{4}))|(((?<=A).*)le(\d{2}/\d{2}/\d{4})))");
    String _pays = _pays1.stringMatch(text).toString();
    print("Pays" + _pays);

    RegExp _prixcarct1 = new RegExp(r"((?<=endossable).*)");
    RegExp _prixcarct2 = new RegExp(r"((?<=assimilé ).*)");
    String _prixcarct = _prixcarct1.stringMatch(text).toString() == null ||
            _prixcarct1.stringMatch(text).toString().length == 0
        ? _prixcarct2.stringMatch(text).toString()
        : _prixcarct1.stringMatch(text).toString();
    print("Prix en lettres" + _prixcarct);

    RegExp _tit1 = new RegExp(r"\d{20}");
    String _tit = _tit1.stringMatch(text).toString();
    print("Prix en lettres" + _tit);

    RegExp _ordre1 = new RegExp(
        r"(((?<=A lordre de).*)|((?<=Alordre de).*)|((?<=A l'ordre de).*)|((?<=AlTordre de).*)|((?<=Al'ordre de).*))");
    String _ordre = _ordre1.stringMatch(text).toString();

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ChequePage(
            signedSatus: result,
            chequeImage: _image,
            bankname: _bankname,
            prix: _prix,
            date: _date,
            pays: _pays,
            prixcarct: _prixcarct,
            tit: _tit,
            ordre: _ordre)));
  }

  @override
  void initState() {
    loadModel().then((value) => _getImage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Détection du chèque'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _getImage,
          child: Icon(Icons.add_a_photo),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: _image != null
              ? Image.file(
                  File(_image.path),
                  fit: BoxFit.fitWidth,
                )
              : Center(
                  child: Text(
                    'Cliquer sur le boutton pour scanner votre chèque',
                  ),
                ),
        ));
  }
}

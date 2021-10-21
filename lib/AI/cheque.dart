import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gestionuser/AI/camera.dart';
import 'package:image_picker/image_picker.dart';

class ChequePage extends StatefulWidget {
  final String bankname;
  final String prix;
  final String date;
  final String pays;
  final String prixcarct;
  final String tit;
  final String ordre;

  ChequePage(this.bankname, this.prix, this.date, this.pays, this.prixcarct,
      this.tit, this.ordre);
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ChequePage>
    with SingleTickerProviderStateMixin {
  TextEditingController _a = TextEditingController();
  TextEditingController _b = TextEditingController();
  TextEditingController _c = TextEditingController();
  TextEditingController _d = TextEditingController();
  TextEditingController _e = TextEditingController();
  TextEditingController _f = TextEditingController();
  TextEditingController _g = TextEditingController();

  bool _status = true;
  final ImagePicker _picker = ImagePicker();
  PickedFile _imageFile;
  final FocusNode myFocusNode = FocusNode();
  final _globalkey = GlobalKey<FormState>();
  bool circular = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
            color: Colors.white,
            child: Form(
              key: _globalkey,
              child: new ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      new Container(
                        height: 250.0,
                        color: Colors.white,
                        child: new Column(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(left: 20.0, top: 20.0),
                                child: new Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new IconButton(
                                        icon: Icon(Icons.arrow_back_sharp),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => Cam()),
                                          );
                                        }),

                                    //   Icons.arrow_back_ios,
                                    //   color: Colors.black,
                                    //   size: 22.0,

                                    // ),

                                    Padding(
                                      padding: EdgeInsets.only(left: 25.0),
                                      child: new Text('Mon chèque',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0,
                                              fontFamily: 'sans-serif-light',
                                              color: Colors.black)),
                                    )
                                  ],
                                )),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: new Stack(
                                  fit: StackFit.loose,
                                  children: <Widget>[
                                    new Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[imageProfile()],
                                    ),
                                  ]),
                            )
                          ],
                        ),
                      ),
                      new Container(
                        color: Color(0xffFFFFFF),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 25.0),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: new Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new Text(
                                            'Information du chèque',
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          _status
                                              ? _getEditIcon()
                                              : new Container(),
                                        ],
                                      )
                                    ],
                                  )),
                              Padding(
                                  //1
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new Text(
                                            'Nom de Bank',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                              Padding(
                                  //1
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Flexible(
                                        child: Material(
                                          elevation: 20.0,
                                          shadowColor: Colors.black12,
                                          child: new TextFormField(
                                            controller: _a =
                                                TextEditingController(
                                                    text: widget.bankname),
                                            validator: (value) {
                                              if (value.isEmpty)
                                                return " Can't be empty";

                                              return null;
                                            },
                                            decoration: const InputDecoration(
                                              hintText: "Enter Your bankname",
                                              hintStyle: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.redAccent),
                                            ),
                                            enabled: !_status,
                                            autofocus: !_status,
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                              Padding(
                                  //2
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new Text(
                                            'Montant',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                              Padding(
                                  //2
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Flexible(
                                        child: Material(
                                          elevation: 20.0,
                                          shadowColor: Colors.black12,
                                          child: new TextFormField(
                                            controller: _b =
                                                TextEditingController(
                                                    text: widget.prix),
                                            validator: (value) {
                                              if (value.isEmpty)
                                                return "  Can't be empty";

                                              return null;
                                            },
                                            decoration: const InputDecoration(
                                              hintText: "Enter Your Price",
                                              hintStyle: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.redAccent),
                                            ),
                                            enabled: !_status,
                                            autofocus: !_status,
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                              Padding(
                                  //3
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new Text(
                                            'Date',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                              Padding(
                                  //3
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Flexible(
                                        child: Material(
                                          elevation: 20.0,
                                          shadowColor: Colors.black12,
                                          child: new TextFormField(
                                            controller: _c =
                                                TextEditingController(
                                                    text: widget.date),
                                            validator: (value) {
                                              if (value.isEmpty)
                                                return " Can't be empty";

                                              return null;
                                            },
                                            decoration: const InputDecoration(
                                              hintText: "Enter Your Date",
                                              hintStyle: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.redAccent),
                                            ),
                                            enabled: !_status,
                                            autofocus: !_status,
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new Text(
                                            'Emplacement',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Flexible(
                                        child: Material(
                                          elevation: 20.0,
                                          shadowColor: Colors.black12,
                                          child: new TextFormField(
                                            autofocus: false,
                                            controller: _d =
                                                TextEditingController(
                                                    text: widget.pays),
                                            validator: (value) {
                                              if (value.isEmpty)
                                                return "Emplacement can't be empty";

                                              return null;
                                            },
                                            decoration: const InputDecoration(
                                                hintText: "Enter location",
                                                hintStyle: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.redAccent)),
                                            enabled: !_status,
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new Text(
                                            'Montant en toute character',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Flexible(
                                        child: Material(
                                          elevation: 20.0,
                                          shadowColor: Colors.black12,
                                          child: new TextFormField(
                                            autofocus: false,
                                            validator: (value) {
                                              if (value.isEmpty)
                                                return "Can't be empty";

                                              return null;
                                            },
                                            controller: _e =
                                                TextEditingController(
                                                    text: widget.prixcarct),
                                            decoration: const InputDecoration(
                                                hintText:
                                                    "Enter Amount in all character",
                                                hintStyle: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.redAccent)),
                                            enabled: !_status,
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new Text(
                                            'Titulaire',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Flexible(
                                        child: Material(
                                          elevation: 20.0,
                                          shadowColor: Colors.black12,
                                          child: new TextFormField(
                                            autofocus: false,
                                            validator: (value) {
                                              if (value.isEmpty)
                                                return "Can't be empty";

                                              return null;
                                            },
                                            controller: _f =
                                                TextEditingController(
                                                    text: widget.tit),
                                            decoration: const InputDecoration(
                                                hintText: "Enter Incumbent",
                                                hintStyle: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.redAccent)),
                                            enabled: !_status,
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                              Padding(
                                  //4
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new Text(
                                            'A l' 'ordre',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 2.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Flexible(
                                        child: Material(
                                          elevation: 20.0,
                                          shadowColor: Colors.black12,
                                          child: new TextFormField(
                                            autofocus: false,
                                            validator: (value) {
                                              if (value.isEmpty)
                                                return "Can't be empty";

                                              return null;
                                            },
                                            controller: _g =
                                                TextEditingController(
                                                    text: widget.ordre),
                                            decoration: const InputDecoration(
                                                hintText:
                                                    "Enter at the command of",
                                                hintStyle: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.redAccent)),
                                            enabled: !_status,
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                              !_status ? _getActionButtons() : new Container(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: _imageFile == null
              ? AssetImage("assets/images/3125988.jpg")
              : FileImage(File(_imageFile.path)),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.red,
              size: 35.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Photo de chéque",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Save"),
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Cancel"),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}

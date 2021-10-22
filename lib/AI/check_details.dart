import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChequePage extends StatefulWidget {
  final String bankname;
  final String prix;
  final String date;
  final String pays;
  final String prixcarct;
  final String tit;
  final String ordre;
  File chequeImage;
  String signedSatus;
  ChequePage(
      {this.signedSatus,
      this.chequeImage,
      this.bankname,
      this.prix,
      this.date,
      this.pays,
      this.prixcarct,
      this.tit,
      this.ordre});
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ChequePage>
    with SingleTickerProviderStateMixin {
  bool _status = false;
  final _globalkey = GlobalKey<FormState>();
  bool circular = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Détails du chèque"),
          actions: [],
        ),
        body: new Container(
            color: Colors.white,
            child: Form(
              key: _globalkey,
              child: new ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child:
                            new Stack(fit: StackFit.loose, children: <Widget>[
                          new Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[imageProfile()],
                          ),
                        ]),
                      ),
                      Padding(
                          //1
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    widget.signedSatus
                                                .compareTo("signed check") ==
                                            0
                                        ? "Ce chèque est signé"
                                        : "Ce chèque n'est pas signé",
                                    style: TextStyle(
                                        color: widget.signedSatus.compareTo(
                                                    "signed check") ==
                                                0
                                            ? Colors.green
                                            : Colors.red,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
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
                                            initialValue:
                                                widget.bankname == null
                                                    ? ""
                                                    : widget.bankname,
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
                                            initialValue: widget.prix == null
                                                ? ""
                                                : widget.prix,
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
                                            initialValue: widget.date == null
                                                ? ""
                                                : widget.date,
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
                                            initialValue: widget.pays == null
                                                ? ""
                                                : widget.pays,
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
                                            'Montant en toutes lettres',
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
                                            validator: (value) {
                                              if (value.isEmpty)
                                                return "Can't be empty";
                                              return null;
                                            },
                                            initialValue:
                                                widget.prixcarct == null
                                                    ? ""
                                                    : widget.prixcarct,
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
                                            validator: (value) {
                                              if (value.isEmpty)
                                                return "Can't be empty";
                                              return null;
                                            },
                                            initialValue: widget.tit == null
                                                ? ""
                                                : widget.tit,
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
                                            'A l' 'ordre de',
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
                                            validator: (value) {
                                              if (value.isEmpty)
                                                return "Can't be empty";

                                              return null;
                                            },
                                            initialValue: widget.ordre == null
                                                ? ""
                                                : widget.ordre,
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
    super.dispose();
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        Container(
            height: 200,
            width: MediaQuery.of(context).size.width - 50,
            child: Image.file(
              widget.chequeImage,
              fit: BoxFit.fitWidth,
            )),
      ]),
    );
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

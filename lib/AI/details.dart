import 'dart:developer';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'cheque.dart';

class Details extends StatefulWidget {
  final String text;
  Details(this.text);
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text('Détails'),
        actions: [
          IconButton(
            icon: Icon(Icons.copy),
            onPressed: () {
              FlutterClipboard.copy(widget.text).then((value) => _key
                  .currentState
                  .showSnackBar(new SnackBar(content: Text('Copied'))));
              log(" " + (widget.text));
            },
          ),
          IconButton(
            icon: Icon(Icons.all_inclusive),
            onPressed: () {
              _regex();
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        child: SelectableText(
            widget.text.isEmpty ? 'No Text Available' : widget.text),
      ),
    );
  }

  Future<dynamic> _regex() async {
    RegExp _bankname1 = new RegExp(r"(Attijari bank)|(BANQUE ZITOUNA)");
    String _bankname = _bankname1.stringMatch(widget.text).toString();

    RegExp _prix1 = new RegExp(
        r"((B.P \d.* DT)|(BPD \d.* DT)|((?<=B.P )|(?<=BPD ))\d.* DT)");
    String _prix = _prix1.stringMatch(widget.text).toString();

    RegExp _date1 = new RegExp(r"(\d{2}/\d{2}/\d{4})");
    String _date = _date1.stringMatch(widget.text).toString();

    RegExp _pays1 = new RegExp(r"(Tunis)|(tunis)");
    String _pays = _pays1.stringMatch(widget.text).toString();

    RegExp _prixcarct1 =
        new RegExp(r"(Sauf au profit d'une banque ou dun onrganisme assimilé)");
    String _prixcarct = _prixcarct1.stringMatch(widget.text).toString();

    RegExp _tit1 = new RegExp(r"\d{20}");
    String _tit = _tit1.stringMatch(widget.text).toString();

    RegExp _ordre1 = new RegExp(
        r"((?<=Alordre)|(?<=A l'ordre de)|(?<=AlTordre de)|(?<=Al'ordre de)).([^\s]+)");
    String _ordre = _ordre1.stringMatch(widget.text).toString();
    print("###################################");
    print((widget.text).toString());
    print("###################################");

    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ChequePage(
            _bankname, _prix, _date, _pays, _prixcarct, _tit, _ordre)));
  }
}

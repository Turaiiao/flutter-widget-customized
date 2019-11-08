import 'package:flutter/material.dart';

class ProgressDialogView {

  static showLoadingProgressDialog(BuildContext context) {
    showDialog(
      context: context,
      child: WillPopScope(
        child: AlertDialog(
          content: Row(
            children: <Widget>[
              CircularProgressIndicator(),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  '加载中', style: TextStyle(fontSize: 15),
                ),
              )
            ],
          ),
          contentPadding: EdgeInsets.all(20),
        ),
        onWillPop: () async {
          return Future.value(false);
        },
      )
    );
  }

  static dismissLoadingProgressDialog(BuildContext context) => Navigator.pop(context);

}

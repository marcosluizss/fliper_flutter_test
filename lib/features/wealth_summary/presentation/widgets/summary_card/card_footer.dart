import 'package:flutter/material.dart';

import '../../../../../theme.dart';

class CardFooter extends StatelessWidget {
  final bool hasHistory;

  CardFooter({
    this.hasHistory = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!hasHistory) {
      return Container();
    } else {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 26, bottom: 15),
            child: Divider(
              height: 1,
              color: COLOR_LIGTH_GRAY,
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 7),
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: COLOR_BLUE,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: COLOR_LIGTH_GRAY,
                      blurRadius: 1,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: () => _showAlert(context),
                  child: Text(
                    "VER MAIS",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              ))
        ],
      );
    }
  }

  _showAlert(BuildContext context) {
    final _alert = AlertDialog(
      title: Text("Deseja ver mais?"),
      content: Text(
        "Me contrate que irei usar minha experiência para ajudar a empresa a crescer e crescerei junto. Topa?",
        textAlign: TextAlign.justify,
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Sim.")),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Com certeza!")),
      ],
      elevation: 10,
    );

    showDialog(
      context: context,
      builder: (_) => _alert,
      barrierDismissible: false,
    );
  }

  ButtonStyle getButtonStyle() => OutlinedButton.styleFrom(
        primary: COLOR_BLUE,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        side: BorderSide(
          width: 1,
          color: COLOR_BLUE,
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 6,
        ),
        shadowColor: COLOR_BLACL_WITH_HALF_OPACITY,
        elevation: 3,
      );
}

import 'package:fliper_flutter_test/theme.dart';
import 'package:flutter/material.dart';

class CardFooter extends StatelessWidget {
  final bool hasHistory;
  const CardFooter({
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
            child: SizedBox(
              height: 32,
              child: OutlinedButton(
                style: getButtonStyle(),
                onPressed: () {},
                child: Text(
                  "VER MAIS",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ),
          )
        ],
      );
    }
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
        shadowColor: Color.fromRGBO(0, 0, 0, 0.5),
        elevation: 3,
      );
}

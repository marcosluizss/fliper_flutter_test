import 'package:flutter/material.dart';

class WealthSummaryPage extends StatelessWidget {
  const WealthSummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              margin: const EdgeInsets.only(left: 16, right: 14.5),
              child: Container(
                height: 352,
                padding: const EdgeInsets.only(
                  bottom: 14,
                  right: 24,
                  top: 25,
                  left: 23.5,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Seu resumo",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                              color: Color.fromRGBO(59, 92, 184, 1),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.more_vert,
                          color: Color.fromRGBO(154, 163, 188, 1),
                          size: 24,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Valor investido",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(96, 99, 119, 1),
                            ),
                          ),
                          Text(
                            "R\$ 3.200.876,00",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              color: Color.fromRGBO(59, 92, 184, 1),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Rentabilidade/mês",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(96, 99, 119, 1),
                                  ),
                                ),
                              ),
                              Text(
                                "2,767%",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: Color.fromRGBO(59, 92, 184, 1),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "CDI",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(96, 99, 119, 1),
                                  ),
                                ),
                              ),
                              Text(
                                "2,767%",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: Color.fromRGBO(59, 92, 184, 1),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Ganho/mês",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(96, 99, 119, 1),
                                  ),
                                ),
                              ),
                              Text(
                                "R\$ 18833,23",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: Color.fromRGBO(59, 92, 184, 1),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 26, bottom: 18),
                      child: Divider(),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          side: BorderSide(
                            width: 2,
                            color: Color.fromRGBO(59, 92, 184, 1),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "VER MAIS",
                          style: TextStyle(
                            color: Color.fromRGBO(59, 92, 184, 1),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

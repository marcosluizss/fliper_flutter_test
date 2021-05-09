import 'package:flutter/material.dart';

import '../../../../../injection_container.dart';
import '../../bloc/wealth_summary_bloc.dart';

const UPDATE_CHOICE = "Atualizar";

class CardHeader extends StatelessWidget {
  const CardHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final choices = [UPDATE_CHOICE, "Em breve", "Em breve"];

    return Row(
      children: [
        Expanded(
          child: Text(
            "Seu resumo",
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        SizedBox(
          height: 24,
          width: 24,
          child: PopupMenuButton<String>(
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).iconTheme.color,
              size: Theme.of(context).iconTheme.size,
            ),
            onSelected: onSelect,
            itemBuilder: (BuildContext context) {
              return choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        )
      ],
    );
  }
}

void onSelect(String choice) {
  if (choice == UPDATE_CHOICE) {
    sl<WealthSummaryBloc>().add(GetWealthSummaryForCard());
  }
}

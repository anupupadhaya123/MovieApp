import 'package:flutter/material.dart';
import 'package:movieapp/constants/constants.dart';

import 'icon_widget.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12.0, left: 12, right: 12),
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Theme.of(context).primaryColor)),
            child: Center(
              child: TextFormField(
                cursorColor:
                    Theme.of(context).primaryTextTheme.bodyText1?.color,
                decoration: InputDecoration(
                  hintText: 'Enter Movie Name',
                  border: InputBorder.none,
                  prefixIcon: IconButton(
                    icon: const IconWidget(
                      iconPath: MyIcons.search,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

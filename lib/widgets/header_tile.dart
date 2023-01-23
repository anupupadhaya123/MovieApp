import 'package:flutter/material.dart';
import 'package:movieapp/widgets/text2.dart';

class HeaderTile extends StatelessWidget {
  const HeaderTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, left: 12, right: 12, bottom: 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        radius: 30,
                        backgroundImage:
                            const AssetImage('assets/images/profile.png'),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Hello, ',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1
                                        ?.color),
                              ),
                              const Text(
                                'Arie !',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const Text2(
                            text: "Book Your favorite movie",
                            fontSize: 15,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      const CircleAvatar(child: Icon(Icons.notification_add))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

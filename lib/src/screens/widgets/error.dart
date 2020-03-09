import 'package:flutter/material.dart';

abstract class AppError extends StatelessWidget {
  const AppError({
    Key key,
    @required this.asset,
    @required this.title,
    this.subtitle = '',
  }) : super(key: key);

  final String asset, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 20.0),
          Image.asset(
            asset,
            width: MediaQuery.of(context).size.width / 2.5,
          ),
          const SizedBox(height: 10.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(subtitle ?? '')
        ],
      ),
    );
  }
}

class NetworkErrorWidget extends AppError {
  const NetworkErrorWidget({Key key, @required String title, String subtitle})
      : assert(title != null),
        super(
          key: key,
          asset: 'assets/network_error.png',
          title: title,
          subtitle: subtitle,
        );
}

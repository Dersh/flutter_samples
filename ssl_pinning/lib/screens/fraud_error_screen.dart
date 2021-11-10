import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FraudErrorScreen extends StatelessWidget {
  const FraudErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text(
        'Здесь описание того, что делать пользователю в случае несоответствия сертификата',
        textAlign: TextAlign.center,
      ),
    ));
  }
}

import 'package:flutter/material.dart';

class LoanDetailsPage extends StatefulWidget {
  const LoanDetailsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoanDetailsPageState();
  }
}

class _LoanDetailsPageState extends State<LoanDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loan Details')),
      body: const Center(child: Text('Details')),
    );
  }
}

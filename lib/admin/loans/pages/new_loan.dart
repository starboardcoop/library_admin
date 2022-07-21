import 'package:flutter/material.dart';
import 'package:library_admin/admin/common/widgets/save_button.dart';

class NewLoanPage extends StatefulWidget {
  const NewLoanPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NewLoanPageState();
  }
}

class _NewLoanPageState extends State<NewLoanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Loan')),
      body: const Center(child: Text('New Loan')),
      floatingActionButton: SaveButton(
        onPressed: () => Navigator.of(context).pop(),
        heroTag: 'SaveNewLoan',
      ),
    );
  }
}

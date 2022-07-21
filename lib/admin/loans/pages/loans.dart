import 'package:flutter/material.dart';
import 'package:library_admin/admin/common/widgets/add_button.dart';
import 'package:library_admin/admin/loans/pages/loan_details.dart';
import 'package:library_admin/admin/loans/pages/new_loan.dart';

class LoansPage extends StatefulWidget {
  const LoansPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoansPageState();
  }
}

class _LoansPageState extends State<LoansPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loans'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Loans'),
            TextButton(
              child: const Text('Details'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LoanDetailsPage(),
                ));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: AddButton(onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: ((context) => const NewLoanPage())));
      }),
    );
  }
}

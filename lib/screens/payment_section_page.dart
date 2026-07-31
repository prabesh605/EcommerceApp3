import 'package:ecommerce_app3/models/order_model.dart';
import 'package:ecommerce_app3/screens/khalti_screen.dart';
import 'package:ecommerce_app3/screens/user_order_screen.dart';
import 'package:ecommerce_app3/services/khalti_service.dart';
import 'package:flutter/material.dart';

class PaymentSectionPage extends StatefulWidget {
  const PaymentSectionPage({super.key, required this.order});
  final OrderModel order;

  @override
  State<PaymentSectionPage> createState() => _PaymentSectionPageState();
}

class _PaymentSectionPageState extends State<PaymentSectionPage> {
  KhaltiService khaltiService = KhaltiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Payment Section")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                Map<String, dynamic> data = await khaltiService
                    .getKhaltiPidxNumber();
                final pidxNumber = data['pidx'];
                final payment_url = data['payment_url'];
                if (pidxNumber != null && payment_url != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KhaltiScreen(
                        pidxNumber: pidxNumber,
                        paymentUrl: payment_url,
                        order: widget.order,
                      ),
                    ),
                  );
                } else {
                  print(pidxNumber);
                }
              },
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(),
                ),
                child: Image.asset('assets/khalti.png'),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(),
              ),
              child: Center(child: Text("Cash on Delivery")),
            ),
          ],
        ),
      ),
    );
  }
}

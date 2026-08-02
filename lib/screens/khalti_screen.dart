import 'package:ecommerce_app3/constants/strings.dart';
import 'package:ecommerce_app3/models/cart_model.dart';
import 'package:ecommerce_app3/models/order_model.dart';
import 'package:ecommerce_app3/screens/Navigation_screen.dart';
import 'package:ecommerce_app3/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:khalti_checkout_flutter/khalti_checkout_flutter.dart';

class KhaltiScreen extends StatefulWidget {
  const KhaltiScreen({
    super.key,
    required this.pidxNumber,
    required this.paymentUrl,
    required this.order,
  });
  final String pidxNumber;
  final String paymentUrl;
  final OrderModel order;

  @override
  State<KhaltiScreen> createState() => _KhaltiScreenState();
}

class _KhaltiScreenState extends State<KhaltiScreen> {
  late final Future<Khalti> khalti;
  FirebaseService service = FirebaseService();
  @override
  void initState() {
    final payConfig = KhaltiPayConfig(
      // publicKey: 'ff1cc42944b84efaad77e573bbaf9378',
      publicKey: '5c8cdd2f88be406d9f32fc7b51c7cb71',
      pidx: widget.pidxNumber,
      paymentUrl: widget.paymentUrl,
      environment: Environment.test,
    );
    khalti = Khalti.init(
      payConfig: payConfig,
      onPaymentResult: (paymentResult, khalti) {
        print(paymentResult.payload?.status);
        print(paymentResult.payload?.pidx);
        print(paymentResult.payload?.totalAmount);
        print(paymentResult.payload?.transactionId);

        onSuccess();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => NavigationScreen()),
        );
      },
      onReturn: () {
        print("abc");
      },

      onMessage:
          (
            khalti, {
            description,
            statusCode,
            event,
            needsPaymentConfirmation,
          }) async {
            print(
              'Description: $description, Status Code: $statusCode, Event: $event, NeedsPaymentConfirmation: $needsPaymentConfirmation',
            );
          },
    );
    super.initState();
  }

  Future<void> onSuccess() async {
    await service.addOrder(widget.order);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: khalti,
          initialData: null,
          builder: (context, snapshot) {
            final khaltiSnapshot = snapshot.data;
            if (khaltiSnapshot == null) {
              return const CircularProgressIndicator.adaptive();
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Rs. 100', style: TextStyle(fontSize: 25)),
                const Text('1 day fee'),
                OutlinedButton(
                  onPressed: () => khaltiSnapshot.open(context),
                  child: const Text('Pay with Khalti'),
                ),
                const SizedBox(height: 120),
              ],
            );
          },
        ),
      ),
    );
  }
}

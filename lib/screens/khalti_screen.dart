import 'package:flutter/material.dart';
import 'package:khalti_checkout_flutter/khalti_checkout_flutter.dart';

class KhaltiScreen extends StatefulWidget {
  const KhaltiScreen({
    super.key,
    required this.pidxNumber,
    required this.paymentUrl,
  });
  final String pidxNumber;
  final String paymentUrl;

  @override
  State<KhaltiScreen> createState() => _KhaltiScreenState();
}

class _KhaltiScreenState extends State<KhaltiScreen> {
  late final Future<Khalti> khalti;
  @override
  void initState() {
    final payConfig = KhaltiPayConfig(
      publicKey: 'ff1cc42944b84efaad77e573bbaf9378',
      pidx: widget.pidxNumber,
      paymentUrl: widget.paymentUrl,
      environment: Environment.test,
    );
    khalti = Khalti.init(
      payConfig: payConfig,
      onPaymentResult: (paymentResult, khalti) {
        print(paymentResult.toString());
      

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

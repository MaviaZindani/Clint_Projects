import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

method _paymentMethod1 = method.networkbank;


class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<method>(
          title: const Text('Net Banking'),
          value: method.networkbank,
          groupValue: _paymentMethod1,
          onChanged: (method? value){
            setState(() {
              _paymentMethod1 = value!;
            });
          }
          ),
           RadioListTile<method>(
            title: const Text('Card/Dabit card'),
          value: method.card,
          groupValue: _paymentMethod1,
          onChanged: (method? value){
            setState(() {
              _paymentMethod1 = value!;
            });
          }
          ),
      ],
    );
  }
}

enum method{networkbank, card}
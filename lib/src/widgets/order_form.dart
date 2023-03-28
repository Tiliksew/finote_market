import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:cart_stepper/cart_stepper.dart';

class OrderForm extends StatefulWidget {
  const OrderForm({super.key});

  @override
  State<OrderForm> createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _nameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _addressFieldKey = GlobalKey<FormBuilderFieldState>();
  TextEditingController pn = TextEditingController();
  int _counter = 1;
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            FormBuilderTextField(
              controller: pn,
              key: _nameFieldKey,
              name: 'name',
              decoration: const InputDecoration(labelText: 'Name'),
              // validator: FormBuilderValidators.compose([
              //   FormBuilderValidators.required(),
              //   FormBuilderValidators.email(),
              // ]),
            ),
            IntlPhoneField(
              decoration: const InputDecoration(
                  labelText: 'Phone Number', border: UnderlineInputBorder()),
              initialCountryCode: 'ET',
              countries: const ['ET'],
              onChanged: (phone) {},
            ),
            FormBuilderTextField(
              key: _addressFieldKey,
              name: 'address',
              decoration: const InputDecoration(labelText: 'Address'),
              // validator: FormBuilderValidators.compose([
              //   FormBuilderValidators.required(),
              //   FormBuilderValidators.email(),
              // ]),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(2.0, 8, 8, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Quantity"),
                  CartStepperInt(
                    count: _counter,
                    elevation: 5,
                    size: 35,
                    // style: CartStepperTheme.of(context).copyWith(activeForegroundColor: Theme.of(context).primaryColor),
                    didChangeCount: (count) {
                      setState(() {
                        _counter = count;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
              child: FilledButton(
                child: const Text('Submit'),
                onPressed: () async {
                  Get.back();
                  // ignore: dead_code
                  if (/*await checkIfEmailExists()*/ false) {
                    // Either invalidate using Form Key
                    _formKey.currentState?.invalidateField(
                        name: 'email', errorText: 'Email already taken.');
                    // OR invalidate using Field Key
                    _nameFieldKey.currentState
                        ?.invalidate('Name is already taken');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:electronicshop/screens/mainscreen.dart';
import 'package:electronicshop/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class DetailForm extends StatefulWidget {
  const DetailForm({Key? key}) : super(key: key);

  static final String id = "DetailForm";

  @override
  State<DetailForm> createState() => _DetailFormState();
}

class _DetailFormState extends State<DetailForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController dateInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Form")),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Detailform(
                icon: Icons.person,
                hint: "Name",
                label: "Name",
                returnText: "Plese Enter Your Name",
              ),
                          Detailform(
                icon: Icons.location_on,
                hint: "Billing Address",
                label: "Billing Address",
                returnText: "Plese Enter Your Billing Address",
              ),
              Detailform(
                icon: Icons.location_on,
                hint: "Delivery Address",
                label: "Delivery Address",
                returnText: "Plese Enter Your Delivery Address",
              ),
              Detailform(
                icon: Icons.phone,
                hint: "Phone Number",
                label: "Phone Number",
                returnText: "Plese Enter Your Phone Number",
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                controller: dateInput,
                decoration: InputDecoration(
                    icon: Icon(Icons.calendar_today,color: Colors.deepPurple,),
                    hintText: "Date",
                    labelText: "Date",

                    
                    ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2100));
 
                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    setState(() {
                      dateInput.text =
                          formattedDate;
                    });
                  } else {}
                },
            ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () async{
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );

                        // Navigator.pushReplacementNamed(context, MainPage.id);
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Detailform extends StatelessWidget {
  final IconData icon;
  final String hint;
  final String label;
  final String returnText;
  Detailform({required this.icon, required this.hint,required this.label,required this.returnText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        style: TextStyle(color: Colors.deepPurple),
        decoration: InputDecoration(
          
            icon: Icon(icon,color: Colors.deepPurple,),
            hintText: hint,
            labelText: label,
            hintStyle: TextStyle(
              fontSize: 20,
              color: Colors.deepPurple,
            )),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return returnText;
          }
          return null;
        },
      ),
    );
  }
}

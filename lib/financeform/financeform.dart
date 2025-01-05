import 'package:flutter/material.dart';

class FinanceForm extends StatefulWidget {
  const FinanceForm({super.key});

  @override
  State<FinanceForm> createState() => _FinanceFormState();
}

class _FinanceFormState extends State<FinanceForm> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();
  String _transactionType = 'Income';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Ambil data yang dimasukkan dan kembali ke HomePage
      String description = _descriptionController.text;
      double amount = double.tryParse(_amountController.text) ?? 0;
      if(_transactionType == 'Expense'){
        amount *= -1;
      }
      String date = _dateController.text;

      // Kembali ke HomePage dengan data transaksi yang baru
      Navigator.pop(context,
          {'description': description, 'amount': amount, 'date': date});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 80, 56, 188),
      ),
      backgroundColor: Color.fromARGB(255, 80, 56, 188),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 25),
              Align(
                alignment: Alignment(-0.95, 0.0),
                child: Text(
                  'Description',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 15,
                  ),
                ),
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), // Rounded corners
                  ),
                ),
                style: TextStyle(color: Colors.black),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 25),
              Align(
                alignment: Alignment(-0.95, 0.0),
                child: Text(
                  'Amount',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 15,
                  ),
                ),
              ),
              // Amount field
              TextFormField(
                controller: _amountController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), // Rounded corners
                  ),
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  return null;
                },
              ),
              SizedBox(height: 25),
              Align(
                alignment: Alignment(-0.95, 0.0),
                child: Text(
                  'Date',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 15,
                  ),
                ),
              ),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), // Rounded corners
                  ),
                ),
                style: TextStyle(color: Colors.black),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 25),
              Align(
                alignment: Alignment(1, 0),
                child: Row(
                  children: [
                    Text('Income', style: TextStyle(color: Colors.white, fontFamily: 'Inter', fontSize: 15)),
                    Radio<String>(
                      value: 'Income',
                      groupValue: _transactionType,
                      onChanged: (String? value) {
                        setState(() {
                          _transactionType = value!;
                        });
                      },
                    ),
                    Text('Expense', style: TextStyle(color: Colors.white, fontFamily: 'Inter', fontSize: 15)),
                    Radio<String>(
                      value: 'Expense',
                      groupValue: _transactionType,
                      onChanged: (String? value) {
                        setState(() {
                          _transactionType = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              // Submit button
              ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 80, 56, 188)),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

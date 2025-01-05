import 'package:flutter/material.dart';
import 'package:ristekpay/financeform/financeform.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _transactions = [];
  double _saldoUser = 0;

  void _addTransactions(Map<String, dynamic> transaction) {
    setState(() {
      _transactions.add(transaction);
      _saldoUser += transaction['amount'];
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 80, 56, 188),
      ),
      backgroundColor: Color.fromARGB(255, 80, 56, 188),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 250,
                child: Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(-0.8, -0.5),
                          child: CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage('assets/test.png')),
                        ),
                        Align(
                          alignment: Alignment(0.05, -0.55),
                          child: Text(
                            'Dummy Test',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0.075, -0.3),
                          child: Text(
                            '+62 812-8990-2781',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.775, 0.2),
                          child: Text(
                            'Bio',
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.15, 0.42),
                          child: Text(
                            'The Witcher 3 is the best game of all time',
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.755, 0.75),
                          child: Text(
                            'Balance',
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0.75, 0.75),
                          child: Text(
                            'Rp ${_saldoUser.toString()}',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Inter',
                                color: _saldoUser >= 0
                                    ? Colors.green
                                    : Colors.red),
                          ),
                        ),
                      ],
                    )),
              ),
              SizedBox(height: 25),
              Column(
                children: _transactions.map((transaction) {
                  return SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment(-0.775, -0.4),
                            child: Text('${transaction['description']}',
                            style: TextStyle(fontSize: 17, fontFamily: 'Inter', color: Colors.black)),
                          ),
                          Align(
                            alignment: Alignment(-0.77, 0.4),
                            child: Text('${transaction['date']}',
                            style: TextStyle(fontSize: 12, fontFamily: 'Inter', color: Colors.black)),
                          ),
                          Align(
                            alignment: Alignment(0.8, 0),
                            child: Text('Rp ${transaction['amount'].abs()}',
                            style: TextStyle(fontSize: 18, fontFamily: 'Inter', color: transaction['amount'] > 0 ? Colors.green : Colors.red)),
                          ),
                        ],
                      )
                    ),
                  );
                }).toList(), // Convert Iterable to List of Widgets
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FinanceForm()));
                    if (result != null) {
                      _addTransactions(result);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 87.5, vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: const Text(
                    'Add Income / Expense',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 17,
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

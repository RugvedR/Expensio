import './widgets/transaction_list.dart';

import './models/transaction.dart';

import './widgets/new_transaction.dart';

// import './widgets/user_transactions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  
  final List<Transaction> _userTransactions = [
    Transaction(id: 't1', title: 'New Shoes', amount: 99.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'Something', amount: 78.29, date: DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, double txAmount){
    final newTx = Transaction(id: DateTime.now().toString(), title: txTitle, amount: txAmount, date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }


  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_) {
      return GestureDetector(
        onTap: (){},
        child: NewTransaction(_addNewTransaction),
        behavior: HitTestBehavior.opaque,
      );
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expensio'),
        actions: [
          IconButton(onPressed: ()=> _startAddNewTransaction(context), icon: Icon(Icons.add)),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('CHART here'),
            ),
          ),
          
        TransactionList(_userTransactions),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=> _startAddNewTransaction(context),
      ),  
    );
  }
}

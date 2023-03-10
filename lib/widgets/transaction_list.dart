import '../models/transaction.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  // const TransactionList({ Key? key }) : super(key: key);

  late final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty ? Column(
        children: [
          Text('No transactions added yet!', style: Theme.of(context).textTheme.headline6,),
          SizedBox(height: 20,),
          Container(
            height: 200,
            child: Image.asset('assets/images/waiting.png',fit: BoxFit.cover,)
          )
        ],
      ) : ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor, width: 1)),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    '\u{20B9} ${transactions[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6
                    ),
                    Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}

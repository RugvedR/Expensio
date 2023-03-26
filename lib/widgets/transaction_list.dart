import '../models/transaction.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  // const TransactionList({ Key? key }) : super(key: key);

  late final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: FittedBox(
                        child: Text(
                          '\u{20B9} ${transactions[index].amount.toStringAsFixed(2)}',
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle:
                      Text(DateFormat.yMMMd().format(transactions[index].date)),
                  trailing: MediaQuery.of(context).size.width > 500
                      ? TextButton.icon(
                          onPressed: () => deleteTx(transactions[index].id),
                          style: TextButton.styleFrom(
                            primary: Theme.of(context).errorColor,
                          ),
                          icon: Icon(Icons.delete),
                          label: Text('Delete '))
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () => deleteTx(transactions[index].id),
                        ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}


// Card(
//             child: Row(
//               children: [
//                 Container(
//                   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
//                   decoration: BoxDecoration(
//                       border: Border.all(color: Theme.of(context).primaryColor, width: 1)),
//                   padding: EdgeInsets.all(8),
//                   child: Text(
//                     '\u{20B9} ${transactions[index].amount.toStringAsFixed(2)}',
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                         color: Theme.of(context).primaryColor),
//                   ),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       transactions[index].title,
//                       style: Theme.of(context).textTheme.headline6
//                     ),
//                     Text(
//                       DateFormat.yMMMd().format(transactions[index].date),
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           );
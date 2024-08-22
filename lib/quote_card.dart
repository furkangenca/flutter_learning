
import 'package:flutter/material.dart';
import 'quote.dart';



class QuoteCard extends StatelessWidget {

  final Quote quote;
  final void Function() delete;
  QuoteCard({ required this.quote, required this.delete });


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              quote.text,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,

              ),
            ),
            SizedBox(height: 6,),
            Text(
              quote.author,
              style: TextStyle(
                fontSize: 14,
                color: Colors.amberAccent,
                fontWeight: FontWeight.bold,

                letterSpacing: 2.5,
              ),
            ),
            SizedBox(height: 5,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton.icon(
                    onPressed: delete,
                    label: Text('Alıntıyı Sil'),
                    icon: Icon(Icons.delete),

                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
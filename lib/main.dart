import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() => runApp(MaterialApp(
  home: QuoteList()
    
));

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  List<Quote> quotes = [
    Quote(author: 'Nietzsche', text:'Dindarlığınızı tanrıya gösterin, bana insanlığınız lazım.'),
    Quote(author: 'Osho', text:'İnsan sustuklarını duyan biriyle bir ömür geçirebilir.'),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text('My Quotes', style: TextStyle(
          color: Colors.white,
          letterSpacing: 10,
          fontFamily: 'Amsterdam',
        )

        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,

      ),
      body: Column(
        children: quotes.map( (quote) => QuoteCard(
            quote: quote,
            delete: () {
              setState(() {
                quotes.remove(quote);
              });
            }
                      )).toList(),


      ),

    );
  }
}



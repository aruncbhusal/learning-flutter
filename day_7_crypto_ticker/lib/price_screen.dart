import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// We only want the Platform class here so we can import selectively
import "dart:io" show Platform;
// There's also a 'hide' to hide a specific class or entity, or 'as' to set an alias

import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = currenciesList[0];
  CoinData coinData = CoinData();
  Map<String,String> rates = {};

  // I had forgotten that initState method exists
  @override
  void initState(){
    super.initState();
    for (String item in cryptoList) rates[item] = '?';
    getData();
  }

  // void getData() async{
  //     var data = await coinData.getSingleExchange('BTC', selectedCurrency.toLowerCase());
  //     setState(() {
  //       rate = data;
  //     });
  // }

  void getData() async{
    try {
      var data = await coinData.getMultipleExchange(
          selectedCurrency.toLowerCase());
      if (!mounted) return;
      setState(() {
        for (String item in cryptoList)
          rates[item] = data[item];
      });
    } catch (e) {
      print(e);
      for (String item in cryptoList)
        rates[item] = 'N/A';
    }
  }

  // List<DropdownMenuEntry<String>> getDropdownEntries(stringList) {}
  // List<Widget> getPickerEntries(stringList) {}
  // Obsoleted

  // We can also create methods to return the Dropdown and Picker widgets themselves
  DropdownMenu androidDropdown(){
    // And while we're at it why not get entries for this widget inside this method rather than having a separate method for it?
    List<DropdownMenuEntry<String>> dropdownEntries = [];
    for (String item in currenciesList){
      dropdownEntries.add(DropdownMenuEntry(value: item, label: item));
    }

    return DropdownMenu(
      initialSelection: selectedCurrency,
      dropdownMenuEntries: dropdownEntries,
      onSelected: (value){
        setState(() {
          selectedCurrency = value??selectedCurrency;
        });
        getData();
        }
    );
  }

  // Similarly for the Cupertino Picker
  CupertinoPicker iosPicker(){
    List<Widget> pickerEntries = [];
    for (String item in currenciesList){
      pickerEntries.add(Text(item));
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      children: pickerEntries,
      onSelectedItemChanged: (int value){
        setState(() {
          selectedCurrency = currenciesList[value]??selectedCurrency;
        });
        getData();
      },
    );
  }

  // Now we can create a method to return the appropriate widget depending on the platform
  // To know what to return, we can import the dart io library (inbuilt)
  // Widget getPicker(){}

  // Let's now create a method to return a list of cards for each cryptocurrency
  List<Card> getCards() {
    List<Card> cards = [];
    for (String item in cryptoList) {
      cards.add(Card(
        color: Colors.indigoAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Column(
            children: [
              Text(
                (cryptoMap[item] ?? "").toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white70,
                  ),
              ),
              Text(
                '1 $item = ${rates[item]} $selectedCurrency',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ]
          )
        ),
      ));
    }
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('Crypto Watch 👀⌚')
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: getCards(),
               ),
               Text('Price data by CoinGecko',
               textAlign: TextAlign.end,
               style: TextStyle(
                 fontSize: 12.0,
                 color: Colors.white70,
               ),
               )
             ]
            )
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.indigo,
            // Rather than having a method for a single if statement, it's better to write it here
            child: Platform.isIOS ? iosPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}

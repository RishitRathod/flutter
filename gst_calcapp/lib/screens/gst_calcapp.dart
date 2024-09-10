import 'package:flutter/material.dart';

class GstCalcScreen extends StatefulWidget {
  const GstCalcScreen({super.key});

  @override
  State<GstCalcScreen> createState() => _GstCalcScreenState();
}

class _GstCalcScreenState extends State<GstCalcScreen> {
  TextEditingController txtAmt = TextEditingController();
  TextEditingController txtGst = TextEditingController();
  TextEditingController txtTotalAmnt = TextEditingController();

  var igst = 0.0;
  var cgst = 0.0;
  var sgst = 0.0;
  bool isGST = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GST Calculator"),
      ),
      body: Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          SwitchListTile(
            value: isGST, 
            onChanged: (v){setState(() {
              isGST= v;
            });},
            title:Text('GST'),
          ),
          TextField(
            controller: txtAmt,
            decoration: InputDecoration(
              hintText: "Product Amount",
              labelText: "Amount",
            ),
          ),
          TextField(
            controller: txtGst,
            decoration: InputDecoration(
              hintText: "Gst Percentage",
              labelText: "GST%",
            ),
          ),
          Text('SGST : ${sgst.toStringAsFixed(2)}'),
          Text('CGST : ${cgst.toStringAsFixed(2)}'),
          Text('IGST : ${igst.toStringAsFixed(2)}'),
          TextField(
            controller: txtTotalAmnt,
            decoration: InputDecoration(
              hintText: "Total Amount",
              labelText: "Total Amount",
            ),
          ),
          ElevatedButton(onPressed: () {
            if(isGST){
              if(txtAmt.text.isNotEmpty && txtGst.text.isNotEmpty){
              igst = double.parse(txtAmt.text) * 
                double.parse(txtGst.text) * 0.01 ;

              cgst = igst * 0.05;

              sgst = igst * 0.05;

              txtTotalAmnt.text =(double.parse(txtAmt.text) + igst).toString();
              setState(() {}); 
              }
            }
            else{
              if(txtAmt.text.isNotEmpty && txtGst.text.isNotEmpty){
                var amnt = double.parse(txtTotalAmnt.text)/(1+(double.parse(txtGst.text))*0.01);
              igst =amnt * double.parse(txtGst.text) * 0.01 ;

              cgst = igst * 0.05;

              sgst = igst * 0.05;

              txtTotalAmnt.text =(double.parse(txtAmt.text) + igst).toString();
              setState(() {}); 
            }
            }
          }, child: Text("Calculate")),
        ],
      ),
    );
  }
}
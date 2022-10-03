import 'package:flutter/material.dart';
import 'package:account_name_checker/account_name_checker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AccountWidget(),
    );
  }
}

class AccountWidget extends StatefulWidget {
  //const AccountWidget({Key? key}) : super(key: key);

  @override
  _AccountWidgetState createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  String name = '';
  String result = '';
  String bankCode;
  String bankName;
  List _bankCodes = ['044', '063', '050', '035', '232', '033', '011', '215', ];
  List banks = ['Access Bank', 'Diamond Bank', 'Ecobank', 'Wema Bank', 'Sterling Bank', 'United Bank Of Africa', 'First Bank', 'Unity Bank', ];
  void testing ()async {
    result = await GetAccountName().getName(name, bankCode);
    setState(() {

    });
    print(result);
  }
  @override
  void initState() {
    //testing();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: Text('Get Account Name'),
        elevation: 0,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 50,),
              SizedBox(
                width: MediaQuery.of(context).size.width/1.6,
                child: Container(

                  color: Colors.purple[300],
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Account Number',),
                    style: TextStyle(fontSize: 18),
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },),
                ),),
              SizedBox(height: 15),
              SizedBox(
                width: MediaQuery.of(context).size.width/1.7,
                //height: MediaQuery.of(context).size.height /,
                child: DropdownButton(
                  value: bankName,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  onChanged: (val) {
                    setState(() {
                      bankName = val;
                      for(int i = 0; i < banks.length; i++){
                        if(bankName == banks[i]){
                          setState(() {
                            bankCode = _bankCodes[i];
                            print(bankCode);
                          });
                        }
                      }
                    });
                  },
                  items: banks.map((deciders) {
                    return DropdownMenuItem(
                      child: new Text(deciders),
                      value: deciders,
                    );
                  }).toList(),

                ),),
              SizedBox(height: 15),
              Container(
                  width: MediaQuery.of(context).size.width/1.6,
                  child: ElevatedButton(onPressed: (){
                    setState(() {
                      testing();
                    });
                    setState(() {

                    });
                  }, child: Text('Get Account Name'), style: ElevatedButton.styleFrom(primary: Colors.purple),)),
              Text(result),
            ],
          ),

        ),),
    );
  }
}



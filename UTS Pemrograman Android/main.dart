import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTS',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

}
class _HomeState extends State<Home> {
  String _nama = '';
  String _nim = '';
  String _fgr = '';

void myDialog(BuildContext ctx){
  showDialog(
      context: ctx,
      builder: (BuildContext konteks){
        return AlertDialog(
          title: Text('Data Diri'),
          content: Wrap(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('${_nama}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('${_nim}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('${_fgr}'),
                ],
              ),
              Image(
                  image: NetworkImage('https://image.cnbcfm.com/api/v1/image/107195139-16764820942023-02-15t172517z_782088734_rc2tbz9o904n_rtrmadp_0_britain-politics-sunak-gates.jpeg?v=1684782779')
              )
            ],
          ),
          actions: [
            ElevatedButton(
                onPressed: ()=> Navigator.of(konteks).pop(),
                child: Text('Close')
            ),
          ],
        );
      },
  );
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('UTS-AlfianDwiki-19201199'),
        ),
        body: Center(
          child: Column(children: [
            Text('Data'),
            TextField(
              decoration: InputDecoration(hintText: 'Nama'),
              onChanged: (text) {
                var textInput = text;
                if (textInput != null) {
                  setState(() {
                    _nama = textInput;
                  });
                }
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Nim'),
              onChanged: (text) {
                var dataInput = text;
                if (dataInput != null) {
                  setState(() {
                    _nim = dataInput;
                  });
                }
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Tokoh Favorit'),
              onChanged: (text) {
                var textInput = text;
                if (textInput != null) {
                  setState(() {
                    _fgr = textInput;
                  });
                }
              },
            ),
            ElevatedButton(onPressed: ()=> myDialog(context),
                child:
                Text('Submit'),
            )
          ]),
        ));
  }
}
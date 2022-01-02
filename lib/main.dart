// UAS - Lukman Bayhaqi - 41820110059

import 'package:flutter/material.dart'; 
void main() => runApp(const MyApp()); 

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

   @override 
   Widget build(BuildContext context) {
      return const MaterialApp(
         home: TestForm(), 
         debugShowCheckedModeBanner: false,
      ); 
   }
}

class TestForm extends StatefulWidget {
  const TestForm({Key? key}) : super(key: key);

  @override
  _TestFormState createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  final fullName = TextEditingController();
  final nim = TextEditingController();

  @override
  void dispose() {
    fullName.dispose();
    nim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UAS'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Image.network('https://www.mercubuana.ac.id/img/logo_baru_umb.jpg'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: fullName,
                decoration: const InputDecoration(
                  hintText: 'Nama Lengkap'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: nim,
                decoration: const InputDecoration(
                  hintText: 'NIM'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40), // fromHeight use double.infinity as width and 40 is the height
                ),
                onPressed: () {
                  Navigator.push( 
                    context, 
                    MaterialPageRoute( 
                        builder: (context) => ConfirmPage(fullName: fullName.text, nim: nim.text), 
                    ), 
                  ); 
                },
                child: const Text('Go'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConfirmPage extends StatelessWidget {
   const ConfirmPage({Key? key, required this.fullName, required this.nim}) : super(key: key); 
   final String fullName; 
   final String nim; 
   
   @override 
   Widget build(BuildContext context) {
      return Scaffold(
         appBar: AppBar(
          title: const Text("Konsfirmasi"), 
          backgroundColor: Colors.red,
         ), 
         body: Container( 
               padding: const EdgeInsets.all(20.0), 
               child: Column( 
                  mainAxisAlignment: MainAxisAlignment.start, 
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  children: <Widget>[ 
                    const Text("Nama-Lengkap"),
                    Text(fullName, style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    const Text("NIM"),
                    Text(nim, style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]
               ), 
            ), 
         ); 
   } 
}

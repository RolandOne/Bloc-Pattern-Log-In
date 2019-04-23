import 'package:blocpatternlogin/bloc.dart';
import 'package:blocpatternlogin/pagetwo.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  
  final bloc = Bloc();

  changeThePage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PageTwo()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Pattern'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<String>(
                stream: bloc.email,
                builder: (context, snapshot) => TextField(
                      onChanged: bloc.emailChanged,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter email",
                          labelText: "Email",
                          errorText: snapshot.error),
                    ),
              ),
              SizedBox(
                height: 20.0,
              ),
              StreamBuilder<String>(
                stream: bloc.password,
                builder: (context, snapshot) => TextField(
                      onChanged: bloc.passwordChanged,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter password',
                          labelText: 'Password',
                          errorText: snapshot.error),
                    ),
              ),
              SizedBox(
                height: 20.0,
              ),
              StreamBuilder<List<dynamic>>(
                stream: bloc.submitCheck,
                builder: (context, snapshot) => RaisedButton(
                      color: Colors.teal,
                      onPressed: (snapshot.hasData)
                          ? () => print(snapshot.data)
                          : null,
                      child: Text('Submit'),
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

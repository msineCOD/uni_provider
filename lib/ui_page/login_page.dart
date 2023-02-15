import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uniprovider/custom_view/textfiled.dart';
import 'package:uniprovider/provider/login_provider/login_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Login ',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              Text('email'),
              Consumer <LoginProvider>(builder: (context, provider, child) {
                return TextFiledCu(
                  obscureText: false,
                  borderColor: Colors.black,
                  width: 1,
                  suffixIcon: SizedBox(),
                  icon: provider.checkEmail ? Icon(Icons.check) : SizedBox(),
                  borderRadius: 25,
                  onTap: (){},
                  onChange: (value) {

                    provider.checkEmails(value);
                  },
                );
              }),

              Text('password'),
              Consumer<LoginProvider>(builder: (context, provider, child) {
                return TextFiledCu(
                  obscureText: false,
                  borderColor: Colors.black,
                  width: 1,
                  suffixIcon: SizedBox(),
                  icon: provider.checkPass ? Icon(Icons.check):SizedBox(),
                  borderRadius: 25,
                  onTap: (){},
                  onChange: (value) {
                    provider.checkPassword(value);
                  },
                );
              },),

              
              ElevatedButton(onPressed: (){}, child: Text('login'))
              
              


            ],
          ),
        ),
      ),
    );
  }
}

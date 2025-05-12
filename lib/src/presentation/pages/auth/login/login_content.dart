import 'package:flutter/material.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome',
            style: TextStyle(
              fontSize: 25
            ),
          ),
          Text('back...', style: TextStyle(
              fontSize: 25
            ),
          ),
          Text('Log in', style: TextStyle(
              fontSize: 22
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              label: Text('Email'),
              prefixIcon: Icon(Icons.email)
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              label: Text('Password'),
              prefixIcon: Icon(Icons.password)
            ),
          ),
          ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.cyan
            ),
            child: Text('Sign in', style: TextStyle(color: Colors.white),)
          )
        ],
      ),
    );
  }
}
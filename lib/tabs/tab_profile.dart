import 'package:flutter/material.dart';
import 'package:simple_shopping/models/model_auth.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    final authClient =
        Provider.of<FirebaseAuthProvider>(context, listen: false);
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Profile'),
        TextButton(
            onPressed: () async {
              await authClient.logout();

              if (!mounted) return;
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                    const SnackBar(content: Text('Success to logout')));
              Navigator.of(context).pushReplacementNamed('/login');
            },
            child: const Text('Logout'))
      ],
    ));
  }
}

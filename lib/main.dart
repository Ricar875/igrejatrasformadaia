import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'screens/cadastro_igreja.dart';
import 'services/firebase_service.dart';
import 'firebase_options.dart'; // gerado pelo FlutterFire

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseService>(
          create: (_) => FirebaseService(),
        ),
      ],
      child: MaterialApp(
        title: 'Igreja Saudável',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          useMaterial3: true,
        ),
        home: CadastroIgrejaScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

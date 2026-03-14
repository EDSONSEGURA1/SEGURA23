import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Botones y TextField')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Caja de texto básica
              const TextField(),

              const SizedBox(height: 20),

              // Caja de texto con diseño
              const TextField(
                decoration: InputDecoration(
                  labelText: "Nombre",
                  hintText: "Escribe tu nombre",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  print("Elevated presionado");
                },
                child: const Text("Elevated Button"),
              ),

              const SizedBox(height: 15),

              TextButton(
                onPressed: () {
                  print("Text presionado");
                },
                child: const Text("Text Button"),
              ),

              const SizedBox(height: 15),

              OutlinedButton(
                onPressed: () {
                  print("Outlined presionado");
                },
                child: const Text("Outlined Button"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

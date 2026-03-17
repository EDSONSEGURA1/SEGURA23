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
        appBar: AppBar(
          title: const Text("Formulario de Usuario"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // TextField con diseño
              const TextField(
                decoration: InputDecoration(
                  labelText: "Nombre completo",
                  hintText: "Ingrese su nombre",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 30),

              // Botón principal
              ElevatedButton(
                onPressed: () {
                  print("Formulario enviado");
                },
                child: const Text("Enviar"),
              ),

              const SizedBox(height: 15),

              // Botón secundario
              TextButton(
                onPressed: () {
                  print("Formulario cancelado");
                },
                child: const Text("Cancelar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

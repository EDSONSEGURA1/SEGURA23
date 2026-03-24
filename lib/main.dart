import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController controller = TextEditingController();
  final Random random = Random();

  List<Map<String, dynamic>> messages = [
    {"text": "Hazme una pregunta 😎", "me": false},
  ];

  void sendMessage() {
    String text = controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add({"text": text, "me": true});
    });

    controller.clear();

    /// RESPUESTA AUTOMÁTICA (SI O NO RANDOM)
    Future.delayed(const Duration(milliseconds: 500), () {
      bool answer = random.nextBool();

      String response = answer ? "✅ Sí 😎" : "❌ No 😤";

      setState(() {
        messages.add({"text": response, "me": false});
      });
    });
  }

  Widget messageBubble(String text, bool me) {
    return Row(
      mainAxisAlignment: me ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!me)
          const CircleAvatar(
            radius: 16,
            child: Icon(Icons.smart_toy),
          ),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          constraints: const BoxConstraints(maxWidth: 250),
          decoration: BoxDecoration(
            color: me ? const Color(0xFFDCF8C6) : Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ),

        if (me)
          const CircleAvatar(
            radius: 16,
            child: Icon(Icons.person),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),

      appBar: AppBar(
        backgroundColor: const Color(0xFF075E54),
        title: const Text("Bot Sí o No 🤖"),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                return messageBubble(msg["text"], msg["me"]);
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: "Haz una pregunta...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 5),

                CircleAvatar(
                  backgroundColor: const Color(0xFF075E54),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
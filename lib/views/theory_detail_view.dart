import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:theory_project/models/theory_model.dart';

class TheoryDetailView extends StatelessWidget {
  const TheoryDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TheoryModel theory = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Teoria'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              Get.snackbar('Compartilhar', 'Funcionalidade em breve!');
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                theory.category,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: 'bold'.isNotEmpty ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              theory.title,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 28),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white24,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(theory.author, style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      DateFormat('dd de MMMM de yyyy').format(theory.createdAt),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
            const Divider(height: 40, color: Colors.white24),
            Text(
              theory.content,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.favorite_border, size: 32),
                      onPressed: () {
                        Get.snackbar('Curtir', 'Você curtiu esta teoria!');
                      },
                    ),
                    Text('${theory.likes} curtidas'),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

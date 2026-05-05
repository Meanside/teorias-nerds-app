import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theory_project/controllers/theory_controller.dart';
import 'package:theory_project/routes/app_routes.dart';
import 'package:intl/intl.dart';

class HomeView extends GetView<TheoryController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teorias'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.hasError.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.redAccent),
                const SizedBox(height: 16),
                const Text('Erro ao carregar as teorias.'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: controller.fetchTheories,
                  child: const Text('Tentar Novamente'),
                )
              ],
            ),
          );
        }

        if (controller.theories.isEmpty) {
          return const Center(
            child: Text('Nenhuma teoria encontrada.\nSeja o primeiro a publicar!', textAlign: TextAlign.center),
          );
        }

        return RefreshIndicator(
          onRefresh: controller.fetchTheories,
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.theories.length,
            itemBuilder: (context, index) {
              final theory = controller.theories[index];
              return Card(
                color: Theme.of(context).colorScheme.surface,
                margin: const EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () => Get.toNamed(Routes.THEORY_DETAIL, arguments: theory),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                theory.category,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              DateFormat('dd MMM yy').format(theory.createdAt),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          theory.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          theory.content,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Icon(Icons.person, size: 16, color: Colors.white60),
                            const SizedBox(width: 4),
                            Text(theory.author, style: Theme.of(context).textTheme.bodySmall),
                            const Spacer(),
                            const Icon(Icons.favorite, size: 16, color: Colors.redAccent),
                            const SizedBox(width: 4),
                            Text('${theory.likes}', style: Theme.of(context).textTheme.bodySmall),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_THEORY),
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

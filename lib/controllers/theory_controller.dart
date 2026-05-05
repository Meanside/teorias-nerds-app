import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:theory_project/models/theory_model.dart';

class TheoryController extends GetxController {
  var theories = <TheoryModel>[].obs;
  
  var isLoading = true.obs;
  var hasError = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTheories();
  }

  Future<void> fetchTheories() async {
    try {
      isLoading(true);
      hasError(false);
      
      await Future.delayed(const Duration(seconds: 2));

      theories.value = [
        TheoryModel(
          id: const Uuid().v4(),
          title: 'O verdadeiro plano do Thanos',
          content: 'E se o Thanos não queria equilibrar o universo, mas sim impedir uma ameaça maior como Galactus de encontrar os planetas superpopulosos?',
          category: 'Filmes',
          author: 'NerdMaster99',
          createdAt: DateTime.now().subtract(const Duration(days: 2)),
          likes: 42,
        ),
        TheoryModel(
          id: const Uuid().v4(),
          title: 'Zoro e a conexão com Wano',
          content: 'A linhagem de Zoro está diretamente ligada aos samurais lendários de Wano, especificamente ao clã Shimotsuki...',
          category: 'Anime',
          author: 'OtakuBR',
          createdAt: DateTime.now().subtract(const Duration(hours: 5)),
          likes: 128,
        ),
      ];
    } catch (e) {
      hasError(true);
    } finally {
      isLoading(false);
    }
  }

  Future<void> addTheory(String title, String category, String content) async {
    final newTheory = TheoryModel(
      id: const Uuid().v4(),
      title: title,
      content: content,
      category: category,
      author: 'Usuário Anônimo',
      createdAt: DateTime.now(),
    );

    theories.insert(0, newTheory);
    Get.back();
    Get.snackbar(
      'Sucesso', 
      'Sua teoria foi publicada!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

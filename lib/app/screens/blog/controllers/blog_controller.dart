import 'package:get/get.dart';

import '../../../models/blog_model.dart';
import '../../../models/category_model.dart';
// import '../../../repositories/category_repository.dart';

class BlogController extends GetxController {
  RxList<Blog> blogs = <Blog>[].obs;
  Rx<Blog> selectedBlog = Blog().obs;

  RxInt selectedIndex = 0.obs;

  // late CategoryRepository _categoryRepository;

  BlogController() {
    // _categoryRepository = CategoryRepository();
  }
  Rx<Category> category = Category().obs;
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments?["category"] != null) {
      category = Category().obs;
      category.value = Get.arguments["category"] ?? Category();
      category.refresh();
      fetchBlogsByCategory();
    } else if (Get.arguments?["blog"] != null) {
      selectedBlog = Blog().obs;
      selectedBlog.value = Get.arguments["blog"] ?? Blog();
      selectedBlog.refresh();
    }
    category.listen((p0) {
      fetchBlogsByCategory();
    });
  }

  void fetchBlogsByCategory() async {
    blogs.value = category.value.blogs!;
    blogs.refresh();
    // await _categoryRepository.fetchBlogsByCategory(category).then((value) {
    //   if (value.status == Status.COMPLETED) {
    //     blogs.value = value.data;
    //     blogs.refresh();
    //   }
    // });
  }
}

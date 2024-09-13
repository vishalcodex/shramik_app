import 'package:get/get.dart';

import '../models/api_response.dart';
import '../models/blog_model.dart';
import '../models/category_model.dart';
import '../providers/api_provider.dart';

class CategoryRepository {
  late ApiProvider apiProvider;

  CategoryRepository() {
    apiProvider = Get.find<ApiProvider>();
  }

  Future<ApiResponse> fetchCategories() async {
    // return Future.delayed(const Duration(seconds: 2), () {
    //   List<Category> categories = [
    //     {
    //       "cat_name": "Politics",
    //       "blogs": [
    //         {
    //           "blog_name": "अजित पवार 5वीं बार महाराष्ट्र के डिप्टी CM बने",
    //           "image": "assets/images/Politics/political1.jpg",
    //           "short_description":
    //               "अजित पवार 5वीं बार महाराष्ट्र के डिप्टी CM बने. 31 महीने में तीसरी बार शपथ ली; NCP के 8 विधायक भी मंत्री बने.",
    //           "blog_details":
    //               " महाराष्ट्र में रविवार को बड़ा पॉलिटिकल उलटफेर हुआ। NCP के नेता अजित पवार ने दोपहर ढाई बजे शिवसेना के एकनाथ शिंदे की सरकार में डिप्टी CM पद की शपथ ली। शपथ के तुरंत बाद ट्विटर प्रोफाइल बदला और लिखा- डिप्टी सीएम ऑफ महाराष्ट्र।\n\n    अजित पवार 8 विधायकों छगन भुजबल, धनंजय मुंडे, अनिल पाटिल, दिलीप वलसे पाटिल, धर्मराव अत्राम, संजय बनसोड़े, अदिति तटकरे और हसन मुश्रीफ के साथ दोपहर करीब 2 बजे राजभवन पहुंचे। 3 बजते-बजते CM शिंदे और डिप्टी CM देवेंद्र फडवणीस की मौजूदगी में सभी को मंत्री पद की शपथ दिलाई गई।"
    //         },
    //         {
    //           "blog_name": "Title 2",
    //           "image": "assets/images/Politics/political2.jpg",
    //           "short_description":
    //               "Convenient, handy, and useful - Credit Cards give you the freedom to make payments for your various expenses. Whatever your needs may be, you can swipe your HDFC Bank Credit Card and pay for the expenses."
    //         },
    //         {
    //           "blog_name": "Title 3",
    //           "image": "assets/images/Politics/political1.jpg",
    //           "short_description":
    //               "Convenient, handy, and useful - Credit Cards give you the freedom to make payments for your various expenses. Whatever your needs may be, you can swipe your HDFC Bank Credit Card and pay for the expenses."
    //         },
    //         {
    //           "blog_name": "Title 4",
    //           "image": "assets/images/Politics/political2.jpg",
    //           "short_description":
    //               "Convenient, handy, and useful - Credit Cards give you the freedom to make payments for your various expenses. Whatever your needs may be, you can swipe your HDFC Bank Credit Card and pay for the expenses."
    //         },
    //       ]
    //     },
    //     {
    //       "cat_name": "Government Schemes",
    //       "blogs": [
    //         {
    //           "blog_name": "Title 1",
    //           "image": "assets/images/Govt Schemes/govtscheme1.png",
    //           "short_description":
    //               "Convenient, handy, and useful - Credit Cards give you the freedom to make payments for your various expenses. Whatever your needs may be, you can swipe your HDFC Bank Credit Card and pay for the expenses."
    //         },
    //         {
    //           "blog_name": "Title 2",
    //           "image": "assets/images/Govt Schemes/govtscheme2.png",
    //           "short_description":
    //               "Convenient, handy, and useful - Credit Cards give you the freedom to make payments for your various expenses. Whatever your needs may be, you can swipe your HDFC Bank Credit Card and pay for the expenses."
    //         },
    //         {
    //           "blog_name": "Title 3",
    //           "image": "assets/images/Govt Schemes/govtscheme1.png",
    //           "short_description":
    //               "Convenient, handy, and useful - Credit Cards give you the freedom to make payments for your various expenses. Whatever your needs may be, you can swipe your HDFC Bank Credit Card and pay for the expenses."
    //         },
    //         {
    //           "blog_name": "Title 4",
    //           "image": "assets/images/Govt Schemes/govtscheme2.png",
    //           "short_description":
    //               "Convenient, handy, and useful - Credit Cards give you the freedom to make payments for your various expenses. Whatever your needs may be, you can swipe your HDFC Bank Credit Card and pay for the expenses."
    //         },
    //       ]
    //     },
    //     {
    //       "cat_name": "Election Special",
    //       "blogs": [
    //         {
    //           "blog_name": "Title 1",
    //           "image": "assets/images/Election/election1.png",
    //           "short_description":
    //               "Convenient, handy, and useful - Credit Cards give you the freedom to make payments for your various expenses. Whatever your needs may be, you can swipe your HDFC Bank Credit Card and pay for the expenses."
    //         },
    //         {
    //           "blog_name": "Title 2",
    //           "image": "assets/images/Election/election2.png",
    //           "short_description":
    //               "Convenient, handy, and useful - Credit Cards give you the freedom to make payments for your various expenses. Whatever your needs may be, you can swipe your HDFC Bank Credit Card and pay for the expenses."
    //         },
    //         {
    //           "blog_name": "Title 3",
    //           "image": "assets/images/Election/election1.png",
    //           "short_description":
    //               "Convenient, handy, and useful - Credit Cards give you the freedom to make payments for your various expenses. Whatever your needs may be, you can swipe your HDFC Bank Credit Card and pay for the expenses."
    //         },
    //         {
    //           "blog_name": "Title 4",
    //           "image": "assets/images/Election/election2.png",
    //           "short_description":
    //               "Convenient, handy, and useful - Credit Cards give you the freedom to make payments for your various expenses. Whatever your needs may be, you can swipe your HDFC Bank Credit Card and pay for the expenses."
    //         },
    //       ]
    //     },
    //     {
    //       "cat_name": "Sports",
    //       "blogs": [
    //         {
    //           "blog_name": "Title 1",
    //           "image": "assets/images/Sports/Sport1.png",
    //           "short_description":
    //               "Convenient, handy, and useful - Credit Cards give you the freedom to make payments for your various expenses. Whatever your needs may be, you can swipe your HDFC Bank Credit Card and pay for the expenses."
    //         },
    //         {
    //           "blog_name": "Title 2",
    //           "image": "assets/images/Sports/Sport2.png",
    //           "short_description":
    //               "Convenient, handy, and useful - Credit Cards give you the freedom to make payments for your various expenses. Whatever your needs may be, you can swipe your HDFC Bank Credit Card and pay for the expenses."
    //         },
    //         {
    //           "blog_name": "Title 3",
    //           "image": "assets/images/Sports/Sport1.png",
    //           "short_description":
    //               "Convenient, handy, and useful - Credit Cards give you the freedom to make payments for your various expenses. Whatever your needs may be, you can swipe your HDFC Bank Credit Card and pay for the expenses."
    //         },
    //         {
    //           "blog_name": "Title 4",
    //           "image": "assets/images/Sports/Sport2.png",
    //           "short_description":
    //               "Convenient, handy, and useful - Credit Cards give you the freedom to make payments for your various expenses. Whatever your needs may be, you can swipe your HDFC Bank Credit Card and pay for the expenses."
    //         },
    //       ]
    //     }
    //   ].map((e) => Category.fromJson(e)).toList();

    //   return ApiResponse.completed(categories);
    // });
    return await apiProvider
        .makeAPICall("GET", "news-categories", {}).then((value) async {
      if (value.status == Status.COMPLETED) {
        List<Category> categories = (value.data["data"] as List).map((e) {
          return Category.fromJson(e);
        }).toList();

        for (var category in categories) {
          category.blogs = await fetchBlogsByCategory(category).then((value) {
            return value.data;
          });
        }

        value.data = categories;
      }
      return value;
    });
  }

  Future<ApiResponse> fetchBlogsByCategory(Category category) async {
    return await apiProvider
        // .makeAPICall("POST", "blogs", category.toJson())
        .makeAPICall("GET", "news-blogs/${category.catId}", {}).then((value) {
      if (value.status == Status.COMPLETED) {
        List<Blog> blogs =
            (value.data["data"] as List).map((e) => Blog.fromJson(e)).toList();
        value.data = blogs;
      } else {
        value.data = [];
      }
      return value;
    });
  }
}

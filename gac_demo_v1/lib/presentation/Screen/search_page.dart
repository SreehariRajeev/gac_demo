import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gac_demo_v1/Models/search_model/search_model.dart';
import 'package:gac_demo_v1/Repository/product_repo.dart';
import 'package:gac_demo_v1/presentation/Screen/Home%20Page/home_screen.dart';

import '../../Utils/constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: const Center(
            child: Text(
          'New GRN',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 28),
        )),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: Colors.white,
              elevation: 6,
              borderRadius: BorderRadius.circular(6),
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: () {
                      serachItems(searchController.text);
                    },
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchModel?.page.items.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return HomePage(
                              currentTab: int.parse(
                                  searchModel!.page.items[index].current_step));
                        },
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(6),
                        // boxShadow: const [
                        //   BoxShadow(
                        //     color: Colors.grey,
                        //     offset: Offset(0, 4),
                        //     blurRadius: 6,
                        //   )
                        // ],
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        searchModel?.page.items[index].grns_number ?? 'null',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  SearchModel? searchModel;

  serachItems(String serachKeyword) async {
    var data = await ProdRepo().searchItems(serachKeyword);
    searchModel = SearchModel.fromJson(data);
    setState(() {});
    log(searchModel.toString());
  }
}

// class MySearchDelegate extends SearchDelegate<String> {
//   final List<String> items;

//   MySearchDelegate(this.items);

//   @override
//   String get searchFieldLabel => 'Search items';

//   @override
//   ThemeData appBarTheme(BuildContext context) {
//     final ThemeData theme = Theme.of(context);
//     return theme.copyWith(
//       textTheme: TextTheme(
//         headline6: TextStyle(color: Colors.white, fontSize: 18),
//       ),
//       inputDecorationTheme: InputDecorationTheme(
//         hintStyle: TextStyle(color: Colors.white70),
//       ),
//       appBarTheme: AppBarTheme(
//         color: Colors.blue,
//         brightness: Brightness.dark,
//       ),
//     );
//   }

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, '');
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     final results = items.where((item) => item.contains(query)).toList();
//     return ListView.builder(
//       itemCount: results.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(results[index]),
//           onTap: () {
//             close(context, results[index]);
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final suggestions = items.where((item) => item.startsWith(query)).toList();
//     return ListView.builder(
//       itemCount: suggestions.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(suggestions[index]),
//           onTap: () {
//             query = suggestions[index];
//             close(context, query);
//           },
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_search_app/data/model/location.dart';
import 'package:local_search_app/ui/pages/home/home_view_model.dart';

class HomePage extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void onSearch(String text) {
    ref.read(homeViewModelProvider.notifier).searchLocations(text);
  }

  @override
  Widget build(BuildContext context) {
    
    final homeState = ref.watch(homeViewModelProvider);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: addressSearchAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            itemCount: homeState.locations?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              final item = homeState.locations![index];
              return localSearchItem(item);
            },
          ),
        ),
      ),
    );
  }

  AppBar addressSearchAppBar() {
    return AppBar(
      title: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          isDense: true,
          counterText: "",
          hintText: "주소를 입력해 주세요.",
          border: MaterialStateOutlineInputBorder.resolveWith(
            (states) {
              return OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey),
              );
            },
          ),
        ),
        maxLines: 1,
        maxLength: 50,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        onSubmitted: (text) => onSearch(text),
      ),
    );
  }

  Widget localSearchItem(Location item) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[400]!),
            borderRadius: BorderRadius.circular(18),
            color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.replacedTitle(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2),
            Text(item.category),
            Text(item.roadAddress),
          ],
        ),
      ),
    );
  }
}

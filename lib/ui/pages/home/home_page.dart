import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_search_app/ui/pages/home/home_view_model.dart';
import 'package:local_search_app/ui/pages/home/widgets/local_search_item.dart';

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
              return LocalSearchItem(context: context, item: item);
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
}


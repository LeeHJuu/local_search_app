import 'package:flutter/material.dart';
import 'package:local_search_app/data/model/location.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: addressSearchAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              Location item = Location(
                  title: 'title',
                  category: 'category',
                  roadAddress: 'roadAddress');
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
          // controller: textEditingController,
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
          // onSubmitted: (text) => onSearch(text),
        ),
      );
  }

  Widget localSearchItem(item) {
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
              '삼성1동주민센터',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2),
            Text('공공, 사회기관>행정복지센터'),
            Text('서울특별시 어쩌구 저쩌로 웅앵앵앵'),
          ],
        ),
      ),
    );
  }
}

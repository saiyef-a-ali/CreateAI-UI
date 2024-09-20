import 'package:flutter/material.dart';
import 'package:newui/widgets/homescreen/presentation/declarations/constants.dart';

class SliverSearch extends StatelessWidget {
  const SliverSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      pinned: true,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(10.0),
        child: SizedBox(),
      ),
      flexibleSpace: Expanded(
        child: Column(
          children: [
            const SearchBar(),
            const SizedBox(height: 10), // Add some space between search bar and filters
            const FilterList(),
          ],
        ),
      ),
    );
  }
}


class FilterList extends StatefulWidget {
  const FilterList({Key? key}) : super(key: key);

  @override
  _FilterListState createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  List<String> filters = ['Action', 'Adventure', 'Mystery', 'Thriller','crime', 'romance', 'psychological', 'suspense'];
  String? selectedGenre;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: FilterChip(
              label: Text(
                filters[index],
                style: TextStyle(
                  fontSize: 10,
                  color: selectedGenre == filters[index] ? Colors.blue : Colors.black,
                ),
              ),
              backgroundColor: selectedGenre == filters[index] ? Colors.grey : null,
              selected: selectedGenre == filters[index],
              onSelected: (bool selected) {
                setState(() {
                  selectedGenre = selected ? filters[index] : null;
                });
                // Add your filter selection logic here
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(
                  color: selectedGenre == filters[index] ? Colors.blue : Colors.grey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.zero,
        width: MediaQuery.of(context).size.width,
        height: 50, // Adjust the height as needed
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: kBorderRadius / 2,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(top: 0.8),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(top: 1.0),
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              hintText: 'Search',
            ),
          ),
        ),
      ),
    );
  }
}

part of 'widgets.dart';

class SearchCard extends StatefulWidget {
  final bool readOnly;
  final bool autoFocus;
  final Function()? onTap;
  final Function(String)? onChanged;

  const SearchCard({
    required this.readOnly,
    required this.autoFocus,
    this.onTap,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  _SearchCardState createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  final String hint = "Search..";

  Widget _buildAndroid(BuildContext context) {
    return Material(
        child: Container(
      width: MediaQuery.of(context).size.width,
      height: 38,
      decoration: BoxDecoration(
        color: lightGrey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        readOnly: widget.readOnly,
        autofocus: widget.autoFocus,
        onTap: widget.onTap,
        onChanged: widget.onChanged,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          hintText: hint,
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: grey,
            size: 18,
          ),
          suffixIcon: Icon(
            Icons.filter_list,
            color: yellow,
            size: 23,
          ),
          hintStyle: Theme.of(context).textTheme.caption?.copyWith(color: grey),
        ),
        style: TextStyle(
          color: black,
        ),
      ),
    ));
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoTextField(
      readOnly: widget.readOnly,
      autofocus: widget.autoFocus,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      textAlignVertical: TextAlignVertical.center,
      placeholder: hint,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: lightGrey,
      ),
      prefix: const Padding(
        padding: EdgeInsets.only(left: 16.0),
        child: Icon(
          CupertinoIcons.search,
          color: grey,
        ),
      ),
      placeholderStyle: const TextStyle(color: grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}

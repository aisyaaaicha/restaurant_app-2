part of 'pages.dart';

class ListRestaurantScreen extends StatelessWidget {
  const ListRestaurantScreen({Key? key}) : super(key: key);

  Widget _titleAppBar(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            'Location',
            style: Theme.of(context).textTheme.subtitle2?.copyWith(color: grey),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 2.0),
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              children: const [
                TextSpan(
                  text: 'Rungkut Surabaya...',
                ),
                WidgetSpan(
                  child: Icon(
                    Icons.expand_more_rounded,
                    size: 20,
                    color: black,
                  ),
                ),
              ],
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildList(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 90,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://images.unsplash.com/photo-1504754524776-8f4f37790ca0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80",
                      ))),
            ),
            const SizedBox(
              height: 14,
            ),
            Hero(
              tag: SearchScreen.routeName,
              child: SearchCard(
                readOnly: true,
                autoFocus: false,
                onTap: () =>
                    Navigator.pushNamed(context, SearchScreen.routeName),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Find Your Meals',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 3,
            ),
            Row(
              children: [
                Icon(
                  CupertinoIcons.location_solid,
                  color: yellow,
                  size: 17,
                ),
                SizedBox(width: 4),
                Text(
                  'Nearby Restaurants',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Consumer<RestaurantsProvider>(
              builder: (context, state, _) {
                if (state.state == ResultState.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.state == ResultState.hasData) {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    primary: false,
                    shrinkWrap: true,
                    itemCount: state.result.restaurants.length,
                    itemBuilder: (context, index) {
                      return CardRestaurant(
                          restaurant: state.result.restaurants[index]);
                    },
                  );
                } else if (state.state == ResultState.noData) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ViewEmpty(message: state.message),
                  );
                } else if (state.state == ResultState.error) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ViewError(message: state.message),
                  );
                } else {
                  return const Center(child: Text(''));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: _titleAppBar(context),
      body: _buildList(context),
      androidMenu: [
        IconButton(
          onPressed: () => customDialog(context),
          icon: const Icon(
            Icons.shopping_cart,
            color: black,
          ),
        ),
      ],
      iosMenu: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () =>
                Navigator.pushNamed(context, customDialog(context)),
            child: const Icon(CupertinoIcons.shopping_cart),
          ),
        ],
      ),
    );
  }
}

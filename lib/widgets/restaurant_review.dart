part of 'widgets.dart';

class RestaurantReview extends StatelessWidget {
  final Review review;

  const RestaurantReview({
    required this.review,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.name,
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  review.date,
                  style: Theme.of(context).textTheme.overline,
                ),
                const SizedBox(height: 12.0),
                Text(
                  review.review,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

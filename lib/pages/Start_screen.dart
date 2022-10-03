part of 'pages.dart';

class StartScreen extends StatelessWidget {
  static const routeName = '/Start';

  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const NetworkImage(
                      "https://www.medoc-atlantique.com/wp-content/uploads/2019/02/restaurant-1600x900.jpg",
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.darken),
                  ),
                ),
              )),
          Positioned(
              left: 32,
              right: 32,
              top: 70,
              bottom: 64,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Foodies',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(color: yellow),
                  ),
                  const SizedBox(
                    height: 72,
                  ),
                  Text(
                    "The Experience of\nBuying Food\nQuickly",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: lightGrey),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "The Experience of Buying Food Quickly",
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.copyWith(color: lightGrey),
                    textAlign: TextAlign.start,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, MainScreen.routeName);
                    },
                    child: Container(
                      height: 38,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 240, 163, 19),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Start",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}

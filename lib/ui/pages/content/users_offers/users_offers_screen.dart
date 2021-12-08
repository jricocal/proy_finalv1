import 'package:flutter/material.dart';
import 'widgets/offer_card.dart';

class UsersOffersScreen extends StatefulWidget {
  // UsersOffersScreen empty constructor
  const UsersOffersScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<UsersOffersScreen> {
  final items = List<String>.generate(20, (i) => "Usuario publico $i");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return PostCard(
          title: items[index],
          content:
              'Duis non tellus sed quam luctus gravida quis sed libero. Pellentesque luctus lorem eu est varius, eu dignissim leo tincidunt. Fusce eget ante sed mi venenatis tincidunt et rutrum neque. Suspendisse laoreet sapien sed est aliquet fringilla. Fusce fringilla, ante in ultrices volutpat, mauris ',
          picUrl:
              'https://c4.wallpaperflare.com/wallpaper/396/237/98/roronoa-zoro-one-piece-sword-wallpaper-preview.jpg',
          onChat: () => {},
        );
      },
    );
  }
}

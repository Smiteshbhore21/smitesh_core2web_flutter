import "package:flutter/material.dart";

void main() {
  runApp(const ImageChange());
}

class ImageChange extends StatefulWidget {
  const ImageChange({super.key});

  @override
  State createState() => _ImageChangeState();
}

class _ImageChangeState extends State {
  List imageLink = [
    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F28921622599659767%2F&psig=AOvVaw2cCWNKAfFLxYUQdl2PQLIx&ust=1727380870481000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCMCdy6vx3ogDFQAAAAAdAAAAABAE",
    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.simonandschuster.co.in%2Fbooks%2FThe-Art-of-Demon-Slayer-Kimetsu-no-Yaiba-the-Anime%2Fufotable%2FThe-Art-of-Demon-Slayer-Kimetsu-no-Yaiba-the%2F9781974739011&psig=AOvVaw1iezfxA6lJCggVvwR8oHoa&ust=1727380747541000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCOCN4vHw3ogDFQAAAAAdAAAAABAE",
    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.radiotimes.com%2Ftv%2Ffantasy%2Fanime%2Fjujutsu-kaisen-arcs-in-order%2F&psig=AOvVaw0kM8l8SXdkdDj5XmPMzCxz&ust=1727380697975000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCMCf8Nnw3ogDFQAAAAAdAAAAABAE",
    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.jacksonpbrown.com%2Fanime-and-manga%2F2022%2F3%2F18%2Fclassroom-of-the-elite&psig=AOvVaw33MR71gAEcawwAyN9S79w-&ust=1727380663911000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCMC78Mjw3ogDFQAAAAAdAAAAABAE",
    "https://lh3.googleusercontent.com/RUg9YJuY2cPjh5znR5ZLqLJIBrm1CM2JuwCS1XP6g31ZDPa_NR--jR0JAum5qDbl2g5UKgBwM4SHSuyiWqjyd7VhBUI=s1280-w1280-h800"
  ];
  int index = 4;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Image Change On Button"),
          centerTitle: true,
          backgroundColor: Colors.blue[100],
        ),
        body: Center(
          child: SizedBox(
            width: 150,
            height: 150,
            child: Image.network(imageLink[index]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (index < imageLink.length - 1) {
              index++;
            } else {
              index = 0;
            }
            setState(() {});
          },
        ),
      ),
    );
  }
}

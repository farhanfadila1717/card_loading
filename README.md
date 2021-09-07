## [![cover][]][github]
[![flutter][]][web flutter] [![paypal][]][paypal account] <br>
A Flutter package to create easy create loading card between two colors

---

## Example
```dart
class ExampleCardLoading extends StatelessWidget {
  const ExampleCardLoading({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Card Loading"),
        backgroundColor: Colors.black,
        brightness: Brightness.dark,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardLoading(
                height: 30,
                width: size.width * .2,
                padding: const EdgeInsets.only(bottom: 10),
                borderRadius: 15,
              ),
              CardLoading(
                height: size.height * .15,
                padding: const EdgeInsets.only(bottom: 10),
                borderRadius: 15,
              ),
              CardLoading(
                height: size.height * .1,
                padding: const EdgeInsets.only(bottom: 20),
                borderRadius: 15,
              ),
            ],
          );
        },
      ),
    );
  }
}
```
### Output Example
[![output][]][output]

---

### 🚧 Maintener 
[![account avatar][]][github account] <br>
**Farhan Fadila**<br>
📫 How to reach me: farhan.fadila1717@gmail.com

### ❤️ Suport Maintener
[![paypal][]][paypal account] [![badge linktree][]][linktree account]

[cover]: https://github.com/farhanfadila1717/flutter_package/blob/master/display/card_loading/card_loading.png
[output]: https://github.com/farhanfadila1717/flutter_package/blob/master/display/card_loading/output_card_loading.gif
[flutter]: https://img.shields.io/badge/Platform-Flutter-02569B?logo=flutter
[web flutter]: https://flutter.dev
[paypal]: https://img.shields.io/badge/Donate-PayPal-00457C?logo=paypal
[paypal account]: https://www.paypal.me/farhanfadila1717
[account avatar]: https://avatars.githubusercontent.com/u/43161050?s=80
[github account]: https://github.com/farhanfadila1717
[badge linktree]: https://img.shields.io/badge/Linktree-farhanfadila-orange
[linktree account]: https://linktr.ee/farhanfadila
[github]: https://github.com/farhanfadila1717/card_loading

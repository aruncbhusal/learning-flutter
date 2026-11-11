# Magic 8 Ball 🎱

A little fortune-telling app that answers life's difficult questions. Or at least displays one of five predefined answers at random. We're keeping expectations realistic.

Unlike Dicee, this was a challenge project. I had the desired behaviour in mind, along with the concepts from the previous exercise, but no step-by-step instructions to follow. I decided to implement it independently first and compare my solution with the course's intended implementation afterwards.

## 🖼️ Preview

<p align="center">
  <img src="../docs/media/day_4_magic_8ball/demo.gif" height="420" alt="Magic 8 Ball app demonstration">
</p>

## 🎱 How It Works

The app displays a Magic 8 Ball under the title **Ask Me Anything**. Tapping the ball replaces the current image with one of five possible answers:

- Yes
- No
- Ask Again Later
- The Answer is Yes
- I Don't Know

Each answer is represented by a separate image asset. Every tap generates a random number between 1 and 5, which determines the image to display.

There is no actual question processing involved. The app doesn't even ask you to enter a question. The ball simply does its thing.

## 🧩 Implementation

The app is divided into two widgets:

- **`BallPage` (StatelessWidget):** Handles the overall screen, including the `Scaffold`, app bar and background colours.
- **`Ball` (StatefulWidget):** Holds the current image number and handles the tap interaction.

The `Ball` widget maintains an `imageNum` variable, initially set to `4`. A `TextButton` wraps the ball image and calls `setState()` when pressed. Inside it, `Random().nextInt(5) + 1` selects the next image, and string interpolation is used to construct its asset path.

```dart
setState(() {
  imageNum = Random().nextInt(5) + 1;
});
```

One small detail: the random selection is independent of the previous answer, so the same answer can appear multiple times consecutively. The ball makes no promises about variety.

## 💡 What I Took Away

The main exercise here was applying the state-management concepts from Dicee without being guided through every step.

I first built the app on my own, using the previous dice project as a reference for handling random image changes. Once I was done, I reviewed the course's intended solution. It suggested separating the stateful `Ball` widget from the stateless `BallPage` widget, which I incorporated into my implementation.

That separation makes sense: the page itself doesn't need to manage any changing state. Only the ball does.

The comparison was useful because it gave me a chance to solve the problem independently and then see how the same functionality could be organized more cleanly.

## 🏃‍♂️ How To Run

Clone the repository and navigate to the project directory:

```bash
git clone https://github.com/aruncbhusal/learning-flutter.git
cd learning-flutter/day_4_magic_8ball
```

Install dependencies and run the app:

```bash
flutter pub get
flutter run
```

## 📚 References & Acknowledgements

- [Dart Math Library](https://api.dart.dev/dart-math/)
- [StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
- [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html)

The project was based on the [Magic 8 Ball starter repository](https://github.com/londonappbrewery/magic-8-ball-flutter), with the relevant files copied into a fresh Flutter project.

Built as part of Angela Yu's [The Complete Flutter Development Bootcamp with Dart](https://www.udemy.com/course/flutter-bootcamp-with-dart/).

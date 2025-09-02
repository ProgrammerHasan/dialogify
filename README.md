<h1 align="center">Dialogify.</h1>
<h4 align="center">A customizable Flutter package to show animated confirmation and info dialogs with gradient backgrounds, blur effects, and support for **center** or **bottom sheet** positions.</h4>

<p align="center">
  <a href="https://pub.dartlang.org/packages/dialogify"><img src="https://img.shields.io/pub/v/dialogify.svg"></a>
</p>

<p align="center">
  <img src="https://github.com/programmerhasan/dialogify/raw/master/screenshots/02.png" alt="Dialogify for Flutter" width="120" style="border-radius: 50%;" />
</p>

<p align="center">
  <img src="https://github.com/programmerhasan/dialogify/raw/master/screenshots/03.png" alt="Dialogify for Flutter" width="120" style="border-radius: 50%;" />
</p>


---

## ✨ Features
- ✅ Gradient & blurred background dialogs
- ✅ Info & Confirmation dialog types
- ✅ Supports **bottom sheet** and **center popup**
- ✅ Custom titles, subtitles, content widget, and buttons
- ✅ Animated open/close transitions

---

## 🚀 Installation

Add this line in your `pubspec.yaml`:

```yaml
dependencies:
  dialogify: ^1.0.0
```
Then run:
```
flutter pub get
```

### Usage

Show Confirmation Dialog
```
import 'package:dialogify/dialogify.dart';
showConfirmationDialog(
  context,
  title: "Delete Item",
  subtitle: "Are you sure you want to delete this item?",
  confirmText: "Yes, Delete",
  cancelText: "Cancel",
  onConfirm: () {
    print("Confirmed!");
  },
  onCancel: () {
    print("Cancelled!");
  },
);
```
Show Info Dialog
```agsl
showInfoDialog(
  context,
  title: "Update Available",
  subtitle: "Version 2.0 is now available for download.",
  closeText: "Got it",
  onClose: () {
    print("Dialog closed");
  },
);
```
### 📲 Example App

See example/main.dart for a full working example.

```dart
import 'package:flutter/material.dart';
import 'package:dialogify/dialogify.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dialogify Example',
      home: Scaffold(
        appBar: AppBar(title: const Text("Dialogify Example")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  showConfirmationDialog(
                    context,
                    title: "Confirm Action",
                    subtitle: "Do you want to proceed?",
                    onConfirm: () => debugPrint("Confirmed!"),
                    onCancel: () => debugPrint("Cancelled!"),
                  );
                },
                child: const Text("Show Confirmation Dialog"),
              ),
              ElevatedButton(
                onPressed: () {
                  showInfoDialog(
                    context,
                    title: "Info",
                    subtitle: "This is an information dialog.",
                    onClose: () => debugPrint("Closed!"),
                  );
                },
                child: const Text("Show Info Dialog"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

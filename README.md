
A new Flutter project.

# Run with --no-sound-null-safety Flutter project.
flutter run --no-sound-null-safety
flutter build web --no-sound-null-safety
flutter run -d chrome --release --no-sound-null-safety


flutter build web --no-sound-null-safety --web-renderer html
flutter run -d chrome --no-sound-null-safety --web-renderer html


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# github
echo "# PK-BOOK" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/aryasolutions/PK-BOOK.git
git push -u origin main

# Can we check the device to be smartphone or tablet in Flutter?
# Here's the same than in other aswers, but returning an enum instead of a bool or a String. As it's more closed, it's easier to use it.
import 'package:flutter/widgets.dart';

enum DeviceType { Phone, Tablet }

DeviceType getDeviceType() {
  final data = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
  print(data.size.width);
  return data.size.shortestSide < 550 ? DeviceType.Phone : DeviceType.Tablet;
}# Linked-Up

# keytool
keytool -list -v -keystore "C:\Users\mudas\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android

Alias name: androiddebugkey
Creation date: Aug 12, 2021
Entry type: PrivateKeyEntry
Certificate chain length: 1
Certificate[1]:
Owner: C=US, O=Android, CN=Android Debug
Issuer: C=US, O=Android, CN=Android Debug
Serial number: 1
Valid from: Thu Aug 12 13:07:38 PKT 2021 until: Sat Aug 05 13:07:38 PKT 2051
Certificate fingerprints:
#         SHA1: 32:43:A9:AE:FB:1E:5E:0C:C9:2D:BB:80:8B:4E:63:31:4E:E0:8F:DA
#         SHA256: 90:45:01:0D:9A:FD:80:55:09:7D:98:23:51:57:AD:B7:24:99:F1:9C:85:49:74:D2:68:3B:4A:71:D7:F8:AD:87
Signature algorithm name: SHA1withRSA (weak)
Subject Public Key Algorithm: 2048-bit RSA key
Version: 1

Warning:
The certificate uses the SHA1withRSA signature algorithm which is considered a security risk. This algorithm will be disabled in a future update.
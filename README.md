# flutter_layout

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


`another homepages`
``` dart
ResponsiveLayout(
        mobileBody: MobileBody(),
        desktopBody: DesktopBody(),
      ),

Scaffold(
        body: GradientContainer(Colors.black87, Colors.grey, Colors.white),
      ),

HomePage(),

MainPage(),

return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.dynaPuffTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      /* home: const Scaffold(
        body: GradientContainer(Colors.black87, Colors.grey, Colors.white),
      ), */
      // home: const MainPage(),
      home: const ResponsiveLayout(
        mobileBody: MobileBody(),
        desktopBody: DesktopBody(),
      ),
    );
```

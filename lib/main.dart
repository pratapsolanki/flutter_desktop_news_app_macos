import 'package:fluent_ui/fluent_ui.dart';
import 'package:window_manager/window_manager.dart';

import 'app/modules/home/views/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  windowManager.waitUntilReadyToShow().then((_) async {
    await windowManager.setTitle('News');
    await windowManager.setTitleBarStyle(TitleBarStyle.normal);
    await windowManager.setBackgroundColor(Colors.transparent);
    await windowManager.setSize(const Size(755, 545));
    await windowManager.setMinimumSize(const Size(755, 545));
    await windowManager.center();
    await windowManager.show();
    await windowManager.setSkipTaskbar(false);
  });
  runApp(
    FluentApp(
      title: 'News',
      theme: ThemeData(brightness: Brightness.light, accentColor: Colors.blue),
      darkTheme:
          ThemeData(brightness: Brightness.dark, accentColor: Colors.blue),
      home: const MyHomePage(title: 'News'),
    ),
  );
}

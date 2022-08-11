import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:news/app/data/utils/constants.dart';
import 'package:news/app/modules/news_list/views/news_list_view_tab.dart';
import 'package:window_manager/window_manager.dart';

import '../../news_list/views/news_list_view.dart';
import '../controllers/home_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WindowListener {
  HomeController controller = Get.put(HomeController());

  final viewKey = GlobalKey();

  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => NavigationView(
        key: viewKey,
        pane: NavigationPane(
            selected: controller.index.value,
            onChanged: (i) {
              controller.updateIndex(i);
              controller.updateName(Constants.pages[i].title);
            },
            displayMode: PaneDisplayMode.compact,
            items: Constants.pages
                .map<NavigationPaneItem>(((e) =>
                    PaneItem(icon: Icon(e.iconData), title: Text(e.title))))
                .toList()),
        content: NavigationBody.builder(
            index: controller.index.value,
            itemBuilder: (ctx, index) {
              return NewsListView(newsPage: Constants.pages[index]);
            }),
      ),
    );
  }

  @override
  void onWindowClose() async {
    bool _isPreventClose = await windowManager.isPreventClose();
    if (_isPreventClose) {
      showDialog(
          context: context,
          builder: (_) {
            return ContentDialog(
                title: const Text('Confirm close'),
                content: const Text('Are you sure want to close the app?'),
                actions: [
                  FilledButton(
                    child: const Text('Yes'),
                    onPressed: () {
                      Navigator.pop(context);
                      windowManager.destroy();
                    },
                  ),
                  FilledButton(
                    child: const Text('No'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ]);
          });
    }
  }
}

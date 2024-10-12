part of '../../pages/profile_page.dart';

AppBar _buildAppBar(BuildContext context, TabController tabController) =>
    AppBar(
      elevation: 0,
      centerTitle: false,
      leadingWidth: 0,
      title: const Text(
        'Portfolio',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      actionsIconTheme: IconThemeData(
        color: Theme.of(context).iconTheme.color,
      ),
      actions: [
        Icon(
          Icons.shopping_bag,
          color: Theme.of(context)
              .bottomNavigationBarTheme
              .selectedIconTheme
              ?.color,
        ),
        const SizedBox(
          width: 18,
        ),
        Icon(
          Icons.notifications,
          color: Theme.of(context)
              .bottomNavigationBarTheme
              .selectedIconTheme
              ?.color,
        ),
        const SizedBox(
          width: 18,
        ),
      ],
      bottom: TabBar(
        // tabAlignment: TabAlignment.start,
        // isScrollable: true,
        controller: tabController,
        tabs: tabData.map((tab) => Tab(text: tab.title)).toList(),
      ),
    );

import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/app/modules/home/home_controller.dart';
import 'package:todolist/app/modules/new_task/new_task_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, controller, _) {
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                'Atividades',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            backgroundColor: Colors.white,
          ),
          bottomNavigationBar: FFNavigationBar(
              selectedIndex: controller.selectedTab,
              onSelectTab: (index) => controller.changeSelectedTab(index),
              items: [
                FFNavigationBarItem(
                  iconData: Icons.check_circle,
                  label: 'Finalizados',
                ),
                FFNavigationBarItem(
                  iconData: Icons.view_week,
                  label: 'Semanal',
                ),
                FFNavigationBarItem(
                  iconData: Icons.calendar_today,
                  label: 'Selecionar Data',
                )
              ],
              theme: FFNavigationBarTheme(
                  itemWidth: 60,
                  barHeight: 70,
                  barBackgroundColor: Theme.of(context).primaryColor,
                  unselectedItemIconColor: Colors.white,
                  unselectedItemLabelColor: Colors.white,
                  selectedItemBorderColor: Colors.white,
                  selectedItemIconColor: Colors.white,
                  selectedItemBackgroundColor: Theme.of(context).primaryColor,
                  selectedItemLabelColor: Colors.black)),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (_, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              'Hoje',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            IconButton(
                              icon: Icon(
                                Icons.add_circle,
                                color: Theme.of(context).primaryColor,
                                size: 30,
                              ),
                              onPressed: () => Navigator.of(context)
                                  .pushNamed(NewTaskPage.routerName),
                            )
                          ],
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (_, index) {
                          return ListTile(
                            leading: Checkbox(
                                value: false, onChanged: (bool value) {}),
                            title: Text(
                              'Tarefa',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            trailing: Text(
                              '15:30',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          );
                        },
                      )
                    ],
                  );
                }),
          ),
        );
      },
    );
  }
}

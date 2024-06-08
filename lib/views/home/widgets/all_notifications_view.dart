import 'package:flutter/material.dart';
import 'package:pet_project/api/get_all_notifications.dart';

import '../../../modal/notifications_model.dart';

class AllNotificationsView extends StatelessWidget {
  const AllNotificationsView({super.key});

  Widget itemCard(NotificationData notification, BuildContext context) {
    return Card(
      elevation: 8.0, color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      // margin: const EdgeInsets.symmetric(vertical: 10),

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          title: Text(
            notification.message ?? '',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ),
      ),
      // SizedBox(
      //   height: 225,
      //   width: double.infinity,
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NotificationData>>(
        future: fetchNotifications(),
        builder: (context, snapshort) {
          if (snapshort.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshort.hasError) {
            return Center(
              child: Text("${snapshort.error}"),
            );
          } else if (snapshort.data!.isEmpty || !snapshort.hasData) {
            return Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                automaticallyImplyLeading: true,
                title: Text("Notifications"),
                centerTitle: true,
                leadingWidth: 40.0,
              ),
              body: Center(
                child: Text(
                  "There is nothing to show!",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 16.0,
                      ),
                ),
              ),
            );
          } else {
            List<NotificationData> notificatiosn = snapshort.data!;
            return Scaffold(
                appBar: AppBar(
                  elevation: 0.0,
                  automaticallyImplyLeading: true,
                  title: Text("Notifications"),
                  centerTitle: true,
                  leadingWidth: 40.0,
                ),
                body: ListView.builder(
                  itemCount: notificatiosn.length,
                  itemBuilder: (context,index){
                    return itemCard(notificatiosn[index], context);
                  },
                ));
          }
        });
  }
}

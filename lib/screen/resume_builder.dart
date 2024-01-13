import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_task/model/resume_model.dart';
import 'package:resume_builder_task/screen/resume_itme.dart';

class ResumeBuilder extends StatefulWidget {
  const ResumeBuilder({super.key});

  @override
  State<ResumeBuilder> createState() => _ResumeBuilderState();
}

class _ResumeBuilderState extends State<ResumeBuilder> {
  List<ResumeItem> resumeItem = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume Builder'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _buildPortraitLayout(context)
              : _buildLandscapeLayout(context);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<ResumeModel>(context, listen: false)
              .showAddItemDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

Widget _buildPortraitLayout(BuildContext context) {
  return Consumer<ResumeModel>(
    builder: (context, model, child) {
      return ListView.builder(
        itemCount: model.resume.items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(model.resume.items[index].title),
            subtitle: Text(model.resume.items[index].content),
            onTap: () {
              Provider.of<ResumeModel>(context, listen: false)
                  .showUpdateItemDialog(context, index);
            },
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                Provider.of<ResumeModel>(context, listen: false)
                    .deleteItem(index);
              },
            ),
          );
        },
      );
    },
  );
}

Widget _buildLandscapeLayout(BuildContext context) {
  return Row(
    children: [
      Expanded(
        flex: 1,
        child: _buildPortraitLayout(context),
      ),
      Expanded(
        flex: 2,
        child: Consumer<ResumeModel>(
          builder: (context, model, child) {
            return model.selectedItemIndex != null
                ? _buildDetailView(
                    context, model.resume.items[model.selectedItemIndex!])
                : Container();
          },
        ),
      ),
    ],
  );
}

Widget _buildDetailView(BuildContext context, ResumeItem item) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.title,
          style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16.0),
        Text(item.content),
      ],
    ),
  );
}

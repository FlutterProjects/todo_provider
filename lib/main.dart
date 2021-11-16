import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/models/list_model.dart';

void main()
{
	runApp
	(
		ChangeNotifierProvider
		(
			create: (context) => ListModel(),
			child: App(),
		)
	);
}

class App extends StatelessWidget
{
	final TextEditingController itemTextController = TextEditingController();

	App({ Key? key }) : super(key: key);
  	
	@override
  	Widget build(BuildContext context)
	{
		return MaterialApp
		(
			debugShowCheckedModeBanner: false,
			home: Scaffold
			(
				body: SafeArea
				(
					child: Consumer<ListModel>
					(
						builder: (context, listModel, child) => Container
						(
							padding: const EdgeInsets.all(30),
							child: Column
							(
								children: 
								[
									const Text('Add Items', style: TextStyle(fontSize: 20)),
									const SizedBox(height: 10),
									TextFormField
									(
										controller: itemTextController,
										decoration: InputDecoration
										(
											labelText: "Title of the task",
											fillColor: Colors.white,
											focusedBorder:OutlineInputBorder
											(
												borderSide: const BorderSide(color: Colors.white, width: 2.0),
												borderRadius: BorderRadius.circular(25.0),
											),
										),
									),
									const SizedBox(height: 10),
									SizedBox
									(
										width: double.infinity,
										height: 40,
										child: TextButton
										(
											onPressed: ()
											{
												listModel.addItem(itemTextController.text);
												itemTextController.clear();
											}, 
											child: const Text('Add'),
											style: TextButton.styleFrom
											(
												backgroundColor: Colors.blue,
												primary: Colors.white
											),
										)
									),
									const SizedBox(height: 50),
									Expanded
									(
										child: !listModel.items.isEmpty ? 
										ListView.builder(itemCount: listModel.items.length, itemBuilder: (context, index)
										{
											return ListTile
											(
												title: Text(listModel.items[index]),
												trailing: GestureDetector
												(
													child: const Icon(Icons.delete),
													onTap: ()
													{
														listModel.removeItem(index);
													},
												),
											);
										}) : 
										const Text('Add items to your list')
									),
									listModel.items.length > 0 ? Expanded
									(
										child: TextButton
										(
											onPressed: ()
											{
												listModel.clear();
											}, 
											child: Text('Clear ' + listModel.items.length.toString() + ' items')
										)
									) : const SizedBox.shrink()
								],
							)
						)
					)
				),
			),
		);
  	}
}
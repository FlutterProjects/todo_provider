import 'package:flutter/widgets.dart';

class ListModel extends ChangeNotifier
{
	final _items = [];

	// Get all the items in the list.
	get items => _items;

	// Add a new item to the list.
	addItem(item) 
	{
		_items.add(item);
		notifyListeners();
	}

	removeItem(index)
	{
		_items.removeAt(index);
		notifyListeners();
	}

	clear()
	{
		_items.clear();
		notifyListeners();
	}
}
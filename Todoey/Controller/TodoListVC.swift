//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListVC: UITableViewController {

    var itemArray: [Item] = []
    let defaults = UserDefaults.standard
    let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Item.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemArray.append(Item(title: "Wake up", done: false))
        itemArray.append(Item(title: "Eat", done: false))
        itemArray.append(Item(title: "Sleep", done: false))
        
        self.loadItems()
    }
    
    func loadItems(){
        if let data = try? Data(contentsOf: self.filePath!){
            let decoder = PropertyListDecoder()
            do {
                    
                itemArray = try decoder.decode([Item].self, from: data)
            }catch {
                    print("Error extracting data")
            }
        }
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add  New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add item", style: .default) { action in
            self.itemArray.append(Item(title:textField.text!, done: false))
            
            
            self.saveItems()
        }
        
        alert.addTextField{(alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell",for: indexPath)
        let item = itemArray[indexPath.row]
            
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        saveItems()
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func saveItems(){
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(self.itemArray)
            try data.write(to: self.filePath!)
        }catch {
            print("")
        }
        //self.defaults.set(self.itemArray, forKey: "ToDoListArray")
        self.tableView.reloadData()
    }
    
}


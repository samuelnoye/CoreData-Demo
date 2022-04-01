//
//  ViewController.swift
//  CoreData-Demo
//
//  Created by Samuel Noye on 31/03/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private var models  = [Info]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "CoreData Todo App"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.name
        cell.textLabel?.text = model.price
        cell.textLabel?.text = model.createdAt
        return cell
    }
    
    
    //get all items
    func getAllItems(){
        do{
             models = try context.fetch(Info.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }catch{
            //error
        }
    }
    //create items
    func createItems(name: String, price: Double){
        let newItem = Info(context: context)
        newItem.name = name
        newItem.price = price
        newItem.createdAt = Date()
        
        do{
            let items = try context.fetch(Info.fetchRequest())
        }catch{
            //error
        }        }
    //delete item
    func deleteItem(){
        
    }
    //update item
    func updateItem(){
        
    }

}


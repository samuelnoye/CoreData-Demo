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
    
    private var models  = [Expenses]()
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
        let price: String = String(format: "%f", model.price)
        let quantity: String = String(format: "%f", model.quantity)
        let temp: Double
        temp = Double(model.quantity) * model.price
        let total: String = String(format: "%f", temp)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.name
        cell.textLabel?.text = price
        cell.textLabel?.text = quantity
        cell.textLabel?.text = total
        //cell.textLabel?.text = model.createdAt
        return cell
    }
    
    
    //get all items
    func getAllItems(){
        do{
             models = try context.fetch(Expenses.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }catch{
            //error
        }
    }
    //create items
    func createItems(name: String, price: Double, quantity: Int16){
        let newItem = Expenses(context: context)
        newItem.name = name
        newItem.price = price
        newItem.quantity = quantity
        
        do{
            let items = try context.fetch(Expenses.fetchRequest())
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


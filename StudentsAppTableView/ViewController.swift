//
//  ViewController.swift
//  StudentsAppTableView
//
//  Created by odc on 19/03/2023.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    

    
    @IBOutlet weak var tvstudent: UITableView!

    
    @IBOutlet weak var txtName: UITextField!
    
    var arrStudent=[String]()
    var arrFav=[String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tvstudent.delegate=self
        tvstudent.dataSource=self
    }
    

    @IBAction func btnEdit(_ sender: UIButton) {
        tvstudent.isEditing = !tvstudent.isEditing
        
        
        
    }
    
    @IBAction func btnadd(_ sender: UIButton) {
        
        
        let name = txtName.text
        if name != "" {
            arrStudent.append(name!)
            let indexpath=IndexPath(row: arrStudent.count-1, section: 0)
            tvstudent.beginUpdates()
            tvstudent.insertRows(at: [indexpath], with: .automatic)
            tvstudent.endUpdates()
         
            txtName.text=""
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        arrStudent.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        print(arrStudent)
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteButton=UIContextualAction(style: .destructive, title: "Delete" ) {_,_,_ in
            self.arrStudent.remove(at: indexPath.row)
            self.tvstudent.beginUpdates()
            self.tvstudent.deleteRows(at: [indexPath], with: .automatic)
            self.tvstudent.endUpdates()
            
            
        }
        
        let favoriteButton=UIContextualAction(style: .normal, title: "Favorite") { _, _, _ in
            
            self.arrFav.append(self.arrStudent[indexPath.row])
            
            
            
        }
        deleteButton.image=UIImage(systemName: "trash")
        favoriteButton.image=UIImage(systemName: "heart.fill")
        
        
        
        return UISwipeActionsConfiguration(actions: [deleteButton,favoriteButton])
        
        
        
    }
 

        
        
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrStudent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tvstudent.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text=arrStudent[indexPath.row]
        
        return cell
        
        
        
    }
    
}


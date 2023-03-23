//
//  sectionsViewController.swift
//  StudentsAppTableView
//
//  Created by odc on 19/03/2023.
//

import UIKit

class sectionsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var lbldatanotfound: UILabel!
    
    @IBOutlet weak var imgdatanotfound: UIImageView!
    @IBOutlet weak var tableview: UITableView!
    
    var arrSections=["A","M","F","Z"]
    var arrStudents=["Ahmed","Abdallah","Ali","Mohamed","Moaz","Mina","Fahd","Fares","Ziad"]
    
    
    var refresh=UIRefreshControl()
    var arrNewStudent=["Khaled","Moaz"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableview.delegate=self
        tableview.dataSource=self
        
        arrSections.removeAll()
        
        if arrSections.count == 0 {
            print("hidden")
            tableview.isHidden=true
            
        }
        refresh.addTarget(self, action: #selector(getData), for: .valueChanged)
        
        tableview.addSubview(refresh)
        
        
        
        
    }
    
    
    @objc
    func getData(){

     
        if arrNewStudent.count>=0{
            
            arrStudents.append(contentsOf: arrNewStudent)
            
            refresh.endRefreshing()
            tableview.reloadData()
            arrNewStudent.removeAll()
            
            
        }

  
        
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return arrSections.count
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text=arrStudents[indexPath.row]
        
        
        
        return cell
        
        
    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return arrSections
//    }
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return "Footer: \(arrSections)"
//    }
//
    



}

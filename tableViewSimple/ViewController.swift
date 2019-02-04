//
//  ViewController.swift
//  tableViewSimple
//
//  Created by Mac on 03/02/19.
//  Copyright © 2019 bhadresh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableViewByTech: UITableView!
    @IBOutlet weak var tableViewAll: UITableView!
    let cellIdentifire = "infoCell"
    
    //data
    var infoArr = [Information]()
    
    
    var infoArrJava = [Information]()
    
    var infoArriOS = [Information]()
    
    var infoArrAndroid = [Information]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var info = Information(id: 2, name: "Harsha", course: .Swift)
//        infoArr.append(info)
        //step 2 after design
        infoArr = [
            Information(id: 1, name: "Bhadresh", course: .iPhone),
            Information(id: 1, name: "Harsha", course: .AdvanceJava),
            Information(id: 1, name: "Rushi", course: .Swift),
            Information(id: 1, name: "Rishi", course: .Android),
            Information(id: 1, name: "Haresh", course: .PHP)
        ]
        
        
        
        infoArriOS = [
            Information(id: 1, name: "asdads", course: .iPhone),
            Information(id: 1, name: "asdasd", course: .iPhone),
            Information(id: 1, name: "we", course: .iPhone),
            Information(id: 1, name: "Risdafsdfshi", course: .iPhone),
            Information(id: 1, name: "sdfsdf", course: .iPhone)
        ]
        
        
        infoArrJava = [
            Information(id: 1, name: "Bhadresh", course: .AdvanceJava),
            Information(id: 1, name: "Harsha", course: .AdvanceJava),
            Information(id: 1, name: "Rushi", course: .AdvanceJava),
            Information(id: 1, name: "Rishi", course: .AdvanceJava),
            Information(id: 1, name: "Haresh", course: .AdvanceJava),
            Information(id: 1, name: "Haresh", course: .AdvanceJava)
        ]
        
        
        infoArrAndroid = [
            Information(id: 1, name: "dfdfer", course: .Android),
            Information(id: 1, name: "f", course: .Android),
            Information(id: 1, name: "Rusdshi", course: .Android),
            Information(id: 1, name: "Risxzcvhi", course: .Android),
            Information(id: 1, name: "Harxcvesh", course: .Android),
            Information(id: 1, name: "Risxzcvhi", course: .Android),
            Information(id: 1, name: "Harxcvesh", course: .Android)
        ]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//step3 assign delegate and datasouce

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    //***for simple
//    //section
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    //rows
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return infoArr.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        //cell
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath)
//
//        let info = infoArr[indexPath.row]
//        cell.textLabel?.text = info.name
//        cell.detailTextLabel?.text = "\(info.course)"
//
//        return cell
//
//    }
    
    //***for multiple
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == tableViewAll{
            return 1
        }
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableViewAll{
            return infoArr.count
        }
        switch section {
        case 0:
            return infoArriOS.count
        case 1:
            return infoArrJava.count
        case 2:
            return infoArrAndroid.count
        default:
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tableViewAll{
            return ForAll(tableView1: tableView, indexPath: indexPath, cellIde: "infoCell")
        }
        
        switch indexPath.section {
        case 0:
            return ForTech(tableView1: tableView, indexPath: indexPath, cellIde: "techCell", c: .iPhone)
        
        case 1:
            return ForTech(tableView1: tableView, indexPath: indexPath, cellIde: "techCell", c: .AdvanceJava)
            
        case 2:
            return ForTech(tableView1: tableView, indexPath: indexPath, cellIde: "techCell", c: .Android)
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath)
            return cell
        }
        
    }
    
    func ForAll(tableView1:UITableView,indexPath:IndexPath,cellIde:String) -> UITableViewCell {
        let cell = tableView1.dequeueReusableCell(withIdentifier: cellIde, for: indexPath)
        
        let info = infoArr[indexPath.row]
        cell.textLabel?.text = info.name
        cell.detailTextLabel?.text = "\(info.course)"
        
        return cell
    }
    
    
    func ForTech(tableView1:UITableView,indexPath:IndexPath,cellIde:String,c:Course) -> UITableViewCell {
        let cell = tableView1.dequeueReusableCell(withIdentifier: cellIde, for: indexPath)
        
        var info = Information()
        
        if c == .iPhone{
            info = infoArriOS[indexPath.row]
        }
        else if c == .AdvanceJava{
            info = infoArrJava[indexPath.row]
            
        }
        else{
            info = infoArrAndroid[indexPath.row]
            
        }
        
        

        cell.textLabel?.text = info.name
        cell.detailTextLabel?.text = "\(info.course)"
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == tableViewAll{
            return ""
        }
        switch section {
        case 0:
            return "iPhone"
        case 1:
            return "Advance Java"
        case 2:
            return "Android"
        default:
            return ""
        }
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        
        if tableView == tableViewAll{
            return ""
        }
        switch section {
        case 0:
            return "End iPhone"
        case 1:
            return "End Advance Java"
        case 2:
            return "End Android"
        default:
            return ""
        }
    }
    
    
    
}

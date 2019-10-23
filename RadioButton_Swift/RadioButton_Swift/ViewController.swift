//
//  ViewController.swift
//  RadioButton_Swift
//
//  Created by mallikarjun on 21/10/19.
//  Copyright © 2019 Mallikarjun H. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var chatRadioButtonSelected:Bool = false
    var audioRadioButtonSelected:Bool = false
    var videoRadioButtonSelected:Bool = false
    
    @IBOutlet weak var mainTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.isScrollEnabled = false
        mainTableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
           
          let cell = tableView.dequeueReusableCell(withIdentifier: "RadioCell1Id", for: indexPath) as! RadioCell1
            cell.selectionStyle = UITableViewCell.SelectionStyle.none;
            
            if chatRadioButtonSelected{
                cell.radioImg.image = UIImage(named: "Radiobutton_On")
            }else{
                cell.radioImg.image = UIImage(named: "Radiobutton_Off")
            }
           return cell
        }
        else if indexPath.section == 1{
           
            let cell = tableView.dequeueReusableCell(withIdentifier: "RadioCell2Id", for: indexPath) as! RadioCell2
            cell.selectionStyle = UITableViewCell.SelectionStyle.none;
            
            if audioRadioButtonSelected{
                cell.radioImg.image = UIImage(named: "Radiobutton_On")
            }else{
                cell.radioImg.image = UIImage(named: "Radiobutton_Off")
            }
            
            return cell
        }
        else{
          
            let cell = tableView.dequeueReusableCell(withIdentifier: "RadioCell3Id", for: indexPath) as! RadioCell3
            cell.selectionStyle = UITableViewCell.SelectionStyle.none;
            
            if videoRadioButtonSelected{
                cell.radioImg.image = UIImage(named: "Radiobutton_On")
            }else{
                cell.radioImg.image =  UIImage(named: "Radiobutton_Off")
            }
            
            return cell
        }
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50.0

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0{
            
            print("chat")
            chatRadioButtonSelected = true
            audioRadioButtonSelected = false
            videoRadioButtonSelected = false
            
            reloadTableView()
        }
        else if indexPath.section == 1{
            
            print("audio")
            chatRadioButtonSelected = false
            audioRadioButtonSelected = true
            videoRadioButtonSelected = false
            
            reloadTableView()
        }
        else{
            
            print("video")
            chatRadioButtonSelected = false
            audioRadioButtonSelected = false
            videoRadioButtonSelected = true
            reloadTableView()
        }
    }
    
    func reloadTableView(){
        
        self.mainTableView.reloadData()
    }

}


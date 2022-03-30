//
//  HomeVC.swift
//  CheckBox
//
//  Created by MallikarjunH on 30/03/22.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var checkUncheckBoxImg: UIImageView!
    @IBOutlet weak var checkUncheckBoxButton: UIButton!
    
    var imageCheckBoxSelected = false
    var buttonCheckBoxSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.checkUncheckBoxImgAction))
        checkUncheckBoxImg.addGestureRecognizer(tap)
        checkUncheckBoxImg.isUserInteractionEnabled = true
        
        self.setupInitialUI()
    }

    func setupInitialUI() {
        self.checkUncheckBoxImg.image = UIImage(named: "uncheck")
        self.checkUncheckBoxButton.setImage(UIImage(named: "uncheck"), for: .normal)
    }
    
    
    //MARK: Image Action
    @objc func checkUncheckBoxImgAction() {
        DispatchQueue.main.async {
            if self.imageCheckBoxSelected {
                self.imageCheckBoxSelected = false
                self.checkUncheckBoxImg.image = UIImage(named: "uncheck")
            }else{
                self.imageCheckBoxSelected = true
                self.checkUncheckBoxImg.image = UIImage(named: "check")
            }
        }
        
    }
    
    //MARK: Button Action
    @IBAction func checkUncheckBoxButtonAction(_ sender: Any) {
        DispatchQueue.main.async {
            if self.buttonCheckBoxSelected {
                self.buttonCheckBoxSelected = false
                self.checkUncheckBoxButton.setImage(UIImage(named: "uncheck"), for: .normal)
            }else{
                self.buttonCheckBoxSelected = true
                self.checkUncheckBoxButton.setImage(UIImage(named: "check"), for: .normal)
            }
        }
    }
    
}

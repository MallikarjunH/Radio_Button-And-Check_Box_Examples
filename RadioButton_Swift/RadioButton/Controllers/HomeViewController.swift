//
//  HomeViewController.swift
//  RadioButton
//
//  Created by EOO61 on 30/03/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var maleRadioImg: UIImageView!
    @IBOutlet weak var femaleRadioImg: UIImageView!
    
    @IBOutlet weak var vegRadioButton: UIButton!
    @IBOutlet weak var nonVegRadioButton: UIButton!
    
    var maleSelected = false
    var vegSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.initialSetupUI()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.maleRadioImgAction))
        maleRadioImg.addGestureRecognizer(tap)
        maleRadioImg.isUserInteractionEnabled = true
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.femaleRadioImgAction))
        femaleRadioImg.addGestureRecognizer(tap2)
        femaleRadioImg.isUserInteractionEnabled = true
    }
    
    func initialSetupUI() {
        self.maleRadioImg.image = UIImage(named: "radioOff")
        self.femaleRadioImg.image = UIImage(named: "radioOff")
        self.vegRadioButton.setImage(UIImage(named: "radioOff"), for: .normal)
        self.nonVegRadioButton.setImage(UIImage(named: "radioOff"), for: .normal)
    }
    
    //MARK: Radio using UIImage
    @objc func maleRadioImgAction() {
        self.maleSelected = true
        self.updateGenderRadioSelectionUI()
    }
    @objc func femaleRadioImgAction() {
        self.maleSelected = false
        self.updateGenderRadioSelectionUI()
    }
    func updateGenderRadioSelectionUI() {
        DispatchQueue.main.async {
            if self.maleSelected {
                self.maleRadioImg.image = UIImage(named: "radioOn")
                self.femaleRadioImg.image = UIImage(named: "radioOff")
            }else{
                self.maleRadioImg.image = UIImage(named: "radioOff")
                self.femaleRadioImg.image = UIImage(named: "radioOn")
            }
        }
    }
    
    //MARK: Radio using UIButtons
    @IBAction func vegRadioButtonSelected(_ sender: Any) {
        self.vegSelected = true
        self.updateFoodRadioSelectionUI()
    }
    @IBAction func nonVegRadioButtonSelected(_ sender: Any) {
        self.vegSelected = false
        self.updateFoodRadioSelectionUI()
    }
    
    func updateFoodRadioSelectionUI() {
        DispatchQueue.main.async {
            if self.vegSelected {
                self.vegRadioButton.setImage(UIImage(named: "radioOn"), for: .normal)
                self.nonVegRadioButton.setImage(UIImage(named: "radioOff"), for: .normal)
            }else{
                self.vegRadioButton.setImage(UIImage(named: "radioOff"), for: .normal)
                self.nonVegRadioButton.setImage(UIImage(named: "radioOn"), for: .normal)
            }
        }
    }
}

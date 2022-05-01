//
//  ViewControllerSeconVIew.swift
//  LoginPassword
//
//  Created by mac on 28.04.2022.
//

import UIKit

class ViewControllerSeconVIew: UIViewController {
    
    // MARK: IB Outlets
    @IBOutlet var welcomeLable: UILabel!
    
    // MARK: Public propeties
    var responses: String!
     
    // MARK: Private properties
    
    private let primaryColor = UIColor(red: 210/255, green: 109/255, blue: 128/255, alpha: 1)
    private let secondColor = UIColor(red: 107/255, green: 148/255, blue: 230/255, alpha: 1)
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondColor)
        
        welcomeLable.text = "Welcome, \(responses ?? "No Name")!"
    }
    

}


// MARK: Set background color

extension ViewControllerSeconVIew {
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
    }
}

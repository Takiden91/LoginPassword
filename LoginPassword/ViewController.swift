//
//  ViewController.swift
//  LoginPassword
//
//  Created by mac on 28.04.2022.
//

import UIKit

class ViewController: UIViewController {

    // MARK: IB Outiet
    @IBOutlet var textFieldName: UITextField!
    @IBOutlet var textFieldRassword: UITextField!
    
    // MARK: Private properties
    private let dictionaryNamePassword: [String: Int] = ["Kakao": 120391]
    
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "nextView" else { return }
        let secondView = segue.destination as! ViewControllerSeconVIew
        secondView.responses = textFieldName.text ?? ""
        
       
    }

    
    // MARK: IBActions
    
    @IBAction func LogInAction() {
        if textFieldName.text == dictionaryNamePassword.keys.first && Int(textFieldRassword.text ?? "") == dictionaryNamePassword.first?.value {
            performSegue(withIdentifier: "nextView", sender: nil)
        } else {
            showAlert(title: "Invalid login or password", message: "Please, enter correct login and password", textField: textFieldRassword)
        }
        
    }
    
    @IBAction func suggestionUserName() {
        showAlert(title: "Ooops", message: "User name is Kakao")
    }
    
    @IBAction func suggestionPassword() {
        showAlert(title: "Ooops", message: "Password is Denis's birthday")
    }
    
    
    @IBAction func cansel(segue: UIStoryboardSegue) {
        textFieldName.text = nil
        textFieldRassword.text = nil
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldName.delegate = self
        textFieldRassword.delegate = self
    }
    
}
    
        
// MARK: Alert Controller

extension ViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in textField?.text = nil
            
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: Text Field Delegate
extension ViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFieldName {
            textField.resignFirstResponder()
            textFieldRassword.becomeFirstResponder()
        } else {
            LogInAction()
        }
        return true
    }
}

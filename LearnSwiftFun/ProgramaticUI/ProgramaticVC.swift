//
//  ProgramaticVC.swift
//  LearnSwiftFun
//
//  Created by Piyush Rathi on 17/06/25.
//

import UIKit

class ProgramaticVC: UIViewController {
    var cluesLabel: UILabel!
    var answersLabel: UILabel!
    var userName: UITextField!
    var password: UITextField!

    var scoreLabel: UILabel!
    var letterButtons = [UIButton]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        designLoginScreen()
    }
    
    func designLoginScreen() {
        let heading = UILabel()
        heading.text = "LOGIN"
        heading.font = UIFont.boldSystemFont(ofSize: 22)
        heading.translatesAutoresizingMaskIntoConstraints = false
        heading.textAlignment = .center
//        heading.backgroundColor = .red
        self.view.addSubview(heading)
        
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageView)
        
        let centerView = UIView(frame: .zero)
        centerView.backgroundColor = .lightGray
        centerView.translatesAutoresizingMaskIntoConstraints = false
        centerView.layer.borderWidth = 1.0
        centerView.layer.borderColor = UIColor.black.cgColor
        centerView.layer.shadowOffset = CGSize(width: 5,height: 5)
        centerView.layer.shadowRadius = 5
        centerView.layer.shadowOpacity = 0.3
        centerView.layer.shouldRasterize = true
        centerView.layer.rasterizationScale = UIScreen.main.scale

        userName = UITextField()
        userName.placeholder = "Username"
        userName.font = UIFont.systemFont(ofSize: 17.0)
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.backgroundColor = .white
        userName.setLeftPaddingPoints(10)
        centerView.addSubview(userName)
        
        password = UITextField()
        password.placeholder = "Password"
        password.isSecureTextEntry = true
        password.font = UIFont.systemFont(ofSize: 17.0)
        password.translatesAutoresizingMaskIntoConstraints = false
        password.backgroundColor = .white
        password.setLeftPaddingPoints(10)
        centerView.addSubview(password)
        
        let login = UIButton(type: .custom)
        login.setTitle("LOGIN", for: .normal)
        login.translatesAutoresizingMaskIntoConstraints = false
        login.backgroundColor = .blue
        login.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        centerView.addSubview(login)
        self.view.addSubview(centerView)
        
        NSLayoutConstraint.activate([
            centerView.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            centerView.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor),
            centerView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.9),
            centerView.heightAnchor.constraint(equalToConstant: 200),
            
            heading.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            heading.bottomAnchor.constraint(equalTo: centerView.topAnchor, constant: -30),
            heading.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor),
            heading.heightAnchor.constraint(equalToConstant: 30.0),

            imageView.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.25),
            imageView.bottomAnchor.constraint(lessThanOrEqualTo: heading.topAnchor, constant: -10),
            imageView.heightAnchor.constraint(equalToConstant: 80.0),
            
            userName.topAnchor.constraint(equalTo: centerView.topAnchor, constant: 20),
            userName.widthAnchor.constraint(equalTo: centerView.widthAnchor, multiplier: 0.9),
            userName.centerXAnchor.constraint(equalTo: centerView.centerXAnchor),
            userName.heightAnchor.constraint(equalToConstant: 40),
            
            password.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 20),
            password.leadingAnchor.constraint(equalTo: userName.leadingAnchor),
            password.trailingAnchor.constraint(equalTo: userName.trailingAnchor),
            password.heightAnchor.constraint(equalTo: userName.heightAnchor),
            
            login.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 20),
            login.leadingAnchor.constraint(equalTo: userName.leadingAnchor),
            login.trailingAnchor.constraint(equalTo: userName.trailingAnchor),
            login.heightAnchor.constraint(equalTo: userName.heightAnchor),
        ])
//        centerView.setContentHuggingPriority(.defaultHigh, for: .vertical)
//        imageView.setContentHuggingPriority(.defaultLow, for: .vertical)
    }
    
   @objc func loginButtonAction() {
        if userName.text?.isEmpty ?? false {
            showAlert(message: "Username is required")
        } else if password.text?.isEmpty ?? false {
            showAlert(message: "Password is required")
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: message, message: "", preferredStyle: .alert)
       alert.addAction(UIAlertAction(title: "OK", style: .default))
       present(alert, animated: true)
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

//
//  LoginViewController.swift
//  Login
//
//  Created by Lorenzo Limoli on 28/09/22.
//

import UIKit

public enum UserState{
    case loggedIn
    case loggedOut
}

public protocol LoginProtocol{
    func didTapLogin(completion: @escaping (UserState) -> Void)
    func onLoginSuccess()
}

public final class LoginViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    private var _loginProtocol: LoginProtocol?
    
    @discardableResult
    public func with(loginProtocol: LoginProtocol) -> Self{
        _loginProtocol = loginProtocol
        return self
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func didTapLogin() {
        activityIndicator.startAnimating()
        _loginProtocol?.didTapLogin{ [weak self] userState in
            self?.activityIndicator.stopAnimating()
            switch userState{
            case .loggedIn: self?._loginProtocol?.onLoginSuccess()
            case .loggedOut: self?.showAlertError()
            }
        }
    }
    
    private func showAlertError(){
        let controller = UIAlertController(title: "Ops, something went wrong", message: "Try to login later", preferredStyle: .alert)
        
        controller.addAction(UIAlertAction(title: "Ok", style: .default))
        
        self.present(controller, animated: true)
    }
}

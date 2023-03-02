//
//  ViewController.swift
//  Ejercicio
//
//  Created by administrador on 01/03/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var mensajeErrorLabel: UILabel!
    
    private var loginViewModel: LoginViewModel!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        self.inicializar()
        self.enlazarListeners()
    }
    
    func inicializar(){
        self.loginViewModel = LoginViewModel()
        self.emailTextField.text = ""
        self.passwordTextField.text = ""
    }
    
    func enlazarListeners(){
        self.loginViewModel.mensajeError.enlazarListener(){ error in
            self.mensajeErrorLabel.isHidden = false
            self.mensajeErrorLabel.text = error
        }
        
        self.loginViewModel.errorEnEmail.enlazarListener(){ errorEnEmail in
            if errorEnEmail {
                self.remarcarTextField(self.emailTextField)
            }
        }
        
        self.loginViewModel.errorEnPassword.enlazarListener(){ errorEnPassword in
            if errorEnPassword {
                self.remarcarTextField(self.passwordTextField)
            }
        }
    }
    
    @IBAction func iniciarSesionButtonPressed(_ sender: UIButton) {
        self.loginViewModel.actualizarCredenciales(email: self.emailTextField.text!, password: self.passwordTextField.text!)
        
        switch self.loginViewModel.validarCredenciales() {
        case .Correcto:
            self.loginViewModel.login()
            performSegue(withIdentifier: "LoginToHome", sender: self)
        case .Incorrecto:
            print("Credenciales incorrectas")
        }
    }
    
    func remarcarTextField(_ textField: UITextField){
        textField.resignFirstResponder()
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.cornerRadius = 3
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let homeViewController = segue.destination as? HomeView else {return}
        homeViewController.email = self.emailTextField.text!
    }
}

// MARK: - TextField Delegate
extension ViewController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.mensajeErrorLabel.isHidden = true
        emailTextField.layer.borderWidth = 0
        passwordTextField.layer.borderWidth = 0
    }
    
}

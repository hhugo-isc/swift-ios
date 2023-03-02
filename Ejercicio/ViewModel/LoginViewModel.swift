//
//  LoginViewModel.swift
//  Ejercicio
//
//  Created by administrador on 02/03/23.
//

import Foundation

class LoginViewModel{
    
    private var email: String = ""
    private var password: String = ""
    let mensajeError: Observable<String> = Observable(value:"")
    let errorEnEmail: Observable<Bool> = Observable(value: false)
    let errorEnPassword: Observable<Bool> = Observable(value: false)
    
    private var credenciales: Credenciales {
        didSet {
            self.email = credenciales.email
            self.password = credenciales.password
        }
    }
    
    init(){
        self.credenciales = Credenciales(email: "", password: "")
    }
    
    func validarCredenciales()->Estado{
        // validar email
        let emailValido = validarEmail()
        if !emailValido{
            self.mensajeError.value = "El email no es válido"
            self.errorEnEmail.value = true
            return .Incorrecto
        }
        // validar password
        let passwordValido = validarPassword()
        if !passwordValido {
            self.mensajeError.value = "El password no es válido"
            self.errorEnPassword.value = true
            return .Incorrecto
        }
        
        return .Correcto
    }
    
    func actualizarCredenciales(email: String, password: String){
        self.credenciales = Credenciales(email: email, password: password)
    }
    
    func login(){
        print("Login con exito")
    }
    
    func validarEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPred.evaluate(with: email)
    }
    
    func validarPassword() -> Bool{
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])[a-zA-Z0-9]{8,}$"
    
        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
        return passwordPred.evaluate(with: password)
    }
    
}

// MARK: - Estado del formulario
enum Estado{
    case Correcto
    case Incorrecto
}

//
//  NuevoContacto.swift
//  contactos-app
//
//  Created by administrador on 08/03/23.
//
import UIKit

class NuevoContacto: UIViewController {

    
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    @IBOutlet weak var eliminarBarButton: UIBarButtonItem!
    @IBOutlet weak var nombreTF: UITextField!
    @IBOutlet weak var apellidoPaternoTF: UITextField!
    @IBOutlet weak var edadTF: UITextField!
    @IBOutlet weak var correoElectronicoTF: UITextField!
    @IBOutlet weak var telefonoTF: UITextField!
    
    
    weak var delegate: NuevoContactoDelegate?
    var contacto: Contacto?
    var accion = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.topItem?.title = "\(accion) Contacto"
        self.eliminarBarButton.isEnabled = false
        self.llenarTextFields()
    }

    func llenarTextFields(){
        if let contacto = self.contacto {
            nombreTF.text = contacto.nombre
            apellidoPaternoTF.text = contacto.apellidoPaterno
            edadTF.text = contacto.edad
            correoElectronicoTF.text = contacto.correoElectronico
            telefonoTF.text = contacto.telefono
            self.eliminarBarButton.isEnabled = true
        }
    }
    
    @IBAction func guardarButtonPressed(_ sender: Any) {
        if let nombre = nombreTF.text, let apellidoPaterno = apellidoPaternoTF.text,
           let edad = edadTF.text, let correoElectronico = correoElectronicoTF.text,
           let telefono = telefonoTF.text {
            delegate?.guardarContacto(nombre, apellidoPaterno, edad, correoElectronico, telefono)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelarButtonPressed(_ sender: UIBarButtonItem) {
        self.delegate?.cancelar()
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func eliminarButtonPressed(_ sender: UIBarButtonItem) {
        self.delegate?.eliminar()
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

protocol NuevoContactoDelegate: AnyObject {
    
    func guardarContacto(_ nombre: String, _ apellidoPaterno:String, _ edad: String, _ correoElectronico:String, _ telefono:String)
    
    func eliminar()
    
    func cancelar()
}

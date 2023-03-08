//
//  ContactosViewModel.swift
//  contactos-app
//
//  Created by administrador on 08/03/23.
//

import Foundation
import RxSwift

class ContactosViewModel {
    
    var contactos: BehaviorSubject<[Contacto]> = BehaviorSubject(value: [])
    
    private var _contactos: [Contacto] = [] {
        didSet {
            contactos.onNext(_contactos)
        }
    }
    
    func agregarContacto(_ nombre: String, _ apellidoPaterno: String, _ edad: String, _ correoElectronico: String, _ telefono: String){
        _contactos.append(Contacto(nombre: nombre, apellidoPaterno: apellidoPaterno, edad: edad, correoElectronico: correoElectronico, telefono: telefono))
    }
    
    func eliminarContacto(conIndice indice: Int){
        _contactos.remove(at: indice)
    }
    
    func editarContacto(_ nombre: String, _ apellidoPaterno: String, _ edad: String, _ correoElectronico: String, _ telefono: String, conIndice indice: Int){
        _contactos[indice] = Contacto(nombre: nombre, apellidoPaterno: apellidoPaterno, edad: edad, correoElectronico: correoElectronico, telefono: telefono)
    }

}

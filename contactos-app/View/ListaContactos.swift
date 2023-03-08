//
//  ListaContactos.swift
//  contactos-app
//
//  Created by administrador on 08/03/23.
//

import UIKit

class ListaContactos: UIViewController {
    
    @IBOutlet weak var listaContactosTV: UITableView!
    private let contactosVM: ContactosViewModel = ContactosViewModel()
    private var modoEdicion: Bool = false
    private var rowIndex: Int = -1
    
    private var listaContactos: [Contacto] =  [] {
        didSet{
            listaContactosTV.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listaContactosTV.dataSource = self
        listaContactosTV.delegate = self
        listaContactosTV.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        contactosVM.contactos.subscribe(){
            self.listaContactos = $0
        }
    }
    
    @IBAction func agregarButtonPressed(_ sender: UIBarButtonItem) {
        let nuevoContactoVC = NuevoContacto()
        nuevoContactoVC.delegate = self
        nuevoContactoVC.accion = "Nuevo"
        self.navigationController?.pushViewController(nuevoContactoVC, animated: true)
    }
}

extension ListaContactos: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaContactos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! ContactoCell
        cell.nombreLabel.text = listaContactos[indexPath.row].nombre
        return cell
    }
}

extension ListaContactos: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contacto = listaContactos[indexPath.row]
        let nuevoContactoVC = NuevoContacto()
        
        self.modoEdicion = true
        self.rowIndex = indexPath.row
        
        nuevoContactoVC.delegate = self
        nuevoContactoVC.contacto = contacto
        nuevoContactoVC.accion = "Editar"
        
        self.navigationController?.pushViewController(nuevoContactoVC, animated: true)
    }
}

extension ListaContactos: NuevoContactoDelegate {
    func guardarContacto(_ nombre: String, _ apellidoPaterno: String, _ edad: String, _ correoElectronico: String, _ telefono: String) {
        if self.modoEdicion && self.rowIndex != -1 {
            self.contactosVM.editarContacto(nombre, apellidoPaterno, edad, correoElectronico, telefono, conIndice: self.rowIndex)
        }else{
            self.contactosVM.agregarContacto(nombre, apellidoPaterno, edad, correoElectronico, telefono)
        }
        self.modoEdicion = false
        self.rowIndex = -1
    }
    
    func eliminar(){
        self.contactosVM.eliminarContacto(conIndice: self.rowIndex)
    }
    
    func cancelar(){
        self.modoEdicion = false
        self.rowIndex = -1
    }
}

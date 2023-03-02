//
//  Observable.swift
//  Ejercicio
//
//  Created by administrador on 02/03/23.
//

import Foundation

class Observable<T>{
    
    typealias Listener = (T) -> Void
    
    private var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(value:T){
        self.value = value
    }
    
    func enlazarListener(listener: @escaping Listener){
        self.listener = listener
        self.listener?(value)
    }

}

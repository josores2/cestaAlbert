//
//  ProductosViewModel.swift
//  cesta de la compra
//
//  Created by Jose on 17/5/24.
//

import Foundation
import SwiftUI
import Combine
import FirebaseFirestore

class ProductosViewModel: ObservableObject {
    
    
    private var listener: ListenerRegistration?
//Creamos referencia a bbdd de Firebase, pero sin la colección, que pasará como argumento, para crear la sala
    var dbR = Firestore.firestore().collection("productos")
    @Published var coleccionesDB : [Producto] = []

    func startListeningProductos() {
            listener = dbR.addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(error!)")
                    return
                }
                self.coleccionesDB = documents.compactMap { document in
                    do {
                        let prod = try document.data(as: Producto.self)
                        return prod
                    }catch {
                        return nil
                    }
            }
        }
    }
    
    func stopListeningProductos() {
           listener?.remove()
       }
    
    
    func agregarProducto(producto: Producto) {
            do {
                _ = try dbR.addDocument(from: producto)
            } catch {
                print("Error agregando producto: \(error)")
            }
        }
    
    func fetchProductos() {
        dbR.getDocuments { querySnapshot, error in
            if let error = error {
                /*Contemplo error de conexión*/print(error)
                return
            }
        //Si hay mensajes en Firebase, los guardo en documents, sino print a consola
            guard let documents = querySnapshot?.documents else {
                return
            }
            if documents.isEmpty {
                // La colección está vacía
            } else {
                // La colección no está vacía, asignamos al array mensajesDB
                self.coleccionesDB = documents.compactMap { document in
                    do {
                        let coleccion = try document.data(as: Producto.self)
                        return coleccion
                    }catch {
                        return nil
                    }
            }
        }
        }
    }
        
}


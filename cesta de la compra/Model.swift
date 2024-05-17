//
//  Model.swift
//  cesta de la compra
//
//  Created by Jose on 15/5/24.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift
import FirebaseAuth
import FirebaseFirestore

struct Producto : Codable, Identifiable, Hashable {
    @DocumentID var id:String?
    var nombre: String
    var caracteristicas : String
    var precio : Float
    var usuarioE : String
}



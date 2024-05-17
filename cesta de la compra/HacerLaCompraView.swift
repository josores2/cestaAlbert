//
//  HacerLaCompraView.swift
//  cesta de la compra
//
//  Created by Jose on 15/5/24.
//

import SwiftUI


//Aquí mostrarremos un listado con los productos que tenemos guardados en la base de datos de Firebase, de modo que el usuario pueda seleccionarlos uno a uno para agregarlos al pedido final.
//Agregaremos un botón para realizar pedido con los productos seleccionados

struct HacerLaCompraView: View {
    
    @EnvironmentObject var authModel: AuthViewModel
    @State private var productosFB : [Producto] = []
    //Instanciamos variable para acceder a FB
    @ObservedObject private var productosVM = ProductosViewModel()
    
    var body: some View {
        VStack{
            self.onChange(of: productosVM.coleccionesDB) { nuevosProductos in
                    productosFB = nuevosProductos
            }
        Text("productos disponibles")
            .padding(5)
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(radius: 3)
            
        ScrollView {
            ForEach(productosFB, id: \.id) { elemento in
                Text(elemento.nombre)
                .padding(3)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 3)
            }
        }//Fin ScrollView
        }//Fin VStack
        .onAppear {
            productosVM.fetchProductos()
            productosVM.startListeningProductos()
            // Utilizamos el método map para obtener un array de String con el campo texto de cada mensaje y ordenados por la marca de tiempo
            //Cargamos en la variable, los mensajes ordenados
            productosFB = productosVM.coleccionesDB
            
            DispatchQueue.main.async {
                    productosFB = productosVM.coleccionesDB
                }
            
        }
        .onDisappear {
                   productosVM.stopListeningProductos()
        }
    }
}
/*
struct HacerLaCompraView_Previews: PreviewProvider {
    static var previews: some View {
        HacerLaCompraView()
    }
}*/

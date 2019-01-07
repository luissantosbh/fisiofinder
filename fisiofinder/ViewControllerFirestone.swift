//
//  ViewControllerFirestone.swift
//  fisiofinder
//
//  Created by Luís Antônio de Oliveira Santos on 02/01/19.
//  Copyright © 2019 Luís Antônio de Oliveira Santos. All rights reserved.
//

import UIKit
import Firestore
import Firebase

class ViewControllerFirestone: UIViewController {
   
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
       simpleQueries()


    }

    private func simpleQueries() {
        
         let db = Firestore.firestore()
     
        
        // Criar uma referência para a coleção "cities"
        let citiesRef = db.collection("cities")
        
        // Fazer uma consulta usando a coleção criada anteriormente
        let consulta = citiesRef.whereField("state", isEqualTo: "CA")
        
        
        print("Retorno da minha consulta: \(consulta)")
    
    }
}

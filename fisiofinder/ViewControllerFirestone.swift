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
        let citiesRef = db.collection("cities")
        let myQuery = citiesRef.whereField("state", isEqualTo: "CA")
        
        myQuery.getDocuments { (snapshot, error) in
            
            guard let snapshot = snapshot,
                error == nil else { // error
                    return print("database error: \(error!)")
            }
            
            guard !snapshot.isEmpty else { // no data
                return print("no data")
            }
            
            // data fetched, loop through documents
            
            for doc in snapshot.documents {
                
                guard let stateProperty = doc.get("state") as? String else {
                    continue // continue loop
                }
                print(stateProperty)
                
            }
            
        }
        
    }
    
}

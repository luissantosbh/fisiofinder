//
//  ViewControllerFirestone.swift
//  fisiofinder
//
//  Created by Luís Antônio de Oliveira Santos on 02/01/19.
//  Copyright © 2019 Luís Antônio de Oliveira Santos. All rights reserved.
//
import UIKit
import FirebaseFirestore

class ViewControllerFirestone: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        simpleQueries()
    }

    
    private func simpleQueries() {
        
        let db = Firestore.firestore()
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
        
        
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
                
                guard let country = doc.get("name"),
                      let name = doc.get("country"),
                      let population = doc.get("population"),
                      let state = doc.get("state")
                    else{
                    print("No data were found.")
                    return
                }
  
                print("Retorno da query: \(name), \(country),\(population),\(state)")
            }
            
        }
        
    }
    
}

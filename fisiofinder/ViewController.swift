//
//  ViewController.swift
//  fisiofinder
//
//  Created by Luís Antônio de Oliveira Santos on 09/10/17.
//  Copyright © 2017 Luís Antônio de Oliveira Santos. All rights reserved.
//

import UIKit
import FirebaseDatabase
import CoreData

class ViewController: UIViewController {
    
    
    @IBAction func botaoPesquisar(_ sender: Any) {
        
        
       let database = Database.database().reference()
      // let pacientes = database.child("Pacientes").child("-LL53oGc4RPPEjUzO-Tb").child("nome")
        
        let pacientes = database.child("Pacientes").queryOrdered(byChild: "nome").queryEnding(atValue: "8")
       //let testePesquisa = Database.database().reference().ch
        
        // print(pacientes)
     
        
        //Criar um listener para recuperar o dados cadastrados
        
        
        
        pacientes.observe(DataEventType.value, with: { (dados) in
            
            
            if  let testePacientes = dados.value{
             print (testePacientes)
            }
            
        })
        
    }

    @IBAction func botaoLimpar(_ sender: Any) {
       
        //Cria referencia com o DB
        let database = Database.database().reference()
        
       let pacientes = database.child("Pacientes")
        
        //apagar
         pacientes.removeValue()
         
        
        
    }
    @IBOutlet weak var nomePacienteDigitado: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()   
        
    
/*
        //Configurações para utilizar o Core Data
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
*/
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func botaoCadastrar(_ sender: Any) {
        
        //Criar referencia com o DB
        let database = Database.database().reference()
        
        //Recuperar texto digitado
        
        let pacientes = database.child("Pacientes")
        
       // let nomePaciente = nomePacienteDigitado.text
        
        var i = 0
        
        
        while i < 10 {
            let p = String (i)
            
        pacientes.childByAutoId().child("nome").setValue("paciente" + p)
        // pacientes.childByAutoId().child("nome").setValue(nomePaciente)
            
            i = i + 1
        }
        
        
    
    }

}


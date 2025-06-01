//
//  ViewController.swift
//  Rick&Morty Explorer
//
//  Created by Eduardo Frederico on 09/04/25.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        tfName.resignFirstResponder() // escondendo o teclado quando sair da tela
        let vc = segue.destination as! PersonsTableViewController
        vc.name = tfName.text // repassando o nome para TableView
    }

}


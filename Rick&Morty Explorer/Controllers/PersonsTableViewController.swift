//
//  PersonsTableViewController.swift
//  Rick&Morty Explorer
//
//  Created by Eduardo Frederico Sotero da Costa              on 13/05/25.
//

import UIKit

class PersonsTableViewController: UITableViewController {

    var name: String?
    var persons: [PersonResults] = []
    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    var loadingPersons = false // evitar que uma nova solicitação seja criada enquanto carrega a solicitação inicial, de personagens
    var currentPage = 0
    var total = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Buscando personagens. Aguarde..."
        loadPersons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    func loadPersons() {
        loadingPersons = true
        RMAPI.loadPersons(name: name, page: currentPage) { (info) in
            if let info = info {
                self.persons += info.data.status
                self.total = info.data.total
                print("Total:", self.total, "já incluídos:", self.persons.count)
                DispatchQueue.main.async {
                    self.loadingPersons = false
                    self.label.text = "Não foram encontrados personagens com o nome \(self.name!)."
                    self.tableView.reloadData()
                }
            }
            
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundView = persons.count == 0 ? label : nil
        return persons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

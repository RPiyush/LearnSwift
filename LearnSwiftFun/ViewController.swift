//
//  ViewController.swift
//  LearnSwiftFun
//
//  Created by Piyush Rathi on 16/06/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var listData: MainList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupScreen()
    }
    
    private func setupScreen() {
        self.navigationItem.title = "Learn Swift Fundamentals"
        if let listD = loadList() {
            listData = listD
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listData?.list.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        cell.textLabel?.text = listData?.list[indexPath.row].title ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "ProgramaticVC") as? ProgramaticVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController {
    fileprivate func loadList() -> MainList? {
        guard let url = Bundle.main.url(forResource: "mainlist", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let mainList = try? JSONDecoder().decode(MainList.self, from: data) else {
            return nil
        }
        return mainList
    }
}

struct MainList: Codable {
    let list: [ListItem]
}

struct ListItem: Codable {
    let title: String
}

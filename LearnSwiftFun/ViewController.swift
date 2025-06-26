//
//  ViewController.swift
//  LearnSwiftFun
//
//  Created by Piyush Rathi on 16/06/25.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var listData: MainList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupScreen()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.navigationItem.hidesBackButton = true
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
        guard let title = listData?.list[indexPath.row].title else { return }
        
        switch title {
            case TableValues.swiftUI.rawValue:
                navigateToSwiftUI()
            default:
                navigateToProgramaticVC()
        }
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
    
    fileprivate func navigateToProgramaticVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "ProgramaticVC") as? ProgramaticVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    fileprivate func navigateToSwiftUI() {
        let swiftUIView = SwiftUIView()
        let hostingController = UIHostingController(rootView: swiftUIView)
        self.navigationController?.pushViewController(hostingController, animated: true)
    }
}

struct MainList: Codable {
    let list: [ListItem]
}

struct ListItem: Codable {
    let title: String
}

enum TableValues: String {
    case storyboard = "UI With StroryBoard"
    case programmatic = "Programmatic UI"
    case swiftUI = "Swift UI"
}

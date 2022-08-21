//
//  ViewController.swift
//  SFSymbolsSwiftDemo
//
//  Created by ganyu on 2022/8/1.
//

import UIKit
import SwiftUI

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    lazy var w = UIScreen.main.bounds.size.width
    lazy var h = UIScreen.main.bounds.size.height
    private let reuseIdentifier = "ViewControllerReuseIdentifier"
    private let rowHeight = 100.0
    
    /**
     mock 数据
     */
    private let dataArray: Array = {
        return [(text: String(localized: "colors"), image: "eyedropper", viewController: "ColorViewController"),
                (text: String(localized: "weight"), image: "lineweight", viewController: "LineWeightViewController"),
                (text: String(localized: "design"), image: "doc.richtext", viewController: "DesignViewController")]
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.frame = self.view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.reuseIdentifier)
        tableView.backgroundColor = .black
        return tableView
    }()
    
    // doc.richtext

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.addSubview(self.tableView)
        
    }
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        let font = UIFont.systemFont(ofSize: 30)
        content.image = UIImage(systemName: self.dataArray[indexPath.row].image)?.applyingSymbolConfiguration(.init(font: font))?.applyingSymbolConfiguration(UIImage.SymbolConfiguration(hierarchicalColor: .systemOrange))
        content.text = self.dataArray[indexPath.row].text
        content.textProperties.color = .white
        content.textProperties.font = font

        cell.contentConfiguration = content
        cell.backgroundColor = .black
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .systemGray
        cell.selectedBackgroundView = backgroundView

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cls = classFromString(self.dataArray[indexPath.row].viewController) as! UIViewController.Type
        let viewController = cls.init()
        self.present(viewController, animated: true)
    }
    
    
    func classFromString(_ className: String) -> AnyClass! {
        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        let cls: AnyClass = NSClassFromString("\(namespace).\(className)")!
        return cls
    }

}


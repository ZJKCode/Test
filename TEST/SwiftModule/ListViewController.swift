//
//  ListViewController.swift
//  TEST
//
//  Created by zhangjikuan on 2019/6/18.
//  Copyright © 2019 winchannel. All rights reserved.
//

import UIKit

class ListViewController: BaseViewController {
    lazy var dataSource = [["A - art","A - apple","A - angle","A - aband","A - app","A - agree","A - argument","A - alarg","A - away","A - amount","A - age"],
                           ["B - art","B - apple","B - angle","B - aband","B - app","B - agree","B - argument","B - alarg","B - away","B - amount","B - age"],
                           ["C - art","C - apple","C - angle","C - aband","C - app","C - agree","C - argument","C - alarg","C - away","C - amount","C - age"],
                           ["D - art","D - apple","D - angle","D - aband","D - app","D - agree","D - argument","D - alarg","D - away","D - amount","D - age"],
                           ["E - art","E - apple","E - angle","E - aband","E - app","E - agree","E - argument","E - alarg","E - away","E - amount","E - age"],
                           ["F - art","F - apple","F - angle","F - aband","F - app","F - agree","F - argument","F - alarg","F - away","F - amount","F - age"]]

    lazy var sectionTitles = ["A","B","C","D","E","F"]

    lazy var tableView: UITableView = {
        let tab = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height),
                              style: .grouped)
        tab.backgroundColor = UIColor.white
        tab.delegate = self
        tab.dataSource = self
        tab.register(ListTableViewCell.self, forCellReuseIdentifier: "ListTableViewCell")
        return tab
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func configUI() {
        view.backgroundColor = UIColor.white
        title = "swift test list"
        view.addSubview(tableView)
    }
    
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {



    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = dataSource[section]
        return sections.count
    }

    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath)
        let celTitle = dataSource[indexPath.section][indexPath.row]
        cell.textLabel?.text = celTitle
        return cell
    }


    @available(iOS 2.0, *)
    func numberOfSections(in tableView: UITableView) -> Int  {
        return dataSource.count
    }


    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return sectionTitles[section] + "    header"
    }
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return sectionTitles[section] + "    footer"
    }


    // Editing

    // Individual rows can opt out of having the -editing property set for them. If not implemented, all rows are assumed to be editable.
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.row%2 == 0
    }


    // Moving/reordering

    // Allows the reorder accessory view to optionally be shown for a particular row. By default, the reorder control will be shown only if the datasource implements -tableView:moveRowAtIndexPath:toIndexPath:
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return indexPath.row%2 == 0
    }


    // Index
    // return list of section titles to display in section index view (e.g. "ABCD...Z#")
    @available(iOS 2.0, *)
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitles
    }
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    // Data manipulation - insert and delete support

    // After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
    // Not called for edit actions using UITableViewRowAction - the action's handler will be invoked instead
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataSource[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }


    // Data manipulation - reorder / moving support

    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        print(sourceIndexPath.section)
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showAlert(dataSource[indexPath.section][indexPath.row])
    }
}


//
//  SettingsViewController.swift
//  HackfestBrogrammers
//
//  Created by Khasanza on 3/24/18.
//  Copyright © 2018 Khasanza. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        // Do any additional setup after loading the view.
    }
    func configureTableView() {
        tableView.tableFooterView = UIView()
        tableView.register(UINib.init(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileTableViewCell")
        tableView.register(UINib.init(nibName: "SettingsTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingsTableViewCell")
        tableView.register(UINib.init(nibName: "LogoutTableViewCell", bundle: nil), forCellReuseIdentifier: "LogoutTableViewCell")
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : section == 1 ? 2 : 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
            cell.nameLabel.text = "Khasanza Mukhamed"
            return cell
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath) as! SettingsTableViewCell
            cell.settingsNameLabel.text = Constants.Settings.SettingsName[indexPath.row]
            cell.settingsImageView.image = UIImage(named: Constants.Settings.SettingsImageName[indexPath.row])
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LogoutTableViewCell", for: indexPath)
            cell.textLabel?.textColor = UIColor.init(netHex: Colors.RED)
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.text = "Выйти"
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let space: CGFloat = section == 0 ? 0 : 20
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.frame = CGRect(x: 0, y: 0, width: self.tableView.bounds.width, height: 30 + space)
        let label = UILabel(frame: CGRect(x: 16, y: 25 - space, width: self.tableView.bounds.width - 10, height: 20))
        view.addSubview(label)
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.darkGray
        label.text = Constants.Settings.SettingsTitle[section]
        return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 50 : section == 1 ? 30 : 0
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.groupTableViewBackground
        return view
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 3 ? 50 : 20
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let storyboard = UIStoryboard.init(name: "Profile", bundle: nil)
            let profileVC = storyboard.instantiateViewController(withIdentifier: "ProfileViewController")
            self.navigationController?.show(profileVC, sender: self)
        }
        else if indexPath.section == 1 {
            if indexPath.row == 0 {
                let storyboard = UIStoryboard.init(name: "Settings", bundle: nil)
                let profileVC = storyboard.instantiateViewController(withIdentifier: "ProfileViewController")
                self.navigationController?.show(profileVC, sender: self)
            }
            else {
                let storyboard = UIStoryboard.init(name: "Settings", bundle: nil)
                let profileVC = storyboard.instantiateViewController(withIdentifier: "LanguageViewController")
                self.navigationController?.show(profileVC, sender: self)
            }
        }
        else {
            
        }
    }
}

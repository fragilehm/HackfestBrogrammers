//
//  AddStoryViewController.swift
//  HackfestBrogrammers
//
//  Created by Khasanza on 3/24/18.
//  Copyright © 2018 Khasanza. All rights reserved.
//

import UIKit

class AddStoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var user_id = 1
    var stories = [Story]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarItems()

        addProfileNavigationItem()
        configureTableView()
        ServerManager.shared.getUserStory(user_id: user_id, setStories, error: showErrorAlert)
        // Do any additional setup after loading the view.
    }
    func setStories(stories: [Story]){
        self.stories = stories
        self.tableView.reloadData()
    }
    func addProfileNavigationItem() {
        let profileButton = UIButton.init(type: .system)
        profileButton.setImage(#imageLiteral(resourceName: "add").withRenderingMode(.alwaysOriginal), for: .normal)
        profileButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        profileButton.imageView?.contentMode = .scaleAspectFit
        profileButton.addTarget(self, action: #selector(addPressed(_:)), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: profileButton)
    }
    @objc func addPressed(_ button: UIButton) {
        let storyboard = UIStoryboard.init(name: "Settings", bundle: nil)
        let addingVC = storyboard.instantiateViewController(withIdentifier: "AddingStoryViewController")
        self.navigationController?.show(addingVC, sender: self)
        //self.navigationController?.popViewController(animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Истории"
    }
    func configureTableView() {
        tableView.tableFooterView = UIView()
        tableView.register(UINib.init(nibName: "StoryTableViewCell", bundle: nil), forCellReuseIdentifier: "StoryTableViewCell")
    }
    
}
extension AddStoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stories.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as! StoryTableViewCell
        cell.descriptionLabel.text = stories[indexPath.row].description
        cell.lastUpdateLabel.text = stories[indexPath.row].updated
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}

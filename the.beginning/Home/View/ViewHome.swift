//
//  ViewHome.swift
//  the.beginning
//
//  Created by Rosendo Vazquez on 22/07/22.
//

import Foundation
import UIKit
import SnapKit

class ViewHome: UIViewController {
  var presenter : ViewToPresenterProtocolHome?
  
  let posts = [
    PostModel(imagePost: "01", likes: 20, desc: "Volando el drone", userName: "Topslugger", liked: true, photoProfile: "01p"),
    PostModel(imagePost: "02", likes: 40, desc: "Fly 🚁", userName: "Thrillseeker", liked: false, photoProfile: "02p"),
    PostModel(imagePost: "03", likes: 20, desc: "Beach please!", userName: "Muscleman", liked: true, photoProfile: "03p"),
    PostModel(imagePost: "04", likes: 10, desc: "Let's get cook", userName: "Ruggedman", liked: false, photoProfile: "04p"),
    PostModel(imagePost: "05", likes: 20, desc: "work setup", userName: "LoneWolf", liked: true, photoProfile: "05p"),
    PostModel(imagePost: "06", likes: 20, desc: "views!", userName: "Thunderbolt", liked: false, photoProfile: "06p"),
    PostModel(imagePost: "07", likes: 20, desc: "Bird", userName: "Gunsmoke", liked: false, photoProfile: "07p"),
    PostModel(imagePost: "08", likes: 20, desc: "HelveticaNeue", userName: "Hulksmash", liked: true, photoProfile: "01p"),
    PostModel(imagePost: "09", likes: 20, desc: "", userName: "Ruggedheart", liked: false, photoProfile: "02p"),
    PostModel(imagePost: "10", likes: 20, desc: "", userName: "Mindbender", liked: true, photoProfile: "01p"),
    PostModel(imagePost: "12", likes: 20, desc: "HelveticaNeue", userName: "Powerpixel", liked: false, photoProfile: "02p"),
    PostModel(imagePost: "13", likes: 20, desc: "", userName: "Mysticlover", liked: true, photoProfile: "03p"),
    PostModel(imagePost: "14", likes: 20, desc: "", userName: "Outlawking", liked: false, photoProfile: "04p"),
    PostModel(imagePost: "15", likes: 20, desc: "", userName: "Tigerwoods", liked: true, photoProfile: "05p")
  ]
  
  
  
  lazy var viewHeaderContainer: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    return view
  }()
  
  lazy var viewTableContainer: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    return view
  }()
  
  lazy var imgLogo: UIImageView = {
    let image = UIImageView(image: UIImage(named: "logo"))
    image.clipsToBounds = true
    image.contentMode = .scaleAspectFill
    return image
  }()
  
  lazy var tableView : UITableView = {
    let tableView = UITableView()
    tableView.register(PostCell.self, forCellReuseIdentifier: PostCell.identifier)
    tableView.separatorStyle = .none
    tableView.allowsSelection = false
    tableView.showsVerticalScrollIndicator = false
    return tableView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .blue
    tableView.delegate = self
    tableView.dataSource = self
    setupView()
    
    
  }
  
  func setupView() {
    
    view.addSubview(viewHeaderContainer)
    viewHeaderContainer.snp.makeConstraints { make in
      make.width.equalToSuperview()
      make.centerX.equalToSuperview()
      make.height.equalTo(90)
      make.top.equalToSuperview()
    }
    
    viewHeaderContainer.addSubview(imgLogo)
    imgLogo.snp.makeConstraints { make in
      make.leading.equalToSuperview()
      make.bottom.equalToSuperview().offset(-8)
      make.height.equalTo(38)
      make.width.equalTo(view.frame.size.width / 2.1)
    }
    
    view.addSubview(viewTableContainer)
    viewTableContainer.snp.makeConstraints { make in
      make.top.equalTo(viewHeaderContainer.snp.bottom)
      make.width.equalToSuperview()
      make.bottom.equalToSuperview()
    }
    viewTableContainer.addSubview(tableView)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = viewTableContainer.bounds
  }
  
}

extension ViewHome: PresenterToViewProtocolHome{
  
}

extension ViewHome:UITableViewDataSource, UITableViewDelegate{
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.identifier, for: indexPath) as? PostCell else { return UITableViewCell() }
    cell.setDataPost(post: posts[indexPath.row])
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return posts.count
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: false)
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return view.frame.size.width + 86
  }
}

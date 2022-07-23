//
//  PostCell.swift
//  the.beginning
//
//  Created by Rosendo Vazquez on 22/07/22.
//

import UIKit
import SnapKit

class PostCell: UITableViewCell {
  static let identifier = "PostCell"
  
  let heightHeaderPost = 30.0
  let historyDefault = 26.0
  let heightBottomPost = 24.0
  let heightIconDefault = 22.0
  var hasHistory = true
  var officialDimension = 0
  var like = true
  var save = true
  
  
  lazy var viewHeaderPost: UIView = {
    let view = UIView()
    return view
  }()
  
  lazy var profilePhotoContainer: UIView = {
    let view = UIView()
    view.layer.cornerRadius = historyDefault / 2
    return view
  }()
  
  lazy var imgProfile: UIImageView = {
    let img = UIImageView(image: UIImage(named: "01p"))
    img.layer.cornerRadius = historyDefault / 2
    img.clipsToBounds = true
    img.contentMode = .scaleAspectFill
    
    return img
  }()
  
 
  lazy var lblUserName: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: "HelveticaNeue-Medium", size: 14)
    label.text = "username"
    label.textAlignment = .left
    return label
  }()
  
  lazy var imgPost: UIImageView = {
    let img = UIImageView(image: UIImage(named: "01"))
    img.clipsToBounds = true
    img.contentMode = .scaleAspectFill
    return img
  }()
  
  lazy var viewBottomPost: UIView = {
    let view = UIView()
    return view
  }()
  
  lazy var imgLike: UIButton = {
    let btn = UIButton()
    let img = like ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
    btn.setImage(img, for: .normal)
    btn.tintColor = like ? .red : .black
    return btn
  }()
  
  lazy var imgComment: UIImageView = {
    let img = UIImageView(image: UIImage(systemName: "message"))
    img.tintColor = .black
    return img
  }()
  
  lazy var imgSend: UIImageView = {
    let img = UIImageView(image: UIImage(systemName: "paperplane"))
    img.tintColor = .black
    return img
  }()
  
  lazy var imgSave: UIButton = {
    let btn = UIButton()
    let img = save ? "pin.fill" : "pin"
    btn.setImage(UIImage(systemName: img), for: .normal)
    btn.tintColor = .black
    return btn
  }()
  
  
  lazy var lblUserNameBottom: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: "HelveticaNeue-Medium", size: 14)
    label.text = "username"
    label.textAlignment = .left
    return label
  }()
  
  lazy var lblDesc: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: "HelveticaNeue", size: 14)
    label.text = "username"
    label.textAlignment = .left
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    officialDimension =  hasHistory ? 24 : 26
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func prepareForReuse() {
    //TODO: clear elements / set to nil
    
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    contentView.addSubview(viewHeaderPost)
    viewHeaderPost.snp.makeConstraints { make in
      make.width.equalToSuperview()
      make.height.equalTo(heightHeaderPost)
      make.leading.equalToSuperview()
      make.top.equalToSuperview()
    }
    
    viewHeaderPost.addSubview(profilePhotoContainer)
    profilePhotoContainer.snp.makeConstraints { make in
      make.width.height.equalTo(historyDefault)
      make.leading.equalTo(8)
      make.top.equalTo(2)
    }
    
    if hasHistory {
      imgProfile.layer.borderWidth = 2
      imgProfile.layer.borderColor = UIColor.white.cgColor
    }
    
    profilePhotoContainer.addSubview(imgProfile)
    imgProfile.snp.makeConstraints { make in
      make.width.height.equalTo(officialDimension)
      make.centerX.centerY.equalToSuperview()
    }
    
    viewHeaderPost.addSubview(lblUserName)
    lblUserName.snp.makeConstraints { make in
      make.width.equalTo(200)
      make.centerY.equalToSuperview()
      make.leading.equalTo(profilePhotoContainer.snp.trailing).offset(8)
    }
    
    contentView.addSubview(imgPost)
    imgPost.snp.makeConstraints { make in
      make.top.equalTo(viewHeaderPost.snp.bottom).offset(8)
      make.width.equalToSuperview()
      make.height.equalTo(380)
    }
    
    contentView.addSubview(viewBottomPost)
    viewBottomPost.snp.makeConstraints { make in
      make.top.equalTo(imgPost.snp.bottom)
      make.width.equalToSuperview()
      make.height.equalTo(36)
    }
    
    viewBottomPost.addSubview(imgLike)
    imgLike.snp.makeConstraints { make in
      make.width.height.equalTo(heightIconDefault)
      make.leading.equalTo(8)
      make.top.equalTo(4)
    }
    viewBottomPost.addSubview(imgComment)
    imgComment.snp.makeConstraints { make in
      make.width.height.equalTo(heightIconDefault)
      make.leading.equalTo(imgLike.snp.trailing).offset(8)
      make.top.equalTo(4)
    }
    viewBottomPost.addSubview(imgSend)
    imgSend.snp.makeConstraints { make in
      make.width.height.equalTo(heightIconDefault)
      make.leading.equalTo(imgComment.snp.trailing).offset(8)
      make.top.equalTo(4)
    }
    viewBottomPost.addSubview(imgSave)
    imgSave.snp.makeConstraints { make in
      make.width.height.equalTo(heightIconDefault)
      make.trailing.equalToSuperview().inset(8)
      make.top.equalTo(4)
    }
    
    viewBottomPost.addSubview(lblUserNameBottom)
    lblUserNameBottom.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(8)
      make.top.equalTo(imgLike.snp.bottom).offset(4)
      
    }
    viewBottomPost.addSubview(lblDesc)
    lblDesc.snp.makeConstraints { make in
      make.leading.equalTo(lblUserNameBottom.snp.trailing).offset(2)
      make.top.equalTo(lblUserNameBottom.snp.top)
    }
    
    imgLike.addTarget(self, action: #selector(liked), for: .touchUpInside)
    imgSave.addTarget(self, action: #selector(saved), for: .touchUpInside)
    
  }
  
  public func setDataPost (post:PostModel){
    lblUserName.text = post.userName
    lblUserNameBottom.text = post.userName
    like = post.liked
    save = post.liked
    lblDesc.text = post.desc
    imgPost.image = UIImage(named: "\(post.imagePost)")
    imgProfile.image = UIImage(named: "\(post.photoProfile)")
    hasHistory = post.liked
    
    if hasHistory {
      hasHistory(img: profilePhotoContainer)
    }
  }
  
  func hasHistory(img:UIView) {
    let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
    let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
    
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [colorTop, colorBottom]
    gradientLayer.locations = [0.0, 1.0]
    gradientLayer.frame = CGRect(x: 0, y: 0, width: historyDefault, height: historyDefault)
    gradientLayer.cornerRadius = historyDefault / 2
    img.layer.insertSublayer(gradientLayer, at: 1)
  }
  
  @objc func liked(){
    if like {
      imgLike.tintColor = .black
      imgLike.setImage(UIImage(systemName: "heart"), for: .normal)
      like = false
    }else{
      imgLike.tintColor = .red
      imgLike.setImage(UIImage(systemName: "heart.fill"), for: .normal)
      like = true
    }
    
  }
  @objc func saved(){
    if save {
      imgSave.tintColor = .black
      imgSave.setImage(UIImage(systemName: "pin"), for: .normal)
      save = false
    }else{
      imgSave.tintColor = .black
      imgSave.setImage(UIImage(systemName: "pin.fill"), for: .normal)
      save = true
    }
  }
  
}

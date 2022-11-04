//
//  BookTableViewCell.swift
//  KidsNoteHomework
//
//  Created by rhino Q on 2022/11/02.
//

import UIKit

final class BookTableViewCell: UITableViewCell {
    
    enum ViewLayoutType {
        case list
        case detailMain
    }
    
    private struct Metric {
        static let defaultSpacing:CGFloat = CGFloat(16)
        static let bookImageViewHeightRatio:CGFloat = CGFloat(1.3)
        
        static func titleFontSize(type:ViewLayoutType) -> CGFloat {
            switch type {
            case .list:
                return CGFloat(17)
            case .detailMain:
                return CGFloat(30)
            }
        }
        static func imageViewWidth(type:ViewLayoutType) -> CGFloat {
            switch type {
            case .list:
                return CGFloat(50)
            case .detailMain:
                return CGFloat(150)
            }
        }
        
    }
    
    let bookImageView:UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = Metric.imageViewWidth(type: .list) / 10
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "placeHolder")
        return imageView
    }()
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let authLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bookDetailInfo:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    private let mainStackView:UIStackView = {
        let stView = UIStackView()
        stView.translatesAutoresizingMaskIntoConstraints = false
        stView.alignment = .top
        stView.spacing = Metric.defaultSpacing
        return stView
    }()
    
    private let titlesStackView:UIStackView = {
        let stView = UIStackView()
        stView.axis = .vertical
        stView.translatesAutoresizingMaskIntoConstraints = false
        return stView
    }()
    
    private var imageViewWidthConstraint:NSLayoutConstraint!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    
    private func setupView() {
        selectionStyle = .none
        
        titlesStackView.addArrangedSubview(titleLabel)
        titlesStackView.addArrangedSubview(authLabel)
        titlesStackView.addArrangedSubview(bookDetailInfo)
        
        mainStackView.addArrangedSubview(bookImageView)
        mainStackView.addArrangedSubview(titlesStackView)

        contentView.addSubview(mainStackView)
        
        titlesStackView.setCustomSpacing(Metric.defaultSpacing/2, after: titleLabel)
        
        imageViewWidthConstraint = bookImageView.widthAnchor.constraint(equalToConstant: Metric.imageViewWidth(type: .list))
        
        NSLayoutConstraint.activate([
            
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metric.defaultSpacing),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant:  -Metric.defaultSpacing),
            imageViewWidthConstraint,
            bookImageView.heightAnchor.constraint(equalTo: bookImageView.widthAnchor, multiplier: Metric.bookImageViewHeightRatio)
        ])
    }
    
    func configure(_ book:Book, type:ViewLayoutType = .list) {

        changeLayout(type: type)
        
        titleLabel.text = book.title
        authLabel.text = book.authors
        bookDetailInfo.text = book.bookDetailInfo
        
        guard let thumbnailURL = URL(string:book.volumeInfo?.imageLinks?.thumbnail ?? "") else {
            bookImageView.image = UIImage(named: "placeHolder")
            return
        }
        ImageClient.shared.setImage(on: bookImageView, fromURL: thumbnailURL, withPlaceholder: nil)
    }
    
    private func changeLayout(type:ViewLayoutType = .list) {
        titleLabel.font = UIFont.boldSystemFont(ofSize: Metric.titleFontSize(type: type))
        imageViewWidthConstraint.constant = Metric.imageViewWidth(type: type)
        bookImageView.layer.cornerRadius = Metric.imageViewWidth(type: type) / 10
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bookImageView.image = nil
        titleLabel.text = ""
        authLabel.text =  ""
    }
}

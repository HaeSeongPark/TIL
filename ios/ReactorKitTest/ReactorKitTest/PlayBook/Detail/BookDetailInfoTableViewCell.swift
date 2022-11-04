//
//  BookDetailInfoTableViewCell.swift
//  KidsNoteHomework
//
//  Created by rhino Q on 2022/11/02.
//

import UIKit

final class BookDetailInfoTableViewCell: UITableViewCell {
    
    private struct Metric {
        static let titleFontSize:CGFloat = CGFloat(30)
        static let descriptionTextFontSize:CGFloat = CGFloat(20)
        static let defaultSpacing:CGFloat = CGFloat(16)
    }
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: Metric.titleFontSize)
        label.text = "책 정보"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionTextView:UITextView = {
       let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.font = UIFont.systemFont(ofSize: Metric.descriptionTextFontSize)
        return textView
    }()
    
    let publishedTitleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: Metric.titleFontSize)
        label.text = "게시일"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let publishedDescriptionLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: Metric.descriptionTextFontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionTextView)
        contentView.addSubview(publishedTitleLabel)
        contentView.addSubview(publishedDescriptionLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: descriptionTextView.topAnchor, constant: -Metric.defaultSpacing),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metric.defaultSpacing),
            
            descriptionTextView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -Metric.defaultSpacing),
            
            publishedTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            publishedTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -Metric.defaultSpacing),
            publishedTitleLabel.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor,constant: Metric.defaultSpacing),
            
            publishedDescriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            publishedDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -Metric.defaultSpacing),
            publishedDescriptionLabel.topAnchor.constraint(equalTo: publishedTitleLabel.bottomAnchor, constant: Metric.defaultSpacing),
            publishedDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -(Metric.defaultSpacing*2))
        ])
    }
    
    func configure(_ book:Book) {
        descriptionTextView.text = book.description
        publishedDescriptionLabel.text = book.publishedInfo
    }
}

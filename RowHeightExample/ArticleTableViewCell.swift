//
//  ArticleTableViewCell.swift
//  RowHeightExample
//

import UIKit

internal class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    internal override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    internal override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
    internal override func layoutIfNeeded()
    {
        super.layoutIfNeeded()
        self.contentView.layoutIfNeeded()
        
        self.titleLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.titleLabel.frame)
        self.summaryLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.summaryLabel.frame)        
    }
    
    internal func populateCellDetails(article:Article)
    {
        let dateFormatter = NSDateFormatter()        
        self.dateLabel.text = NSDateFormatter.localizedStringFromDate(article.datePublished!, dateStyle:NSDateFormatterStyle.FullStyle, timeStyle:NSDateFormatterStyle.NoStyle)
        self.titleLabel.text = article.title
        self.summaryLabel.text = article.summary
    }
}

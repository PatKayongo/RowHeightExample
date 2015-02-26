//
//  TableViewController.swift
//  RowHeightExample
//
//  Created by Patrick Kayongo on 2015/02/03.
//  Copyright (c) 2015 Patrick Kayongo. All rights reserved.
//

import UIKit

internal class TableViewController: UITableViewController, EditArticleTableViewControllerDelegate
{

    internal var articleList:Array<Article>?;
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.articleList = Array<Article>();
        
        let firstArticle = Article()
        firstArticle.title = "Monsanto’s Newest GM Crops May Create More Problems Than They Solve"
        firstArticle.datePublished = NSDate(dateString: "2015-02-02")
        firstArticle.summary = "The latest in a new generation of genetically engineered crops is poised to enter widespread use—and critics think they’ll cause more problems than they solve."
        self.articleList?.append(firstArticle)
        
        let secondArticle = Article()
        secondArticle.title = "'Supermoon' Lunacy: Does the Moon Make Us Crazy?"
        secondArticle.datePublished = NSDate(dateString: "2011-03-18")
        secondArticle.summary = "With the so-called supermoon upon us, as our only natural satellite makes its largest appearance Saturday (March 19) in more than 18 years, should we expect any lunacy?"
        self.articleList?.append(secondArticle)
        
        let thirdArticle = Article()
        thirdArticle.title = "Telkom warns of online recruitment scam"
        thirdArticle.datePublished = NSDate(dateString: "2015-02-03")
        thirdArticle.summary = "Johannesburg - Fraudsters have turned to online classifieds website Gumtree in a bid to lure unsuspecting victims into ‘Telkom Internship’ scams."
        self.articleList?.append(thirdArticle)
        
        let fourthArticle = Article()
        fourthArticle.title = "Katy Perry's Choreographer: 'Left Shark Nailed It!'"
        fourthArticle.datePublished = NSDate(dateString: "2015-02-02")
        fourthArticle.summary = "The sharks were given two main objectives."
        self.articleList?.append(fourthArticle)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.articleList?.count ?? 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("articleCell", forIndexPath: indexPath) as UITableViewCell as ArticleTableViewCell
        let article:Article = self.articleList![indexPath.row];
        cell.populateCellDetails(article)
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        let articleCell:ArticleTableViewCell = tableView.dequeueReusableCellWithIdentifier("articleCell") as ArticleTableViewCell
        let article:Article = self.articleList![indexPath.row];
        articleCell.populateCellDetails(article)
        articleCell.bounds = CGRectMake(0.0, 0.0, CGRectGetWidth(tableView.bounds), CGRectGetHeight(articleCell.bounds))
        articleCell.setNeedsLayout()
        articleCell.layoutIfNeeded()
        
        let size:CGSize = articleCell.contentView.systemLayoutSizeFittingSize(UILayoutFittingExpandedSize)
        return size.height + 1
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated:true)
    }

    // MARK: - EditArticleTableViewControllerDelegate
    
    func addNewArticle(newArticle:Article)
    {
        self.articleList?.append(newArticle)
        let indexPath:NSIndexPath = NSIndexPath(forRow: self.articleList!.count - 1, inSection: 0)
        let indexPathArray:Array = [indexPath]
        self.tableView.insertRowsAtIndexPaths(indexPathArray, withRowAnimation: UITableViewRowAnimation.Automatic)
    }
}

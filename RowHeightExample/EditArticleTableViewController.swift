//
//  EditArticleTableViewController.swift
//  RowHeightExample
//
//  Created by Patrick Kayongo on 2015/02/05.
//  Copyright (c) 2015 Patrick Kayongo. All rights reserved.
//

import UIKit

internal protocol EditArticleTableViewControllerDelegate
{
    func addNewArticle(newArticle:Article)
}

internal class EditArticleTableViewController: UITableViewController, UITextFieldDelegate, UITextViewDelegate
{

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var datePublishedTextField: UITextField!
    @IBOutlet weak var summaryTextView: UITextView!
    
    var currentLanguage:String = "en"
    var newArticle:Article = Article()
    
    @IBAction func saveArticle(sender: AnyObject)
    {
        var article:Article = Article()
        article.title = self.titleTextField.text
        article.summary = self.summaryTextView.text
    }
    
    @IBAction func switchLanguage(sender: AnyObject)
    {
        if (currentLanguage == "en")
        {
            var languageList:[String] = ["es"]
            NSUserDefaults.standardUserDefaults().setObject(languageList, forKey: "AppleLanguages")
            self.currentLanguage = "es"
        }
        else
        {
            var languageList:[String] = ["en"]
            NSUserDefaults.standardUserDefaults().setObject(languageList, forKey: "AppleLanguages")
            self.currentLanguage = "en"
        }
        
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var datePicker:UIDatePicker = UIDatePicker()
        datePicker.setDate(NSDate(), animated: false)
        datePicker.addTarget(self, action:"updateTextField:", forControlEvents: UIControlEvents.ValueChanged)
        self.datePublishedTextField.inputView = datePicker
    }
    
    func updateTextField(sender:AnyObject)
    {
        let datePicker:UIDatePicker = self.datePublishedTextField.inputView as UIDatePicker
        self.newArticle.datePublished = datePicker.date
        self.datePublishedTextField.text = NSString(format: "%@", datePicker.date)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: TextFieldDelegate
    
    func textFieldDidEndEditing(textField: UITextField)
    {
        if (textField == self.titleTextField)
        {
            self.newArticle.title = textField.text
        }
    }
    
    // MARK: TextViewDelegate
    
    func textViewDidEndEditing(textView: UITextView)
    {
        if (textView == self.summaryTextView)
        {
            self.newArticle.summary = textView.text
        }
    }

}

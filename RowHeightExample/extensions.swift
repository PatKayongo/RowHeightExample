//
//  extensions.swift
//  RowHeightExample
//

import UIKit

class extensions: NSObject {
   
}

extension NSDate
{
    convenience init(dateString:String)
    {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_ZA")
    
        let date = dateStringFormatter.dateFromString(dateString)
        self.init(timeInterval:0, sinceDate:date!)
    }
}

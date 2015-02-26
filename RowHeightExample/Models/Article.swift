//
//  Article.swift
//  RowHeightExample
//
//  Created by Patrick Kayongo on 2015/02/03.
//  Copyright (c) 2015 Patrick Kayongo. All rights reserved.
//

import UIKit

internal class Article: NSObject
{
    internal var title:String?;
    internal var datePublished:NSDate?;
    internal var summary:String?;
    
    internal override init()
    {
        self.title = "";
        self.summary = "";
    }
}

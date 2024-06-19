//
//  String+Formatters.swift
//  Flickr
//
//  Created by Silvia Florido on 19/06/24.
//

import Foundation

extension String {
    func htmlToString() -> String? {
        guard let data = self.data(using: .utf8) else {
            return nil
        }
        return  try? NSAttributedString(data: data,
                                        options: [.documentType: NSAttributedString.DocumentType.html],
                                        documentAttributes: nil).string
    }
    
    func utcTimeToString() -> String? {
        let utcDateFormatter = DateFormatter()
        utcDateFormatter.locale = Locale(identifier: "UTC")
        utcDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        guard let date = utcDateFormatter.date(from: self) else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        return dateFormatter.string(from: date)
    }
}


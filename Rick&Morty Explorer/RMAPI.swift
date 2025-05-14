//
//  RMAPI.swift
//  Rick&Morty Explorer
//
//  Created by Eduardo Frederico Sotero da Costa              on 07/05/25.
//

import Foundation

class RMAPI {
    
    static private let basePath = "https://rickandmortyapi.com/api/character"
    static private let limit = 20
    
    /*class func loadCharacters(name: String?, page: Int = 0, onComplete: @escaping (RMInfo?) -> Void) {
        let offset = page * limit
        let startsWith: String
        if let name = name, !name.isEmpty {
            startsWith = name.replacingOccurrences(of: " ", with: "")
        } else {
            startsWith = ""
        }
        let url = basePath + "offset=\(offset)&limit=\(limit)&" + startsWith
         Alamofire.request(url).responseJSON { (response) in
         guard let data = response.data,
         let RMInfo = try? JSONDecoder().decode(RMInfo.self, from: data), else {
         onComplete(nil)
         return
         }
         onComplete(RMInfo)
         }
         }
    */
    
}

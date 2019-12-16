//
//  Clues.swift
//  JeopardyTrainerRetake
//
//  Created by Richard Jove on 12/13/19.
//  Copyright © 2019 Richard Jove. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Clues {
    var id = 0
    var cluesCount = 0
    var clueArray: [Clue] = []
    var apiURL = "http://jservice.io/api/category/?id="
    
    func getData(completed: @escaping () -> ()) {
        Alamofire.request(apiURL+"\(id)").responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("**** json = \(value)")
                let numberOfClues = json["clues"].count
                for index in 0..<numberOfClues {
                    let clue = Clue()
                    clue.question = json["clues"][index]["question"].stringValue
                    clue.answer = json["clues"][index]["answer"].stringValue
                    clue.categoryID = json["clues"][index]["category_id"].intValue
                    clue.value = json["clues"][index]["value"].intValue
                    clue.clueID = json["clues"][index]["id"].intValue
                    self.clueArray.append(clue)
                    print("clueArray[\(index)] = \(self.clueArray[index].question)")
                }
//                let numberOfCategories = json.count
//                for index in 0..<numberOfCategories {
//                    let id = json[index]["id"].intValue
//                    let title = json[index]["title"].stringValue
//                    let cluesCount = json[index]["clues_count"].intValue
//                    
//                    self.categoryArray.append(Category(id: id, title: title, cluesCount: cluesCount))
//                    
//                    
//                }
                
            case .failure(let error):
                print("ERROR: \(error) failed to get data from URL \(self.apiURL)")
            }
            completed()
        }
    }
}

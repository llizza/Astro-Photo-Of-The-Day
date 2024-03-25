//
//  PhotoInfo.swift
//  AstroPhoto
//
//  Created by Елизавета Матвеева on 17.03.2024.
//

import Foundation
import SwiftUI

struct PhotoInfo: Codable{
    
    
    var title: String
    var explanation: String
    var hdurl: URL?
    var date: String
    
    enum CodingKeys: String, CodingKey{
        case title = "title"
        case explanation = "description"
        case hdurl = "hdurl"
        case date = "date"
    }
    
    init(from decoder: Decoder) throws{
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try valueContainer.decode(String.self, forKey: CodingKeys.title)
        self.explanation = try valueContainer.decode(String.self, forKey: CodingKeys.explanation)
        self.hdurl = try valueContainer.decode(URL.self, forKey: CodingKeys.hdurl)
        self.date = try valueContainer.decode(String.self, forKey: CodingKeys.date)
    }
    
    init(){
        self.explanation = ""
        self.title = ""
        self.date = ""
        
    }
    
    static func createDefault() -> PhotoInfo{
        var photoInfo = PhotoInfo()
        photoInfo.title = "Comet Pons-Brooks' Swirling Coma"
        photoInfo.explanation = "A bright comet will be visible during next month's total solar eclipse.  This very unusual coincidence occurs because Comet 12P/Pons-Brooks's return to the inner Solar System places it by chance only 25 degrees away from the Sun during Earth's April 8 total solar eclipse.  Currently the comet is just on the edge of visibility to the unaided eye, best visible with binoculars in the early evening sky toward the constellation of the Fish (Pisces). Comet Pons-Brooks, though, is putting on quite a show for deep camera images even now.  The featured image is a composite of three very specific colors, showing the comet's ever-changing ion tail in light blue, its outer coma in green, and highlights some red-glowing gas around the coma in a spiral. The spiral is thought to be caused by gas being expelled by the slowly rotating nucleus of the giant iceberg comet. Although it is always difficult to predict the future brightness of comets, Comet Pons-Brook has been particularly prone to outbursts, making it even more difficult to predict how bright it will actually be as the Moon moves in front of the Sun on April 8.   Total Eclipse Info: 2024 Total Solar Eclipse from NASA"
        return photoInfo
        
    }
}

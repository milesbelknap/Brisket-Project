//
//  PostModel.swift
//  Brisket Prototype
//
//  Created by Miles Belknap on 4/12/22.
//

import SwiftUI

struct PostModel : Identifiable {

    var id : String
    var title : String
    var pic : String
    var time : Date
    var user : UserModel
}

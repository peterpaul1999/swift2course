//
//  Rezept.swift
//  MeineRezepte
//
//  Created by Thomas Karg on 02.10.15.
//  Copyright © 2015 Thomas Karg. All rights reserved.
//
class Rezept {
    var name: String
    var zutaten: [[String:String]]
    
    init(rezeptName: String, dieZutaten: [[String:String]]) {
        name = rezeptName
        zutaten = dieZutaten
    }
}

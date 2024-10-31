
//
//  Untitled.swift
//  movieapp
//
//  Created by admin on 31/10/24.
//
extension String{
    static func modifyRate(_ rate: Double) -> String{
        return rate == 0 ? "N/A" : String(format: "%.1f", rate);
    }
}

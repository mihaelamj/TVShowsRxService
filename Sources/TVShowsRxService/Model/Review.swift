//
//  Review.swift
//  TVShowsMMJ
//
//  Created by iMacPro on 18.11.2021..
//

public struct Review: Codable {
    public let id: String
    public let comment: String
    public let rating: Int
    public let showId: Int
    public let user: User
}

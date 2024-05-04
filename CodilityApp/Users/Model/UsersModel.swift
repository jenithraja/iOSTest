//
//  Model.swift
//  CodilityApp
//
//  Created by Mohamed jenith on 5/1/24.
//

import Foundation
// MARK: - UsersModel
struct UsersModel: Codable {
    let login: String?
    let id: Int?
    let nodeID: String?
    let avatarURL: String?
    let gravatarID: String?
    
    init(){
        login = nil
        id = nil
        nodeID = nil
        avatarURL = nil
        gravatarID = nil

    }
//    let url, htmlURL, followersURL: String
//    let followingURL, gistsURL, starredURL: String
//    let subscriptionsURL, organizationsURL, reposURL: String
//    let eventsURL: String
//    let receivedEventsURL: String
//    let siteAdmin: Bool

    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
//        case url
//        case htmlURL = "html_url"
//        case followersURL = "followers_url"
//        case followingURL = "following_url"
//        case gistsURL = "gists_url"
//        case starredURL = "starred_url"
//        case subscriptionsURL = "subscriptions_url"
//        case organizationsURL = "organizations_url"
//        case reposURL = "repos_url"
//        case eventsURL = "events_url"
//        case receivedEventsURL = "received_events_url"
//        case siteAdmin = "site_admin"
    }
    
}

//enum TypeEnum: String, Codable {
//    case organization = "Organization"
//    case user = "User"
//}
//
//typealias Welcome = [WelcomeElement]

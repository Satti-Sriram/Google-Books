//
//  Books.swift
//  Google Books
//
//  Created by SATTI SRIRAM on 18/07/21.
//

import Foundation

import Foundation

// MARK: - Books
struct Books: Codable {
    let kind: String
    let totalItems: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let kind: Kind
    let id, etag: String
    let selfLink: String
    let volumeInfo: VolumeInfo
    let saleInfo: SaleInfo
    let accessInfo: AccessInfo
    let searchInfo: SearchInfo?
}

// MARK: - AccessInfo
struct AccessInfo: Codable {
    let country: Country
    let viewability: Viewability
    let embeddable, publicDomain: Bool
    let textToSpeechPermission: TextToSpeechPermission
    let epub, pdf: Epub
    let webReaderLink: String
    let accessViewStatus: AccessViewStatus
    let quoteSharingAllowed: Bool
}

enum AccessViewStatus: String, Codable {
    case none = "NONE"
    case sample = "SAMPLE"
}

enum Country: String, Codable {
    case countryIN = "IN"
}

// MARK: - Epub
struct Epub: Codable {
    let isAvailable: Bool
    let acsTokenLink: String?
}

enum TextToSpeechPermission: String, Codable {
    case allowed = "ALLOWED"
    case allowedForAccessibility = "ALLOWED_FOR_ACCESSIBILITY"
}

enum Viewability: String, Codable {
    case noPages = "NO_PAGES"
    case partial = "PARTIAL"
}

enum Kind: String, Codable {
    case booksVolume = "books#volume"
}

// MARK: - SaleInfo
struct SaleInfo: Codable {
    let country: Country
    let saleability: Saleability
    let isEbook: Bool
    let listPrice, retailPrice: SaleInfoListPrice?
    let buyLink: String?
    let offers: [Offer]?
}

// MARK: - SaleInfoListPrice
struct SaleInfoListPrice: Codable {
    let amount: Double
    let currencyCode: String
}

// MARK: - Offer
struct Offer: Codable {
    let finskyOfferType: Int
    let listPrice, retailPrice: OfferListPrice
}

// MARK: - OfferListPrice
struct OfferListPrice: Codable {
    let amountInMicros: Int
    let currencyCode: String
}

enum Saleability: String, Codable {
    case forSale = "FOR_SALE"
    case notForSale = "NOT_FOR_SALE"
}

// MARK: - SearchInfo
struct SearchInfo: Codable {
    let textSnippet: String
}

// MARK: - VolumeInfo
struct VolumeInfo: Codable {
    let title: String
    let authors: [String]
    let publisher: String?
    let publishedDate, volumeInfoDescription: String
    let industryIdentifiers: [IndustryIdentifier]
    let readingModes: ReadingModes
    let pageCount: Int
    let printType: PrintType
    let categories: [String]?
    let maturityRating: MaturityRating
    let allowAnonLogging: Bool
    let contentVersion: String
    let panelizationSummary: PanelizationSummary?
    let imageLinks: ImageLinks
    let language: Language
    let previewLink: String
    let infoLink: String
    let canonicalVolumeLink: String
    let subtitle: String?
    let averageRating: Double?
    let ratingsCount: Int?

    enum CodingKeys: String, CodingKey {
        case title, authors, publisher, publishedDate
        case volumeInfoDescription = "description"
        case industryIdentifiers, readingModes, pageCount, printType, categories, maturityRating, allowAnonLogging, contentVersion, panelizationSummary, imageLinks, language, previewLink, infoLink, canonicalVolumeLink, subtitle, averageRating, ratingsCount
    }
}

// MARK: - ImageLinks
struct ImageLinks: Codable {
    let smallThumbnail, thumbnail: String
}

// MARK: - IndustryIdentifier
struct IndustryIdentifier: Codable {
    let type: TypeEnum
    let identifier: String
}

enum TypeEnum: String, Codable {
    case isbn10 = "ISBN_10"
    case isbn13 = "ISBN_13"
}

enum Language: String, Codable {
    case en = "en"
    case un = "un"
}

enum MaturityRating: String, Codable {
    case notMature = "NOT_MATURE"
}

// MARK: - PanelizationSummary
struct PanelizationSummary: Codable {
    let containsEpubBubbles, containsImageBubbles: Bool
}

enum PrintType: String, Codable {
    case book = "BOOK"
}

// MARK: - ReadingModes
struct ReadingModes: Codable {
    let text, image: Bool
}

import Foundation


struct Cities: Decodable {
    enum Category: String, Decodable {
        case swift, combine, debugging, xcode
    }
    let cities: [City]
}

struct City: Decodable {
    let region: String
    let city: String
}

class JsonCity {
    func loadJson() -> [City] {
        var data = try! String(contentsOfFile: "/Users/danilr26/Desktop/Project/Cities/Cities/data.json", encoding: String.Encoding.utf8)
        let jsonData = data.data(using: .utf8)!
        let blogPost: Cities = try! JSONDecoder().decode(Cities.self, from: jsonData)
        return blogPost.cities
    }

}

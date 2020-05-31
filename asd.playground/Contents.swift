import UIKit

var str = "Hello, playground"


let json = """
{ "birthday": "10/01/20" }
""".data(using: .utf8)

struct Person: Codable {var birthday: Date}


//1
let dateFormatter = DateFormatter()
dateFormatter.locale = Locale(identifier: "en_US_POSIX")
dateFormatter.dateFormat = "dd/MM/yy"

//2
let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .formatted(dateFormatter)

do{
    let Person1 = try decoder.decode(Person.self, from: json!)
    print(Person1.birthday)
    
}
catch {print(error)}



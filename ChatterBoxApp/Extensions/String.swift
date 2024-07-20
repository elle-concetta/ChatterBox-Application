// Elizabeth Fassler

import Foundation

extension String {
    func isValidEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$",
                                             options: .caseInsensitive )
        return regex.firstMatch(in: self, range: NSRange(location: 0, length: count)) != nil
    }
}


/*
 ^ asserts the start of the string.
 [a-zA-Z0-9._%+-]+ matches one or more characters that can be letters (uppercase or lowercase), digits, dots, underscores, percent signs, plus signs, or hyphens. This represents the email username.
 
 @ matches the at symbol.
 
 [a-zA-Z0-9.-]+ matches one or more characters that can be letters (uppercase or lowercase), digits, dots, or hyphens. This represents the email domain name.
 
 \. matches a dot (period).
 
 [a-zA-Z]{2,} matches two or more letters. This represents the top-level domain (TLD), such as com, net, org, etc.
 
 $ asserts the end of the string.
 */

import UIKit


extension UIFont {
    
    enum Heading {
        static var medium: UIFont = UIFont(name: "Poppins-SemiBold", size: 28) ?? UIFont.systemFont(ofSize: 28, weight: .semibold)
        static let small: UIFont = UIFont(name: "Poppins-SemiBold", size: 22) ?? UIFont.systemFont(ofSize: 22, weight: .semibold)
        static let regular: UIFont = UIFont(name: "Poppins-SemiBold", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .semibold)
        static let xtraSmall: UIFont = UIFont(name: "Poppins-SemiBold", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .semibold)
    }
    
    enum Body {
        static var small: UIFont = UIFont(name: "Poppins-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .regular)
        static var regular: UIFont = UIFont(name: "Poppins-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .regular)
        static var smallSemiBold: UIFont = UIFont(name: "Poppins-SemiBold", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .semibold)

    }
   
}

import UIKit

@IBDesignable class RoundedEdgeContainerView: ContainerView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set(radius) {
            self.layer.cornerRadius = radius
        }
    }
    
    func defaultSettings(){
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2.5
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 1.5
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 1, height: 2)
        self.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        defaultSettings()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        defaultSettings()
    }
}

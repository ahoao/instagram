import UIKit
import Firebase
import SVProgressHUD

class CommentViewController: UIViewController {
    
    var postData: PostData!
    var exComment: String = ""
    
    @IBOutlet weak var commentNameTextField: UITextField!
    @IBOutlet weak var commentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 枠のカラー
               commentTextView.layer.borderColor = UIColor.lightGray.cgColor
               
               // 枠の幅
               commentTextView.layer.borderWidth = 1.0
               
               // 枠を角丸にする
               commentTextView.layer.cornerRadius = 20.0
               commentTextView.layer.masksToBounds = true
    }
    
    // FireStoreに投稿データを保存する
    let commentName = Auth.auth().currentUser?.displayName

    @IBAction func handleCommentButton(_ sender: Any) {
            let comment = exComment + "\(commentName! + commentTextView.text!)\n"
        // 更新データを作成する
        var updateValue: FieldValue
        updateValue = FieldValue.arrayUnion([comment])
        
        // 更新データを書き込む
        let postRef = Firestore.firestore().collection(Const.PostPath).document(postData.id)
        postRef.updateData(["comments": updateValue])
        self.dismiss(animated: true, completion: nil)
        }
}


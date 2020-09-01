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
        
        exComment = postData.comment!
    }
    
    // FireStoreに投稿データを保存する
    let commentName = Auth.auth().currentUser?.displayName

    @IBAction func handleCommentButton(_ sender: Any) {
            
            let comment = exComment + "\(commentName! + commentTextView.text!)\n"
            
            let postRef = Firestore.firestore().collection(Const.PostPath).document(postData.id)
            postRef.updateData(["comment": comment])
            self.dismiss(animated: true, completion: nil)
        }
}


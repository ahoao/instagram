import UIKit
import Firebase
import SVProgressHUD

class CommentViewController: UIViewController {
    
    
    @IBOutlet weak var commentNameTextField: UITextField!
    @IBOutlet weak var commentTextView: UITextView!
    
    @IBAction func handleCommentButton(_ sender: Any) {
    }
    
    // comment名と投稿データの保存場所を定義する
    let commentRef = Firestore.firestore().collection(Const.CommentPath).document()
     let commentNameRef = Firestore.firestore().collection(Const.CommentNamePath).document()
    
    // FireStoreに投稿データを保存する
    let commentName = Auth.auth().currentUser?.displayName
    let postDic = [
        "comment": self.comment.text!
        ] as [String : Any]
    
    postRef.setData(postDic)
    // HUDで投稿処理中の表示を開始
    SVProgressHUD.show()
    
    // HUDで投稿完了を表示する
    SVProgressHUD.showSuccess(withStatus: "投稿しました")
    // 投稿処理が完了したので先頭画面に戻る
    UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}

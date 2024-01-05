import UIKit


public enum PhotoUploadError: Error {
    // Olası hatalarımızı temsil edebilmesi için iki case oluşturuyoruz.
    case noConnection
    case noPermission
}

// Burada iki durumu (state) temsil eden değişkenler oluşturuyorum.
var isConnectedToInternet = false
var hasPermission = false

// Telefon sınıfımızı oluşturduk.
class Phone {
    
    // Upload isimli fonksiyonumuzu oluşturduk.
    // Bu fonksiyonda 'throws' anahtar kelimesini kullandık.
    // Bunun amacı, fonksiyonumuzun hata verebileceğini öngörüyor olmamızdır.
    // Eğer fonksiyonumuz hata verirse, onu kolayca yakalamamıza imkan tanır.
    // Fonksiyonu kullanacağımızda, hatayı göz önünde bulundurmamızı ister.
    func upload(image name: String) throws {
        
        // Eğer internet bağlantısı yoksa, uygun hata case'i throw edilir.
        guard isConnectedToInternet else {
            print("Please check your internet connection. Connection status: \(isConnectedToInternet)")
            throw PhotoUploadError.noConnection
        }
        
        // Eğer gerekli izinler yoksa, uygun hata case'i throw edilir.
        guard hasPermission else {
            print("Please give permission for this operation. Permission status: \(hasPermission)")
            throw PhotoUploadError.noPermission
        }
        
        // Bu noktaya ulaşabilen işlem başarı ile sonuçlanır.
        print("Image \(name) Successfully Uploaded ✅ ")
    }
    
}



let phone = Phone()

// Sınıfımızın dışında bir yerde upload fonksiyonunu çağırmayı deniyoruz.
// IDE (XCode) bize bu fonksiyonun hata verebileceğini söylüyor.
// Bu hatayı ele almadan işlem yapmamızı engelliyor.

/*
 phone.upload(image: "Sunset.png")
 */

/*
// Bu yüzden do - try - catch yapısını kullanıyoruz.
do {
// Do-try bölümünde işlemi başarı ile gerçekleştirmeyi deniyoruz.
try phone.upload(image: "Sunset.png")
} catch {
// Eğer başarısız olursak catch bölümünde hata yakalanıyor.
// Otomatik olarak bir değişkene atanıyor.
// Daha önceden belirttiğimiz hata mesajı ile bize ulaşıyor.
// Burada farklı bir senaryoya yönelebilir, ya da hatayı kullanıcı ile paylaşabiliriz.
print("Hata yakalandı. Otomatik olarak Error tipinde bir değişkene atandı. \(error)")
}
*/


// try? anahtar kelimesi ile aşağıdaki işlemi deneyeceğimizi ifade ediyoruz.
// İşlem sonucunu bir değişkene atıyoruz.
// Bu değişken ya nil olacak, ya da bir değere sahip olacaktır.
// Böylelikle uygulamanın hata vermesi önlenmiş olacaktır.

/*
let unknownResult = try? phone.upload(image: "Sunset.png" )
print("Bu işlem sonucu nil ya da opsiyonel \(unknownResult) olacaktır.")
*/


// try! anahtar kelimesini kullanıyoruz.
// Bu ifade ile işlemin başarılı sonuçlanacağından emin olduğumuzu ifade ediyoruz.
// İşlem sonucunu bir değişkene atıyoruz.
// Bu değişken bir değere sahip olamazsa uygulamamız crash edecektir.
// Bu yüzden riskli bir yaklaşımdır ve kaçınılması uygundur.

/*
let unknownResult = try! phone.upload(image: "Sunset.png" )
print("Bu işlem sonucu nil ya da opsiyonel \(unknownResult) olacaktır.")
 */





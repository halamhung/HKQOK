using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using HKQTravel.Models;

namespace HQKTravel.Controllers
{
    public class GuestController : Controller
    {
        dbTravelTourDataContext data = new dbTravelTourDataContext();
        // GET: Guest

        //Display Login
        public ActionResult Index()
        {
            return View();
        }

        //mã hóa md5-hùng-27/4 (MD5 Descript password)
        private string mahoamd5(string input)
        {
            if (string.IsNullOrEmpty(input))
            {
                // Nếu input rỗng hoặc null, trả về chuỗi rỗng.
                return string.Empty;
            }
            using (var md5 = MD5.Create())
            {
                var dulieu = md5.ComputeHash(Encoding.UTF8.GetBytes(input));
                var builder = new StringBuilder();

                for (int i = 0; i < dulieu.Length; i++)
                {
                    builder.Append(dulieu[i].ToString("x2"));
                }
                return builder.ToString();
            }

        }

        #region check information in account
        // check tk tồn tại chưa-hùng-27/4 (Check exist account)
        private bool checktk(string tk)
        {
            return data.user_accounts.Count(x => x.user_name == tk) > 0;
        }


        // check email tồn tại chưa-hùng-27/4
        private bool checkemail(string em)
        {
            return data.user_accounts.Count(x => x.email == em) > 0;
        }
        // check sđt tồn tại chưa-hùng-30/4
        private bool checkstd(string sdt)
        {
            return data.user_accounts.Count(x => x.phone_number == sdt) > 0;
        }
        #endregion

        #region Register
        //đăng ký-hùng-27/4
        [HttpGet] // khi truy cập vào đường dẫn này phương thức sẽ được gọi ra và xử lý yêu cầu 
        public ActionResult Register()
        {
            if (Session["user_account"] != null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                return View();
            }

        }
        [HttpPost]
        public ActionResult Register(FormCollection collection, user_account guest, HttpPostedFileBase ImageFile)
        {
            var FULLNAME = collection["fullname"];
            var USER = collection["user"];
            var EMAIL = collection["email"];
            var PASSWORD = collection["password"];
            var RE_PASS = collection["repassword"];
            string BIRTHDAY = Request.Form["day"] + "-" + Request.Form["month"] + "-" + Request.Form["year"];
            var SEX = collection["sex"];
            var PHONE = collection["phone"];
            var ADDRESS = collection["adress"];

            #region check 

            if (checktk(USER))
            {
                ViewData["erro_user"] = "Tài khoản đã tồn tại!";
                return View();
            }
            else if (checkemail(EMAIL))
            {
                ViewData["erro_email"] = "Email đã tồn tại!";
                return View();
            }
            else if (checkemail(PHONE))
            {
                ViewData["erro_phone"] = "Số điện thoại đã tồn tại!";
                return View();
            }

            else if (string.IsNullOrEmpty(FULLNAME))
            {
                ViewData["erro_fullname"] = "Họ tên không được trống !";
            }
            else if (FULLNAME.Any(char.IsDigit))
            {
                ViewData["erro_fullname"] = "Họ tên không được nhập số ";
            }
            else if (string.IsNullOrEmpty(USER))
            {
                ViewData["erro_user"] = "Tài khoản không được trống !";
            }
            else if (string.IsNullOrEmpty(PASSWORD))
            {
                ViewData["erro_pass"] = "Mật khẩu không được trống !";
            }
            else if (PASSWORD.Length < 6)
            {
                ViewData["erro_pass"] = "mật khẩu không được dưới 6 ký tự";
            }
            else if (string.IsNullOrEmpty(RE_PASS))
            {
                ViewData["erro_repass"] = "Vui lòng không để trống ô nhập lại mật khẩu !";
            }
            else if (PASSWORD != RE_PASS)
            {
                ViewData["erro_repass"] = "xác nhận mật khẩu không đúng";
            }
            else if (!PASSWORD.Any(char.IsUpper))
            {
                ViewData["erro_pass"] = "Mật khẩu phải có ít nhất 1 chữ cái in hoa, 1 chữ cái thường, 1 chữ số , 1 ký tự đặc biệt";
            }
            else if (!PASSWORD.Any(char.IsLower))
            {
                ViewData["erro_pass"] = "Mật khẩu phải có ít nhất 1 chữ cái in hoa, 1 chữ cái thường, 1 chữ số , 1 ký tự đặc biệt";
            }
            else if (!PASSWORD.Any(char.IsDigit))
            {
                ViewData["erro_pass"] = "Mật khẩu phải có ít nhất 1 chữ cái in hoa, 1 chữ cái thường, 1 chữ số , 1 ký tự đặc biệt";
            }
            else if (!PASSWORD.Any(c => !char.IsLetterOrDigit(c)))
            {
                ViewData["erro_pass"] = "Mật khẩu phải có ít nhất 1 chữ cái in hoa, 1 chữ cái thường, 1 chữ số , 1 ký tự đặc biệt";
            }
            else if (string.IsNullOrEmpty(RE_PASS))
            {
                ViewData["erro_repass"] = "Vui lòng nhập lại mật khẩu !";
            }
            else if (string.IsNullOrEmpty(EMAIL))
            {
                ViewData["erro_email"] = "Email không được trống !";
            }
            else if (string.IsNullOrEmpty(PHONE))
            {
                ViewData["erro_phone"] = "Số điện thoại không được trống !";
            }
            else if (PHONE.Length < 10)
            {
                ViewData["erro_phone"] = "Số điện thoại phải là 10 số";
            }
            else if (string.IsNullOrEmpty(ADDRESS))
            {
                ViewData["erro_address"] = "Địa chỉ không được trống !";
            }
            #endregion

            else
            {
                guest.user_fullname = FULLNAME;
                guest.user_name = USER;
                guest.email = EMAIL;
                guest.user_password = mahoamd5(PASSWORD); ;
                guest.birthday = DateTime.Parse(BIRTHDAY);
                guest.sex = SEX;
                guest.phone_number = PHONE;
                guest.address = ADDRESS;
                guest.create_date = DateTime.Now;
                if (ImageFile != null && ImageFile.ContentLength > 0)
                {
                    var filename = Path.GetFileName(ImageFile.FileName);
                    string path = Path.Combine(Server.MapPath("~/img_guest"), filename);
                    ImageFile.SaveAs(path);
                    ViewBag.FileStatus = "File uploaded successfully.";
                    guest.user_image = "/img_guest" + filename;
                }
                else
                {
                    ViewBag.FileStatus = "Error while file uploading."; ;
                }
                data.user_accounts.InsertOnSubmit(guest);
                data.SubmitChanges();
                return RedirectToAction("Index", "Home");
            }
            return this.Register();
        }
        #endregion

        #region Login
        //hùng 1-5-2023
        [HttpGet]
        public ActionResult Login()
        {
            if (Session["user_account"] != null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                return View();
            }

        }

        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            var user = collection["user"];
            var pass = mahoamd5(collection["pass"]);
            if (string.IsNullOrEmpty(user))
            {
                ViewData["erro_user"] = "Vui lòng nhập tên đăng nhập";
            }
            else if (string.IsNullOrEmpty(pass))
            {
                ViewData["erro_pass"] = "Vui lòng nhập mật khẩu";
            }
            else
            {
                var guest = data.user_accounts.FirstOrDefault(p => p.user_name == user && p.user_password == pass);
                if (guest != null)
                {
                    ViewBag.thongbao = "đăng nhập thành công";
                    Session["user_account"] = guest;
                    Session["fullName"] = guest.user_fullname;
                    Session["Email"] = guest.email;
                    Session["user_id"] = guest.user_id;
                    return RedirectToAction("Index", "Home");
                }
                else if (!checktk(user))
                {
                    ViewBag.thongbao = "Tài khoản không tồn tại";
                }

                else
                {
                    ViewBag.thongbao = "Tên đăng nhập hoặc mật khẩu không đúng";
                }
            }
            return this.Login();

        }
        #endregion

        #region Check profile and Log out
        [HttpGet]
        public ActionResult profile()
        {

            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Guest");
            }
            // Lấy thông tin người dùng từ Session
            var userid = (long)Session["user_id"];
            // Lấy thông tin người dùng từ CSDL dựa vào userID
            var user = data.user_accounts.FirstOrDefault(p => p.user_id == userid);
            return View(user);
        }

        [HttpPost]
        public ActionResult profile(String Fullname, String Phone, String Email)
        {
            var userid = (long)Session["user_id"];
            // Lấy thông tin khách hàng cũ từ database
            var oldCustomer = data.user_accounts.FirstOrDefault(c => c.user_id == userid);
            if (oldCustomer == null)
            {
                // Nếu không tìm thấy khách hàng, trả về trang lỗi 404
                return HttpNotFound();
            }

            // Cập nhật thông tin khách hàng mới
            if (!string.IsNullOrEmpty(Fullname))
            {
                oldCustomer.user_fullname = Fullname;
            }

            if (!string.IsNullOrEmpty(Phone))
            {
                oldCustomer.phone_number = Phone;
            }
            if (!string.IsNullOrEmpty(Email))
            {
                oldCustomer.email = Email;
            }

            data.SubmitChanges();

            // Hiển thị thông báo cập nhật thành công
            TempData["SuccessMessage"] = "Cập nhật thông tin thành công.";

            // Chuyển hướng về trang Profile
            return RedirectToAction("profile");
        }


        //hùng 1-5-2023
        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Index", "Home");
        }
        #endregion
    }
}
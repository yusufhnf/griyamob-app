class Strings {
  //Menu & Title
  static String titleHome = "Home";
  static String titleNotification = "Notifikasi";
  static String titleScanBarcode = "Scan Barcode";
  static String titleAccount = "Akun Saya";
  static String titleAbout = "Tentang Kami";
  static String titleHistory = "Riwayat";
  static String titleLogin = "Masuk GriyaMobile";
  static String titleRegister = "Daftar GriyaMobile";
  static String titleTambahSaldo = "Tambah Saldo";
  static String titlePembayaran = "Bayar";
  static String titleTopup = "Top Up";
  static String titleUbahAkun = "Ubah Akun";
  static String titleSK = "Syarat dan Ketentuan";

  //Label
  static String labelLogin = "Masuk";
  static String labelTopupButton = "Kirim Permintaan";
  static String labelRegister = "Register";
  static String labelEmail = "Email";
  static String labelPassword = "Password";
  static String labelPasswordBaru = "Password Baru";
  static String labelPasswordUlangi = "Ulangi Password";
  static String labelCetak = "Bagikan Bukti";
  static String labelSaldoAnda = "Saldo Anda";
  static String labelMasukkanNominal = "Masukkan Nominal";

  //Konten
  static String morningGreet = "Selamat Pagi";
  static String user = "User";
  static String landingSubGreet =
      "GriyaMobile membantu anda dalam pembayaran yang ada disekitar";
  static String landingGreet = "#MulaiBayar";
  static String totalSaldo = "Rp 0";
  static String loginSubtitle = "Masuk dan mulai menjelajah finansialmu";

  //response
  static String responEmailTidakValid = "Email tidak valid";
  static String responEmailKosong = "Email tidak boleh kosong";
  static String responPasswordKurang = "Password minimal 8 karakter";
  static String responPasswordKosong = "Password tidak boleh kosong";
  static String responPhoneSalah = "Format nomor +62 (nomor anda)";
  static String responPhoneKosong = "Nomor Telepon tidak boleh kosong";
  static String responNameKosong = "Nama tidak boleh kosong";
  static String responTidakBolehKosong = "Tidak boleh kosong";
  static String responNominalMin = "Transaksi minimal Rp. 10.000";
  static String responNominalSaldoTidakCukup = "Saldo tidak cukup";
  static String loading = "Mohon Tunggu";
  static String connectionLost = "Jaringan Terputus";
  static String noDataTransaction = "Tidak ada Transaksi";
  static String noData = "Tidak ada data";
  static String emailAlready = "Email sudah Terdaftar";
  static String wrongInput = "Email/Password salah";
  static String emailNotFound = "Email belum Terdaftar";
  static String forgotPassword = "Lupa Password";

  //Asset
  static String loginPic = 'assets/images/login.png';
  static String registerPic = 'assets/images/signup.png';
  static String defaultAvatar = "assets/images/g-logo-noshadow.png";

  static String getMonthIND(int value) {
    switch (value) {
      case 01:
        return "Januari";
        break;
      case 02:
        return "Februari";
        break;
      case 03:
        return "Maret";
        break;
      case 04:
        return "April";
        break;
      case 05:
        return "Mei";
        break;
      case 06:
        return "Juni";
        break;
      case 07:
        return "Juli";
        break;
      case 08:
        return "Agustus";
        break;
      case 09:
        return "September";
        break;
      case 10:
        return "Oktober";
        break;
      case 11:
        return "November";
        break;
      default:
        return "Desember";
    }
  }
}

# Booking Ticket Movie 🎥🎟️

## Giới thiệu

Ứng dụng **Booking Ticket Movie** là một nền tảng giúp người dùng dễ dàng tìm kiếm, đặt vé xem phim, và quản lý lịch trình xem phim của mình. Với giao diện thân thiện và các tính năng thông minh, ứng dụng mang lại trải nghiệm tiện lợi cho người dùng.

---

## Tính năng chính

- 🔍 **Tìm kiếm phim**: Dựa trên tên phim, thể loại, rạp chiếu, hoặc thời gian.
- 📅 **Lịch chiếu phim**: Xem thông tin chi tiết về lịch chiếu tại các rạp gần nhất.
- 🛒 **Đặt vé**: Chọn chỗ ngồi, đặt vé, và thanh toán trực tuyến an toàn.
- 💳 **Thanh toán**: Hỗ trợ nhiều phương thức thanh toán, bao gồm thẻ tín dụng, ví điện tử.
- 📊 **Quản lý vé**: Lưu trữ thông tin vé đã đặt, quản lý lịch trình xem phim.
- ⭐ **Đánh giá & Bình luận**: Để lại đánh giá và đọc nhận xét từ những người dùng khác.

---

## Công nghệ sử dụng

- **Frontend**:
  - Flutter (hoặc React Native) để phát triển ứng dụng đa nền tảng.
  - Firebase Authentication cho chức năng đăng nhập.
- **Backend**:
  - Node.js + Express để xử lý API.
  - Firebase Firestore để lưu trữ dữ liệu.
- **Database**:
  - Firestore (NoSQL) để quản lý dữ liệu liên quan đến phim, rạp chiếu, vé.
- **Deployment**:
  - Firebase Hosting cho website.
  - Play Store và App Store cho ứng dụng di động.

---

## Cài đặt và triển khai

### Yêu cầu hệ thống

- Node.js >= 16.0.0
- Flutter SDK 2.40.0000
- Firebase CLI

### Hướng dẫn cài đặt

1. Clone repository:
   ```bash
   git clone https://github.com/your-username/booking-ticket-movie.git
   cd booking-ticket-movie
   ```

2. Cài đặt các package cần thiết:
   - **Backend**:
     ```bash
     cd backend
     npm install
     ```
   - **Frontend**:
     ```bash
     cd frontend
     flutter pub get
     ```

3. Cấu hình Firebase:
   - Tải tệp `google-services.json` (Android) và `GoogleService-Info.plist` (iOS) từ Firebase Console.
   - Đặt tệp vào đúng vị trí trong dự án.

4. Chạy ứng dụng:
   - **cd vào dự án**:
     ```cd
     flutter clean 
     flutter pub get
     ```
   - **Frontend**:
     ```bash
     flutter run
     ```

---

## Cấu trúc dự án

```plaintext
booking-ticket-movie/
├── backend/                # Code API
├── frontend/               # Code ứng dụng Flutter
├── assets/                 # Tài nguyên hình ảnh, icon
├── README.md               # Tài liệu README
└── firebase.json           # Cấu hình Firebase
```

---

## Đóng góp

Chúng tôi hoan nghênh mọi đóng góp từ cộng đồng! Để tham gia:

1. Fork repository này.
2. Tạo nhánh mới:
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. Commit thay đổi:
   ```bash
   git commit -m "Mô tả thay đổi"
   ```
4. Push và gửi Pull Request:
   ```bash
   git push origin feature/your-feature-name
   ```

---

## Liên hệ

Nếu bạn có bất kỳ câu hỏi nào, vui lòng liên hệ qua email: **hoantran2003okay@gmail.com**

---

## Giấy phép

Dự án này được phát hành dưới giấy phép [MIT](LICENSE).

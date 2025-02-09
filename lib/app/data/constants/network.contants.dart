abstract class NetworkConstants {
  // static String BASE_URL = 'https://dakshhousing.com/hospital_user/';
  static String BASE_URL = 'https://dakshhousing.com/medicalapp/api/hospital_user/';
  static String CHAT_URL(
          {required String receiverId,
          required String senderId,
          required String appointmentId}) =>
      'https://dakshhousing.com/medicalapp/users/chat/chat.php?receiver_id=${receiverId}&sender_id=${senderId}&appointment_id=${appointmentId}';
}

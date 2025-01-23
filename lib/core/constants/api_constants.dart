class ApiConstants {
  static const baseUrl = 'https://turf-backend-silk.vercel.app/api/';
  static const socketUrl = 'https://turfbackend-production-d246.up.railway.app';
  static const weatherApiKey = '5da20513ee3a0e475061e7b933a8532b';
  // Auth
  static const sendOtp = 'user/auth/sendOtp';
  static const verifyOtp = 'user/auth/verifyOtp';
  // User
  static const checkApi = 'user/checkApi';
  static const getUserDetail = 'user/details';
  static const updateUserDetail = 'user/update';
  static const getCurrentBookings =
      'user/current-bookings'; // Endpoint for current bookings
  static const getHistoryBookings =
      'user/history-bookings'; // Endpoint for historical bookings
  static const getTransactionsHistory =
      'user/getTransactions-history'; // Endpoint for historical bookings

  // Venues
  static const getVenues = 'user/venues'; // Endpoint to get all venues
  static const getBookedSlots =
      'user/venue/booked-slots'; // Endpoint for available slots (replace {venueId} accordingly)
  static const addVenueReview =
      'user/venues/{venueId}/review'; // Endpoint for adding a review (replace {venueId} accordingly)
  static const bookVenue = 'user/book'; // Endpoint for booking a venue
  static const newBookingNotification =
      'notification/newBooking-notification'; // Endpoint for booking a venue

  // Bookings
  static const deleteBooking =
      'user/bookings/{bookingId}'; // Endpoint to delete a booking (replace {bookingId} accordingly)
  static const updateBooking =
      'user/bookings/update'; // Endpoint to update a booking (replace {bookingId} accordingly)
  static const getUserNotifications =
      'user/notifications'; // Endpoint for getting user notifications
  static const deleteUserAccount =
      'user/delete'; // Endpoint for deleting a user account
  static const homeData = 'user/home';

  //Chats
  static const chatsByBookingId = 'user/chatsByBookingId';
}

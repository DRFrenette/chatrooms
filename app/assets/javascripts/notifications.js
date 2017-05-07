$(function() {
  $("#notifications-trigger").click(function() {
    if (Notification.permission === "default") {
      Notification.requestPermission();
    };
  });

  $("#close-notifications-modal").click(function() {
    $.magnificPopup.close();
    return false;
  });
});

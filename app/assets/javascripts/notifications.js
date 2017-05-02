$(function() {
  if (Notification.permission === "default") {
    Notification.requestPermission();
  };
});

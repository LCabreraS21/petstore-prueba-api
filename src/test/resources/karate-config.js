function fn() {
  var config = {
    retry: function(count, interval) {
      karate.retry({ count: count, interval: interval });
    }
  };
  return config;
}
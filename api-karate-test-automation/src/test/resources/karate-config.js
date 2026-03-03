function fn() {
  var env = karate.env || 'dev'; // get system property 'karate.env'
  var config = {
    baseUrl: 'http://localhost:3001'
  };
  if (env === 'qa') {
    config.baseUrl = 'http://localhost:3001';
  }
  return config;
}
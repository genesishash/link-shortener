module.exports = conf = {
  cluster: off
  port: 10001

  mongo: 'localhost/link-shortener'
  redis: 'localhost'
  redis_key: 'link-shortener'

  memcached: 'localhost'

  cookie_session: {
    enabled: no
    secret_key: 'MY_UNIQUE_ENCRYPTION_KEY'
  }

  allow_http_method_override: on
  allow_model_exposure: on
  allow_underscore_routes: on

  developer: {
    show_error_stack: on
    debug_ip: '107.181.69.70'
  }
}


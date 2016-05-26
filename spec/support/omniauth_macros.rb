module OmniauthMacros
  def github_hash
    {
      "provider"=>"github",
      "uid"=>"2164119",
      "info"=>
        {"nickname"=>"yhoshino11",
         "email"=>"yhoshino11@gmail.com",
         "name"=>"Yu Hoshino",
         "image"=>"https://avatars.githubusercontent.com/u/2164119?v=3",
         "urls"=>{"GitHub"=>"https://github.com/yhoshino11", "Blog"=>"https://twitter.com/yhoshino11/"}},
      "credentials"=>{"token"=>"3860e4ab0aa4c4fccf2e2d44572ce02d2a5cfda0", "expires"=>false},
      "extra"=>
        {"raw_info"=>
          {"login"=>"yhoshino11",
           "id"=>2164119,
           "avatar_url"=>"https://avatars.githubusercontent.com/u/2164119?v=3",
           "gravatar_id"=>"",
           "url"=>"https://api.github.com/users/yhoshino11",
           "html_url"=>"https://github.com/yhoshino11",
           "followers_url"=>"https://api.github.com/users/yhoshino11/followers",
           "following_url"=>"https://api.github.com/users/yhoshino11/following{/other_user}",
           "gists_url"=>"https://api.github.com/users/yhoshino11/gists{/gist_id}",
           "starred_url"=>"https://api.github.com/users/yhoshino11/starred{/owner}{/repo}",
           "subscriptions_url"=>"https://api.github.com/users/yhoshino11/subscriptions",
           "organizations_url"=>"https://api.github.com/users/yhoshino11/orgs",
           "repos_url"=>"https://api.github.com/users/yhoshino11/repos",
           "events_url"=>"https://api.github.com/users/yhoshino11/events{/privacy}",
           "received_events_url"=>"https://api.github.com/users/yhoshino11/received_events",
           "type"=>"User",
           "site_admin"=>false,
           "name"=>"Yu Hoshino",
           "company"=>"Startup",
           "blog"=>"https://twitter.com/yhoshino11/",
           "location"=>"Tokyo",
           "email"=>"yhoshino11@gmail.com",
           "hireable"=>nil,
           "bio"=>nil,
           "public_repos"=>80,
           "public_gists"=>25,
           "followers"=>56,
           "following"=>27,
           "created_at"=>"2012-08-16T16:08:04Z",
           "updated_at"=>"2016-05-19T11:48:43Z",
           "private_gists"=>32,
           "total_private_repos"=>0,
           "owned_private_repos"=>0,
           "disk_usage"=>83303,
           "collaborators"=>0,
           "plan"=>{"name"=>"free", "space"=>976562499, "collaborators"=>0, "private_repos"=>0
          }
        }
      }
    }
  end

  def twitter_hash
    {
      "provider"=>"twitter",
      "uid"=>"601935449",
      "info"=>{"nickname"=>"nil_ppoi", "name"=>"ニル", "email"=>nil, "location"=>"日本 東京都", "image"=>"http://pbs.twimg.com/profile_images/709849980148711424/ws38SlR8_normal.jpg", "description"=>"予定は未定/プロフ画はSuGiRL(@aprilfool1177)さん/キャスは10月末までお休み", "urls"=>{"Website"=>nil, "Twitter"=>"https://twitter.com/nil_ppoi"}},
      "credentials"=>{"token"=>"601935449-A29ZQpJ4yPsCg7LYHVaLpM9boWUg2ugDgheByKfn", "secret"=>"c2zi3UzMzUOyKp73aTuhcQxDDYkgXHGgVllx3s8oIvfZ7"},
      "extra"=>
      {"access_token"=>
        {"token"=>"601935449-A29ZQpJ4yPsCg7LYHVaLpM9boWUg2ugDgheByKfn",
         "secret"=>"c2zi3UzMzUOyKp73aTuhcQxDDYkgXHGgVllx3s8oIvfZ7",
         "consumer"=>
         {"key"=>"FBkSORSX21XNQOsMbGviMfBAP",
       "secret"=>"7geBy1nuTnoPUaCbPIsKcorSDZA4dg2dK6QInyEhjVP5YaSA40",
       "options"=>{"signature_method"=>"HMAC-SHA1", "request_token_path"=>"/oauth/request_token", "authorize_path"=>"/oauth/authenticate", "access_token_path"=>"/oauth/access_token", "proxy"=>nil, "scheme"=>"header", "http_method"=>"post", "oauth_version"=>"1.0", "site"=>"https://api.twitter.com"},
       "http"=>
        {"address"=>"api.twitter.com",
         "port"=>443,
         "local_host"=>nil,
         "local_port"=>nil,
         "curr_http_version"=>"1.1",
         "keep_alive_timeout"=>2,
         "last_communicated"=>nil,
         "close_on_empty_response"=>false,
         "socket"=>nil,
         "started"=>false,
         "open_timeout"=>30,
         "read_timeout"=>30,
         "continue_timeout"=>nil,
         "debug_output"=>nil,
         "proxy_from_env"=>true,
         "proxy_uri"=>nil,
         "proxy_address"=>nil,
         "proxy_port"=>nil,
         "proxy_user"=>nil,
         "proxy_pass"=>nil,
         "use_ssl"=>true,
         "ssl_context"=>
          {"cert"=>nil,
           "key"=>nil,
           "client_ca"=>nil,
           "ca_file"=>nil,
           "ca_path"=>nil,
           "timeout"=>nil,
           "verify_mode"=>0,
           "verify_depth"=>nil,
           "renegotiation_cb"=>nil,
           "verify_callback"=>nil,
           "options"=>-2097019905,
           "cert_store"=>nil,
           "extra_chain_cert"=>nil,
           "client_cert_cb"=>nil,
           "tmp_dh_callback"=>nil,
           "session_id_context"=>nil,
           "session_get_cb"=>nil,
           "session_new_cb"=>nil,
           "session_remove_cb"=>nil,
           "servername_cb"=>nil,
           "npn_protocols"=>nil,
           "npn_select_cb"=>nil},
         "ssl_session"=>{},
         "enable_post_connection_check"=>true,
         "sspi_enabled"=>false,
         "ca_file"=>nil,
         "ca_path"=>nil,
         "cert"=>nil,
         "cert_store"=>nil,
         "ciphers"=>nil,
         "key"=>nil,
         "ssl_timeout"=>nil,
         "ssl_version"=>nil,
         "verify_callback"=>nil,
         "verify_depth"=>nil,
         "verify_mode"=>0},
       "http_method"=>"post",
       "uri"=>
        {"scheme"=>"https",
         "user"=>nil,
         "password"=>nil,
         "host"=>"api.twitter.com",
         "port"=>443,
         "path"=>"",
         "query"=>nil,
         "opaque"=>nil,
         "fragment"=>nil,
         "parser"=>
          {"regexp"=>
            {"SCHEME"=>"(?-mix:A[A-Za-z][A-Za-z0-9+-.]*z)",
             "USERINFO"=>"(?-mix:A(?:%hh|[!$&-.0-;=A-Z_a-z~])*z)",
             "HOST"=>
              "(?-mix:A(?:(?<IP-literal>[(?:(?<IPv6address>(?:h{1,4}:){6}(?<ls32>h{1,4}:h{1,4}|(?<IPv4address>(?<dec-octet>[1-9]d|1d{2}|2[0-4]d|25[0-5]|d).g<dec-octet>.g<dec-octet>.g<dec-octet>))|::(?:h{1,4}:){5}g<ls32>|h{,4}::(?:h{1,4}:){4}g<ls32>|(?:(?:h{1,4}:)?h{1,4})?::(?:h{1,4}:){3}g<ls32>|(?:(?:h{1,4}:){,2}h{1,4})?::(?:h{1,4}:){2}g<ls32>|(?:(?:h{1,4}:){,3}h{1,4})?::h{1,4}:g<ls32>|(?:(?:h{1,4}:){,4}h{1,4})?::g<ls32>|(?:(?:h{1,4}:){,5}h{1,4})?::h{1,4}|(?:(?:h{1,4}:){,6}h{1,4})?::)|(?<IPvFuture>vh+.[!$&-.0-;=A-Z_a-z~]+))])|g<IPv4address>|(?<reg-name>(?:%hh|[!$&-.0-9;=A-Z_a-z~])*))z)",
             "ABS_PATH"=>"(?-mix:A/(?:%hh|[!$&-.0-;=@-Z_a-z~])*(?:/(?:%hh|[!$&-.0-;=@-Z_a-z~])*)*z)",
             "REL_PATH"=>"(?-mix:A(?:%hh|[!$&-.0-;=@-Z_a-z~])+(?:/(?:%hh|[!$&-.0-;=@-Z_a-z~])*)*z)",
             "QUERY"=>"(?-mix:A(?:%hh|[!$&-.0-;=@-Z_a-z~/?])*z)",
             "FRAGMENT"=>"(?-mix:A(?:%hh|[!$&-.0-;=@-Z_a-z~/?])*z)",
             "OPAQUE"=>"(?-mix:A(?:[^/].*)?z)",
             "PORT"=>"(?-mix:A[x09x0ax0cx0d ]*d*[x09x0ax0cx0d ]*z)"}}}},
     "params"=>{"oauth_token"=>"601935449-A29ZQpJ4yPsCg7LYHVaLpM9boWUg2ugDgheByKfn", "oauth_token_secret"=>"c2zi3UzMzUOyKp73aTuhcQxDDYkgXHGgVllx3s8oIvfZ7", "user_id"=>"601935449", "screen_name"=>"nil_ppoi", "x_auth_expires"=>"0"},
     "response"=>
      {"cache-control"=>["no-cache, no-store, must-revalidate, pre-check=0, post-check=0"],
       "connection"=>["close"],
       "content-disposition"=>["attachment; filename=json.json"],
       "content-length"=>["684"],
       "content-type"=>["application/json;charset=utf-8"],
       "date"=>["Fri, 20 May 2016 20:22:23 GMT"],
       "expires"=>["Tue, 31 Mar 1981 05:00:00 GMT"],
       "last-modified"=>["Fri, 20 May 2016 20:22:23 GMT"],
       "pragma"=>["no-cache"],
       "server"=>["tsa_a"],
       "set-cookie"=>["lang=ja; Path=/", "guest_id=v1%3A146377574303822509; Domain=.twitter.com; Path=/; Expires=Sun, 20-May-2018 20:22:23 UTC"],
       "status"=>["200 OK"],
       "strict-transport-security"=>["max-age=631138519"],
       "x-access-level"=>["read-write"],
       "x-connection-hash"=>["fd8a45e7465fc6a940c67d427ea4358e"],
       "x-content-type-options"=>["nosniff"],
       "x-frame-options"=>["SAMEORIGIN"],
       "x-rate-limit-limit"=>["15"],
       "x-rate-limit-remaining"=>["14"],
       "x-rate-limit-reset"=>["1463776643"],
       "x-response-time"=>["87"],
       "x-transaction"=>["7dd794d5ed73dee0"],
       "x-twitter-response-tags"=>["BouncerExempt", "BouncerCompliant"],
       "x-xss-protection"=>["1; mode=block"]}},
   "raw_info"=>
    {"id"=>601935449,
     "id_str"=>"601935449",
     "name"=>"ニル",
     "screen_name"=>"nil_ppoi",
     "location"=>"日本 東京都",
     "description"=>"予定は未定/プロフ画はSuGiRL(@aprilfool1177)さん/キャスは10月末までお休み",
     "url"=>nil,
     "entities"=>{"description"=>{"urls"=>[]}},
     "protected"=>false,
     "followers_count"=>34,
     "friends_count"=>23,
     "listed_count"=>0,
     "created_at"=>"Thu Jun 07 14:54:28 +0000 2012",
     "favourites_count"=>109,
     "utc_offset"=>nil,
     "time_zone"=>nil,
     "geo_enabled"=>true,
     "verified"=>false,
     "statuses_count"=>943,
     "lang"=>"ja",
     "contributors_enabled"=>false,
     "is_translator"=>false,
     "is_translation_enabled"=>false,
     "profile_background_color"=>"C0DEED",
     "profile_background_image_url"=>"http://abs.twimg.com/images/themes/theme1/bg.png",
     "profile_background_image_url_https"=>"https://abs.twimg.com/images/themes/theme1/bg.png",
     "profile_background_tile"=>false,
     "profile_image_url"=>"http://pbs.twimg.com/profile_images/709849980148711424/ws38SlR8_normal.jpg",
     "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/709849980148711424/ws38SlR8_normal.jpg",
     "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/601935449/1453087467",
     "profile_link_color"=>"0084B4",
     "profile_sidebar_border_color"=>"C0DEED",
     "profile_sidebar_fill_color"=>"DDEEF6",
     "profile_text_color"=>"333333",
     "profile_use_background_image"=>true,
     "has_extended_profile"=>false,
     "default_profile"=>true,
     "default_profile_image"=>false,
     "following"=>false,
     "follow_request_sent"=>false,
     "notifications"=>false}}
    }
  end

  def mock_auth_hash
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
       "provider"=>"github",
       "uid"=>"2164119",
       "info"=>
        {"nickname"=>"yhoshino11",
         "email"=>"yhoshino11@gmail.com",
         "name"=>"Yu Hoshino",
         "image"=>"https://avatars.githubusercontent.com/u/2164119?v=3",
         "urls"=>{"GitHub"=>"https://github.com/yhoshino11", "Blog"=>"https://twitter.com/yhoshino11/"}},
       "credentials"=>{"token"=>"3860e4ab0aa4c4fccf2e2d44572ce02d2a5cfda0", "expires"=>false},
       "extra"=>
        {"raw_info"=>
          {"login"=>"yhoshino11",
           "id"=>2164119,
           "avatar_url"=>"https://avatars.githubusercontent.com/u/2164119?v=3",
           "gravatar_id"=>"",
           "url"=>"https://api.github.com/users/yhoshino11",
           "html_url"=>"https://github.com/yhoshino11",
           "followers_url"=>"https://api.github.com/users/yhoshino11/followers",
           "following_url"=>"https://api.github.com/users/yhoshino11/following{/other_user}",
           "gists_url"=>"https://api.github.com/users/yhoshino11/gists{/gist_id}",
           "starred_url"=>"https://api.github.com/users/yhoshino11/starred{/owner}{/repo}",
           "subscriptions_url"=>"https://api.github.com/users/yhoshino11/subscriptions",
           "organizations_url"=>"https://api.github.com/users/yhoshino11/orgs",
           "repos_url"=>"https://api.github.com/users/yhoshino11/repos",
           "events_url"=>"https://api.github.com/users/yhoshino11/events{/privacy}",
           "received_events_url"=>"https://api.github.com/users/yhoshino11/received_events",
           "type"=>"User",
           "site_admin"=>false,
           "name"=>"Yu Hoshino",
           "company"=>"Startup",
           "blog"=>"https://twitter.com/yhoshino11/",
           "location"=>"Tokyo",
           "email"=>"yhoshino11@gmail.com",
           "hireable"=>nil,
           "bio"=>nil,
           "public_repos"=>80,
           "public_gists"=>25,
           "followers"=>56,
           "following"=>27,
           "created_at"=>"2012-08-16T16:08:04Z",
           "updated_at"=>"2016-05-19T11:48:43Z",
           "private_gists"=>32,
           "total_private_repos"=>0,
           "owned_private_repos"=>0,
           "disk_usage"=>83303,
           "collaborators"=>0,
           "plan"=>{"name"=>"free", "space"=>976562499, "collaborators"=>0, "private_repos"=>0
          }
        }
      }
    })
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      "provider"=>"twitter",
      "uid"=>"601935449",
      "info"=>{"nickname"=>"nil_ppoi", "name"=>"ニル", "email"=>nil, "location"=>"日本 東京都", "image"=>"http://pbs.twimg.com/profile_images/709849980148711424/ws38SlR8_normal.jpg", "description"=>"予定は未定/プロフ画はSuGiRL(@aprilfool1177)さん/キャスは10月末までお休み", "urls"=>{"Website"=>nil, "Twitter"=>"https://twitter.com/nil_ppoi"}},
      "credentials"=>{"token"=>"601935449-A29ZQpJ4yPsCg7LYHVaLpM9boWUg2ugDgheByKfn", "secret"=>"c2zi3UzMzUOyKp73aTuhcQxDDYkgXHGgVllx3s8oIvfZ7"},
      "extra"=>
      {"access_token"=>
        {"token"=>"601935449-A29ZQpJ4yPsCg7LYHVaLpM9boWUg2ugDgheByKfn",
         "secret"=>"c2zi3UzMzUOyKp73aTuhcQxDDYkgXHGgVllx3s8oIvfZ7",
         "consumer"=>
         {"key"=>"FBkSORSX21XNQOsMbGviMfBAP",
       "secret"=>"7geBy1nuTnoPUaCbPIsKcorSDZA4dg2dK6QInyEhjVP5YaSA40",
       "options"=>{"signature_method"=>"HMAC-SHA1", "request_token_path"=>"/oauth/request_token", "authorize_path"=>"/oauth/authenticate", "access_token_path"=>"/oauth/access_token", "proxy"=>nil, "scheme"=>"header", "http_method"=>"post", "oauth_version"=>"1.0", "site"=>"https://api.twitter.com"},
       "http"=>
        {"address"=>"api.twitter.com",
         "port"=>443,
         "local_host"=>nil,
         "local_port"=>nil,
         "curr_http_version"=>"1.1",
         "keep_alive_timeout"=>2,
         "last_communicated"=>nil,
         "close_on_empty_response"=>false,
         "socket"=>nil,
         "started"=>false,
         "open_timeout"=>30,
         "read_timeout"=>30,
         "continue_timeout"=>nil,
         "debug_output"=>nil,
         "proxy_from_env"=>true,
         "proxy_uri"=>nil,
         "proxy_address"=>nil,
         "proxy_port"=>nil,
         "proxy_user"=>nil,
         "proxy_pass"=>nil,
         "use_ssl"=>true,
         "ssl_context"=>
          {"cert"=>nil,
           "key"=>nil,
           "client_ca"=>nil,
           "ca_file"=>nil,
           "ca_path"=>nil,
           "timeout"=>nil,
           "verify_mode"=>0,
           "verify_depth"=>nil,
           "renegotiation_cb"=>nil,
           "verify_callback"=>nil,
           "options"=>-2097019905,
           "cert_store"=>nil,
           "extra_chain_cert"=>nil,
           "client_cert_cb"=>nil,
           "tmp_dh_callback"=>nil,
           "session_id_context"=>nil,
           "session_get_cb"=>nil,
           "session_new_cb"=>nil,
           "session_remove_cb"=>nil,
           "servername_cb"=>nil,
           "npn_protocols"=>nil,
           "npn_select_cb"=>nil},
         "ssl_session"=>{},
         "enable_post_connection_check"=>true,
         "sspi_enabled"=>false,
         "ca_file"=>nil,
         "ca_path"=>nil,
         "cert"=>nil,
         "cert_store"=>nil,
         "ciphers"=>nil,
         "key"=>nil,
         "ssl_timeout"=>nil,
         "ssl_version"=>nil,
         "verify_callback"=>nil,
         "verify_depth"=>nil,
         "verify_mode"=>0},
       "http_method"=>"post",
       "uri"=>
        {"scheme"=>"https",
         "user"=>nil,
         "password"=>nil,
         "host"=>"api.twitter.com",
         "port"=>443,
         "path"=>"",
         "query"=>nil,
         "opaque"=>nil,
         "fragment"=>nil,
         "parser"=>
          {"regexp"=>
            {"SCHEME"=>"(?-mix:A[A-Za-z][A-Za-z0-9+-.]*z)",
             "USERINFO"=>"(?-mix:A(?:%hh|[!$&-.0-;=A-Z_a-z~])*z)",
             "HOST"=>
              "(?-mix:A(?:(?<IP-literal>[(?:(?<IPv6address>(?:h{1,4}:){6}(?<ls32>h{1,4}:h{1,4}|(?<IPv4address>(?<dec-octet>[1-9]d|1d{2}|2[0-4]d|25[0-5]|d).g<dec-octet>.g<dec-octet>.g<dec-octet>))|::(?:h{1,4}:){5}g<ls32>|h{,4}::(?:h{1,4}:){4}g<ls32>|(?:(?:h{1,4}:)?h{1,4})?::(?:h{1,4}:){3}g<ls32>|(?:(?:h{1,4}:){,2}h{1,4})?::(?:h{1,4}:){2}g<ls32>|(?:(?:h{1,4}:){,3}h{1,4})?::h{1,4}:g<ls32>|(?:(?:h{1,4}:){,4}h{1,4})?::g<ls32>|(?:(?:h{1,4}:){,5}h{1,4})?::h{1,4}|(?:(?:h{1,4}:){,6}h{1,4})?::)|(?<IPvFuture>vh+.[!$&-.0-;=A-Z_a-z~]+))])|g<IPv4address>|(?<reg-name>(?:%hh|[!$&-.0-9;=A-Z_a-z~])*))z)",
             "ABS_PATH"=>"(?-mix:A/(?:%hh|[!$&-.0-;=@-Z_a-z~])*(?:/(?:%hh|[!$&-.0-;=@-Z_a-z~])*)*z)",
             "REL_PATH"=>"(?-mix:A(?:%hh|[!$&-.0-;=@-Z_a-z~])+(?:/(?:%hh|[!$&-.0-;=@-Z_a-z~])*)*z)",
             "QUERY"=>"(?-mix:A(?:%hh|[!$&-.0-;=@-Z_a-z~/?])*z)",
             "FRAGMENT"=>"(?-mix:A(?:%hh|[!$&-.0-;=@-Z_a-z~/?])*z)",
             "OPAQUE"=>"(?-mix:A(?:[^/].*)?z)",
             "PORT"=>"(?-mix:A[x09x0ax0cx0d ]*d*[x09x0ax0cx0d ]*z)"}}}},
     "params"=>{"oauth_token"=>"601935449-A29ZQpJ4yPsCg7LYHVaLpM9boWUg2ugDgheByKfn", "oauth_token_secret"=>"c2zi3UzMzUOyKp73aTuhcQxDDYkgXHGgVllx3s8oIvfZ7", "user_id"=>"601935449", "screen_name"=>"nil_ppoi", "x_auth_expires"=>"0"},
     "response"=>
      {"cache-control"=>["no-cache, no-store, must-revalidate, pre-check=0, post-check=0"],
       "connection"=>["close"],
       "content-disposition"=>["attachment; filename=json.json"],
       "content-length"=>["684"],
       "content-type"=>["application/json;charset=utf-8"],
       "date"=>["Fri, 20 May 2016 20:22:23 GMT"],
       "expires"=>["Tue, 31 Mar 1981 05:00:00 GMT"],
       "last-modified"=>["Fri, 20 May 2016 20:22:23 GMT"],
       "pragma"=>["no-cache"],
       "server"=>["tsa_a"],
       "set-cookie"=>["lang=ja; Path=/", "guest_id=v1%3A146377574303822509; Domain=.twitter.com; Path=/; Expires=Sun, 20-May-2018 20:22:23 UTC"],
       "status"=>["200 OK"],
       "strict-transport-security"=>["max-age=631138519"],
       "x-access-level"=>["read-write"],
       "x-connection-hash"=>["fd8a45e7465fc6a940c67d427ea4358e"],
       "x-content-type-options"=>["nosniff"],
       "x-frame-options"=>["SAMEORIGIN"],
       "x-rate-limit-limit"=>["15"],
       "x-rate-limit-remaining"=>["14"],
       "x-rate-limit-reset"=>["1463776643"],
       "x-response-time"=>["87"],
       "x-transaction"=>["7dd794d5ed73dee0"],
       "x-twitter-response-tags"=>["BouncerExempt", "BouncerCompliant"],
       "x-xss-protection"=>["1; mode=block"]}},
   "raw_info"=>
    {"id"=>601935449,
     "id_str"=>"601935449",
     "name"=>"ニル",
     "screen_name"=>"nil_ppoi",
     "location"=>"日本 東京都",
     "description"=>"予定は未定/プロフ画はSuGiRL(@aprilfool1177)さん/キャスは10月末までお休み",
     "url"=>nil,
     "entities"=>{"description"=>{"urls"=>[]}},
     "protected"=>false,
     "followers_count"=>34,
     "friends_count"=>23,
     "listed_count"=>0,
     "created_at"=>"Thu Jun 07 14:54:28 +0000 2012",
     "favourites_count"=>109,
     "utc_offset"=>nil,
     "time_zone"=>nil,
     "geo_enabled"=>true,
     "verified"=>false,
     "statuses_count"=>943,
     "lang"=>"ja",
     "contributors_enabled"=>false,
     "is_translator"=>false,
     "is_translation_enabled"=>false,
     "profile_background_color"=>"C0DEED",
     "profile_background_image_url"=>"http://abs.twimg.com/images/themes/theme1/bg.png",
     "profile_background_image_url_https"=>"https://abs.twimg.com/images/themes/theme1/bg.png",
     "profile_background_tile"=>false,
     "profile_image_url"=>"http://pbs.twimg.com/profile_images/709849980148711424/ws38SlR8_normal.jpg",
     "profile_image_url_https"=>"https://pbs.twimg.com/profile_images/709849980148711424/ws38SlR8_normal.jpg",
     "profile_banner_url"=>"https://pbs.twimg.com/profile_banners/601935449/1453087467",
     "profile_link_color"=>"0084B4",
     "profile_sidebar_border_color"=>"C0DEED",
     "profile_sidebar_fill_color"=>"DDEEF6",
     "profile_text_color"=>"333333",
     "profile_use_background_image"=>true,
     "has_extended_profile"=>false,
     "default_profile"=>true,
     "default_profile_image"=>false,
     "following"=>false,
     "follow_request_sent"=>false,
     "notifications"=>false}}
    })
  end
end
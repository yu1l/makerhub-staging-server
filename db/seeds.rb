module OmniauthMacros
  def self.github_hash
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
end

p User.find_from_auth(OmniauthMacros.github_hash, nil) if User.count == 0

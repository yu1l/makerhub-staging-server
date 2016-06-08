# :ballot_box_with_check: API Endpoints - **deprecated**
# Moved to [here](https://github.com/MakerHubLive/doc/blob/master/Endpoint.md)

## Summary

**NOTE** : Every request requires api-token on header params

 Type | Path
------|------
 GET  | /api/v1/streams
 GET  | /api/v1/records
 POST | /api/v1/sign_in


## Documentation

### Stream

#### Fetch All

```
GET /api/v1/streams
```

##### Response

```
Status 200
```

```json
{
  "streams": [
    {
      "thumbnail" : "https://assets.com/thumbnail.png",
      "title" : "Transforming Rails Backend Server to Rust",
      "summary" : "Edited by moderators to describe the stream.",
      "viewers" : 24,
      "category" : "Rust",
      "user": {
        "name" : "Yu Hoshino",
        "nickname" : "yhoshino11",
        "avatar" : "https://assets.com/yhoshino11.png",
      }
    },
  ]
}
```

### Record

#### Fetch All

```
GET /api/v1/records
```

##### Response

```
Status 200
```

```json
{
  "records": [
    {
      "uid" : "7uDt8kR",
      "thumbnail" : "https://assets.com/thumbnail.png",
      "title" : "Transforming Rails Backend Server to Rust",
      "summary" : "Edited by moderators to describe the stream.",
      "duration" : 7200,
      "pv" : 512,
      "user": {
        "name" : "Yu Hoshino",
        "nickname" : "yhoshino11",
        "avatar" : "https://assets.com/yhoshino11.png",
      }
    },
  ]
}
```

### Sign in

#### with GitHub

```
POST /api/v1/sign_in
```

##### Parameters

 Name       | Type       | Notes
------------|------------|------------------------------------------------
 `provider` | string     | Required
 `uid`      | string     | Required
 `info`     | dictionary | Required

```json
{
  "provider": "github",
  "uid": "9258492",
  "info": {
    "nickname": "yhoshino11",
    "name": "Yu Hoshino",
    "email": "yhoshino11@gmail.com",
    "image": "https://avatars.githubusercontent.com/u/2164119?v=3",
    "urls": {
      "GitHub":"https://github.com/yhoshino11",
      "Blog":"https://twitter.com/yhoshino11/"
    }
  }
}
```

##### Response

```
Status 200
```

```json
{
  "user" : {
    "name" : "Yu Hoshino",
    "nickname" : "yhoshino11",
    "avatar" : "https://assets.com/username.png",
    "streaming_key" : "yhoshino11?token=asdk...",
  },
  "channel" : {
    "category" : "UI/UX",
    "title" : "Just Started",
    "description" : "Nice to meet you",
  },
  "records" : [
    {
      "uid" : "7uDt8kR",
      "thumbnail" : "https://assets.com/thumbnail.png",
      "title" : "Transforming Rails Backend Server to Rust",
      "summary" : "Edited by moderators to describe the stream.",
      "duration" : 7200,
      "pv" : 512,
      "user": {
        "name" : "Yu Hoshino",
        "nickname" : "yhoshino11",
        "avatar" : "https://assets.com/yhoshino11.png",
      }
    },
  ]
}
```

If something wrong:

```
Status 500
```

```json
{
  "message": "An internal server error occured"
}
```

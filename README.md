mimemagic broke the old one 

img repo api only server

supports image files and base64 image strings

There's no graphiql because it's api only, suggest using postman or similar
### Requirements!
Ruby 3.0.1
Imagemagick
Postgresql 13

will dockerize when I have time

### API 

API URL
local testing: http://localhost:3000/

#### GET /image_files/
returns all image files


```
GET http://localhost:3000/image_files

Example API Response

[
    {
        "id": 1,
        "image_title": "",
        "created_at": "2021-05-02T07:47:29.564Z",
        "updated_at": "2021-05-02T07:47:29.621Z",
        "image": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--f0d62d4bc16cb080ad6b61a1ba84b6c2cdae8b75/83x6kymx4xf41.jpg"
    }
]
```
POST
```
POST http://localhost:3000/image_files
form data:
image_title: String
image: file
```

```
Example API Response

{
    "id": 1,
    "image_title": "",
    "created_at": "2021-05-02T07:47:29.564Z",
    "updated_at": "2021-05-02T07:47:29.621Z"
}
```

### GraphQL
##### Available Queries
```
{
  images {
    id
    imageTitle
    imageUrl
  }
}
```
```
Example API Response

{
    "data": {
        "images": [
            {
                "id": "1",
                "imageTitle": "",
                "imageUrl": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--f0d62d4bc16cb080ad6b61a1ba84b6c2cdae8b75/83x6kymx4xf41.jpg"
            }
        ]
    }
}
```

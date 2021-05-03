mimemagic broke the old one
### Description

img repo api only server

supports image files and base64 image strings

##### Thoughts
trying out graphql and rails, image similarity search because it's interesting to me

image similarity search is based on average hash of each image, within a hamming distance of x

of course the modern way to do it is feature detection and tagging /phash, would take about 3 weeks

There's no graphiql because it's api only, suggest using postman or similar for queries

rails is very opinionated

### Requirements!
Ruby 3.0.1
Rails 6.1.3.1
Imagemagick
Postgresql 13

will dockerize when I have no headache, imagemagick isn't cooperative

##### Running
```
assuming you have all reqs

bundle install
db:migrate
db:seed
rails s
```
Image files aren't seeded, please bring your own

### API 

API URL
local server: http://localhost:3000/ or your own configuration

#### Important
Image links expire after 5 mins, this could be changed depending on usecase

#### GET /image_files/
returns all image files

```graphql
GET http://localhost:3000/image_files

Example API Response

[
    {
        "id": 1,
        "image_title": "efates",
        "avg_hash": "11010110011001100110011111110000110111111011111001001100",
        "created_at": "2021-05-03T03:14:03.519Z",
        "updated_at": "2021-05-03T03:14:03.535Z",
        "image": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--f0d62d4bc16cb080ad6b61a1ba84b6c2cdae8b75/83x6kymx4xf41.jpg"
    },
    {
        "id": 2,
        "image_title": "efates",
        "avg_hash": "11010110011001100110011111110000110111111011111001001100",
        "created_at": "2021-05-03T03:14:22.402Z",
        "updated_at": "2021-05-03T03:14:22.428Z",
        "image": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCdz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--af16b78dd297f2f43b5cc02fbebec40eb2330b90/83x6kymx4xf41.jpg"
    },
    ...
]
```
#### GET /image_files/:image_title
Get images by title
```graphql
GET http://localhost:3000/image_files/efates

Example API Response
[
    {
        "id": 1,
        "image_title": "efates",
        "avg_hash": "11010110011001100110011111110000110111111011111001001100",
        "created_at": "2021-05-03T03:14:03.519Z",
        "updated_at": "2021-05-03T03:14:03.535Z"
    },
    {
        "id": 2,
        "image_title": "efates",
        "avg_hash": "11010110011001100110011111110000110111111011111001001100",
        "created_at": "2021-05-03T03:14:22.402Z",
        "updated_at": "2021-05-03T03:14:22.428Z"
    },
    ...
]
```


#### POST /image_files/
Create a new image by file upload
##### form data
```
image_title: String
image: file
```

```graphql
POST http://localhost:3000/image_files
form data
image_title: String
image: file

Example API Response

{
    "id": 13,
    "image_title": "eefefates",
    "avg_hash": "11010110000001111000011111110000110111111011111001000000",
    "created_at": "2021-05-03T06:50:26.054Z",
    "updated_at": "2021-05-03T06:50:26.801Z"
}
```

#### POST /image_files/search
Search for images by image similarity

```graphql
POST http://localhost:3000/image_files/search
form data
image_title: String
image: file

Example API Response
[
    {
        "id": 6,
        "image_title": "eefefates",
        "avg_hash": "11010110000001111000011111110000110111111011111001000000",
        "created_at": "2021-05-03T04:39:35.160Z",
        "updated_at": "2021-05-03T04:39:35.937Z"
    },
    {
        "id": 13,
        "image_title": "eefefates",
        "avg_hash": "11010110000001111000011111110000110111111011111001000000",
        "created_at": "2021-05-03T06:50:26.054Z",
        "updated_at": "2021-05-03T06:50:26.801Z"
    }
]
```

### GraphQL /graphql

##### Available Queries
```graphql
{
  images {
    id
    imageTitle
    imageUrl
  }
}
```
```graphql
Example API Response

{
    "data": {
        "images": [
            {
                "id": "1",
                "imageTitle": "efates",
                "imageUrl": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--f0d62d4bc16cb080ad6b61a1ba84b6c2cdae8b75/83x6kymx4xf41.jpg"
            },
            ...
        ]
    }
}
```

rails generate graphql:install

# query json examples
## reading data

```graphql
{
  author(id: 3) {
      id,
      first_name,
      fullName
      posts {
          id,
          text
      }
  }
}
```

## Mutating data
```graphql
# creation
mutation {
    createAuthor(firstName: "He", lastName: "Who cannot be named", yob: 3) {
        # return values
        fullName
        yob
        isAlive
    }
}

# update
mutation updateAuthor($author:AuthorInputType!) {
    updateAuthor(author: $author)
}
# delete
mutation {
    deleteAuthor(id: 1)
}
```

## Query variables
```graphql
# query passing individual fields
mutation createAuthor($first_name:String, $last_name:String, $yob:Integer) {
    createAuthor(firstName: $first_name, lastName: $last_name, yob: $yob) {
        fullName
        yob
        isAlive
    }
}
```
query variables json
```json
{
    "first_name": "New",
    "last_name": "Author",
    "yob": 1999
}
```
```graphql
# query passing input type
mutation createAuthor($author:AuthorInputType!) {
    createAuthor(author: $author) {
        fullName
        yob
        isAlive
    }
}
```
query variables json
```json
{
  "author" : {
    "first_name": "New",
    "last_name": "Author",
    "yob": 1999
  }
}
```

# Authentication
Frontend form -> Backend 

                   ||

frontend    <-     session key

frontend - session key in header + query -> backend - result -> frontend

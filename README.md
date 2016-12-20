# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
 ####messages

  | column | type |
|:-----------|:----------- |
| body *n    |     text    |
| image      |    string   |
| group_id   |   integer   |
| user_id    |   integer   |

 ####users

  | column | type |
|:-----------|:----------- |
| name *n   i|    string   |
| devise関連 |             |
| group_id   |   integer   |


 ####groups

  | column | type |
|:-----------|:----------- |
| key     *n |     string  |

 *n = not null
 i = index

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

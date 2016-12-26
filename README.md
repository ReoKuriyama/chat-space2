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
| body n    |     text    |
| image      |    string   |
| group_id   |   integer   |
| user_id    |   integer   |

 ####users

  | column | type |
|:-----------|:----------- |
| name n   i|    string   |
| email      |    string   |
|encrypted_password *n| string|
| group_id   |   integer   |


 ####groups

  | column | type |
|:-----------|:----------- |
| key     n |     string  |

 n = not null
 i = index


* Association


  user has_many groups_users
  user has_many groups thorugh: :groups_users

  message belongs_to user

  group has_many groups_users
  group has_many users through: :group_users

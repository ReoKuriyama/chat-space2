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


 ####groups

  | column | type |
|:-----------|:----------- |
| group_name     n |     string  |

 ####group_users

  | column | type |
|:-----------|:----------- |
| group_id|    integer   |
| user_id      |    integer   |

 n = not null
 i = index


* Association

  #####message

  message belongs_to user

  message belongs_to user


  #####user

  user has_many messages

  user has_many group_users

  user has_many groups through: :group_users

  #####group
  group has_many group_users

  group has_many messages

  group has_many users through: :group_users

  #####group_users

  belongs_to user

  belongs_to group

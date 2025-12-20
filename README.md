# What is Chorifico?

Chorifico is an online place for managing main chores of your choir. 😊

## What chores?

Chorifico is focused on managing essential and fundamental parts of your choir:

* Members
* Events
---
* Notifications
* Songbook
* Polls (quick and easy feedback)
* Subscriptions (membership fees)

### LATER

* Comments / Notes
* File / Attachments
* Documents / Articles / Posts

## And what about...

### Chorifico name? Where does it come from?

TODO: (chorus + ifico)

# Roadmap

In order to launch a 1.0 version of the web app, it needs to have:

## Web framework

* Plain and simple Rails web app with mobile first interface
  * ERB + partials + layout
  * DaisyUI

### LATER

* Snappy Rails PWA with push notifications via Hotwire

### MAYBE?

* ViewComponents
* Hotwire Native mobile app
* Integrated PM or Chat?!?

## Groups

* Basic data:
  * Name
  * username / slug / ?!?
  * Type
  * Location
  * website URL
  * Description

## Users

* User can **LOGIN** to their account with:
  * Email via magic link
* Users have their **PROFILE** with basic data:
  * Name
  * Surname
  * Email address
  * Mobile phone number

### LATER

* User can **LOGIN** to their account with:
  * Google account (?)
  * Passkey

### MAYBE?

* User / Profile / Account / Identity

## Memberships

* User <-> Group association
* Fields:
  * Start date
  * End date
  * Status: Active, Paused, Inactive
  * Role(s)

### LATER

* Membership history:
  * Start date
  * Status
* Business logic about update, create, destroy...
* Dependencies -- DO NOT DESTROY!

## Roles

* Group owner
* Events & Polls admin
* Treasury admin
* Member (default)

### LATER

* Group admin
* Songbook admin
* Polls admin

## Events

* Event contains basic data:
  * Name
  * Status: unconfirmed, confirmed, concluded, canceled, declined
  * Type: Rehearsal, Gig (Performance/Concert) - or just do it as tagging/categorization?
  * Start date and time
  * End date and time
  * Location
  * Description
  * created_by (event admin)
  * managed_by (member)
  * Attendees via association
* Only (event) admin can create events
* Users are invited via email to RSVP their attendance

### LATER

* Deadline for RSVP
* Reccuring events
* Attachments or links to other entities e.g. Songs, File uploads?
* Belong to season (either whole year or some specifit date range)
* Track RSVP (and other?) changes...

### MAYBE?

* iCalendar one-way sync
* Status workflow (rules)

## Songbook

* Song should have following basic fields:
  * Title
  * Lyrics
  * Notes

### LATER

* Extra fields:
  * Duration
  * Key
  * Author
  * Arrangement
* Attachments


## Polls

### LATER

* Polls about:
  * Upcoming events
  * All other kinds of stuff

## Treasury

## LATER

* Membership fee aka Subscriptions

## Later

* Translations aka il8n
* Comments
* Seasons
* Reports
  * For ZAMP!!!
* Attachments
* Dashboard

## Maybe?

* Tasks

# Technical details

## Tech stack

* Ruby on Rails

## ERD

```mermaid
erDiagram
    USERS {
        int id PK
        string name
        string surname
        string email UK
        string mobile_phone
    }

    GROUPS {
        int id PK
        string name
        string slug UK
        string type
        integer location_id
        string website_url
        text description
    }

    MEMBERSHIPS {
        int id PK
        int user_id FK
        int group_id FK
        enum status "active, inactive, paused"
        enum role "admin, moderator, member"
    }

    EVENTS {
        int id PK
        int group_id FK
        int created_by FK
        int managed_by FK
        string name
        enum status "unconfirmed, confirmed, concluded, canceled, declined"
        enum type "rehearsal, gig"
        datetime start_datetime
        interval duration
        integer location_id
        text description
    }

    LOCATION {
        string name
        string address
    }

    EVENT_ATTENDEES {
        int id PK
        int user_id FK
        int event_id FK
    }

    USERS ||--o{ MEMBERSHIPS : "has"
    GROUPS ||--o{ MEMBERSHIPS : "has"
    GROUPS ||--o{ EVENTS : "hosts"
    USERS ||--o{ EVENTS : "creates"
    USERS ||--o{ EVENTS : "manages"
    USERS ||--o{ EVENT_ATTENDEES : "attends"
    EVENTS ||--o{ EVENT_ATTENDEES : "has"
    GROUPS }o--|| LOCATION : "has"
    EVENTS }o--|| LOCATION : "has"
```

---
title: Mailing List Sprint
---

Review: 20/6/15 

# 1.  Features

- Profiles
- Script include to register new users
- Organizations
- Class List
- Mailing List
- Message
- Event

# 2.  Classes Required

- User
- Session
- Credential
- Organization 
- Event
- CommsSchedule
- Email
- Course/ClassList/MailingList/Group

# 3.  Tests

- Users can register.
- Users can receive messages via email.
- User can view their own profile (image).
- User can view course list.
- Timed messages can be sent according to CommsSchedule (single event after course).
- User can view sent messages as HTML.
- PDF document can be downloaded after course.

# 4.  External Requirements

- Mail Agent (Amazon/Mailgunâ¦ or MailChimp)
- Heroku

# 5.  Future Sprints

- Social
- Course Management (inc. Scheduling)
- Drills (a. view, b. capture data)
- Inventory

# Models

## User Management

1. User
1. Session
1. Authentication Strategy
1. Organization / Club / Store
1. Credential: Member, Administrator

## Course Management

1. Event: Class
1. ClassList / Participant / Attendance
1. Course
1. Curriculum
1. Schedule: EventSchedule

## Inventory

1. Item
1. Part
1. Disposable
1. Inventory

## Content Management

1. Asset: Video, Image
1. Document
1. Routine / Drill

## Messaging

1. MailingList
1. Message: Email, SMS
1. Schedule: CommsSchedule

## Social

1. Discussion
1. Notice / Announcement Alert
1. Profile
1. Badge / Achievement
1. Community / Group
1. Friend

## Competition

1. Score
1. Competition
1. Tournament
1. League

## Marketplace

1. Listing
1. Advertisement

## Financial

1. Sale
1. Payment
1. Receipt

## Spatio-Temporal

- Event
- Schedule
- Location

# Implementation Notes

## Authentication

Align application users and groups with native filesystem and persistence 
store.  We might need to store and fork binary assets in the future and it'd 
be nice to reuse common tools.

## Tiers

Introduce tiers that generalize feature and system objects.

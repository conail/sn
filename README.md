---
title: Mailing List Sprint
---

Review: 20/6/15 

# 1.  Features

[x] Profiles
[x] Script include to register new users
[x] Organizations
[ ] Class List
[ ] Mailing List
[ ] Message
[ ] Event

# 2.  Classes Required

[x] User
[x] Session
[x] Credential
[x] Organization 
[ ] Event
[ ] CommsSchedule
[ ] Email
[ ] Course/ClassList/MailingList/Group

# 3.  Tests

[x] Users can register.
[ ] Users can receive messages via email.
[x] User can view their own profile (image).
[ ] User can view course list.
[ ] Timed messages can be sent according to CommsSchedule (single event after course).
[ ] User can view sent messages as HTML.
[ ] PDF document can be downloaded after course.

# 4.  External Requirements

[x] Mail Agent (Mailgun)
[x] Heroku

# 5.  Future Sprints

[ ] Social
[ ] Course Management (inc. Scheduling)
[ ] Drills (a. view, b. capture data)
[ ] Inventory

# Models

## User Management

[x] User
[x] Session
[x] Authentication Strategy
[ ] Organization / Club / Store
[ ] Credential: Member, Administrator

## Course Management

[ ] Event: Class
[ ] ClassList / Participant / Attendance
[ ] Course
[ ] Curriculum
[ ] Schedule: EventSchedule

## Inventory

[ ] Item
[ ] Part
[ ] Disposable
[ ] Inventory

## Content Management

[ ] Asset: Video, Image
[ ] Document
[ ] Routine / Drill

## Messaging

[ ] MailingList
[ ] Message: Email, SMS
[ ] Schedule: CommsSchedule

## Social

[ ] Discussion
[ ] Notice / Announcement Alert
[ ] Profile
[ ] Badge / Achievement
[ ] Community / Group
[ ] Friend

## Competition

[ ] Score
[ ] Competition
[ ] Tournament
[ ] League

## Marketplace

[ ] Listing
[ ] Advertisement

## Financial

[ ] Sale
[ ] Payment
[ ] Receipt

## Spatio-Temporal

[ ] Event
[ ] Schedule
[ ] Location

# Implementation Notes

## Authentication

Align application users and groups with native filesystem and persistence 
store.  We might need to store and fork binary assets in the future and it'd 
be nice to reuse common tools.

## Tiers

Introduce tiers that generalize feature and system objects.

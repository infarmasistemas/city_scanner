# README



This is a basic solution to monitor web pages and stuff.

To Do:

    Limit user access according to permissions (can only see their own logs, their own URLs registered. CANCANCAN)
    Sound warning whenever a URL's status changes 
    
What you get:

    Ability to monitor URLs 
    Notifications on screen whenever a URL is down and when it's back up
    Email notifications when URLs go down and back UP
        You can setup a list of emails to be contacted when this occurs
    
    
# City Scanner - A very basic URL montoring tool

## Why

Basically we (the team I was working with) were having some issues related to a few applications that kept going down without a clear reason
or warning. I thought that a solution that would be capable of testing those URLs within intervals of time would be handy, but I wasn't willing to 
pay for one and I also wanted it to be as simple as possible (basic notifications).

Knowing that something like that probably existed, I decided to come up with my own solution because why the hell not?

## What you get

    Ability to monitor URLs 
    Notifications on screen whenever a URL is down and when it's back up
    Email notifications when URLs go down and when they come back up (so as not to clog your email box)
    You can setup a list of email addresses to be contacted when a change in status occurs

## Regarding notifications (toastr, email...)

A resource (or URL) has basically three statuses:

* Neutral (default status when created)
* Up (cool, it's working)
* Down (sad_face_here)

A notification (email or otherwise) is sent whenever a status change occurs.

### TO DO

    Limit user access according to permissions (can only see their own logs, their own URLs registered. CANCANCAN)
    Sound warning whenever a URL's status changes
    Write tests 

## Getting Started

* Clone the project
* rake:db create db:migrate db:seed
* bundle install
* rails s

## Prerequisites

```
Rails 5.2.3
Ruby 2.6.3
```

## Author

* **Charles Washington de Aquino dos Santos** - [Caws](https://github.com/caws)

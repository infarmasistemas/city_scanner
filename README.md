# City Scanner - A very basic URL monitoring tool

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
    Users can only work with resources related to their user IDs
    Sound warning whenever a URL's status changes

## Regarding notifications (toastr, email...)

A resource (or URL) has basically three statuses:

* Neutral (default status when created)
* Up (cool, it's working)
* Down (sad_face_here)

A notification (email or otherwise) is sent whenever a status change occurs.

### TO DO

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

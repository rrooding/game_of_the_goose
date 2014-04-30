Game of the Goose
=============

This is the main repo for distributing the cucumber features for
Kabisa's first Cucumber challenge.

The goal is to implement the system described by the cucumber features.
And to learn from each others architectural decisions.

This time it is a Dutch themed challenge.

The cukes are therefor in Dutch.

##Setup

###Generic

* Clone this repository
* Copy `env.example` to `.env`.


###Web

Start the webserver

```
$ bundle exec foreman run web
```

Now go to [http://localhost:8000](http://localhost:8000)


### Testing

Run the features:

```
$ bundle exec rspec
```

Or use Guard during development:

```
$ bundle exec guard
```
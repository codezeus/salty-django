# Salty-Django

This is a full-stack Django setup using some of the top recommended
applications. These include:

- [Django 1.8](https://www.djangoproject.com/): The latest version of Django itself.
- [Gunicorn](http://gunicorn.org/): Top notch application server for keeping our app alive.
- [Supervisor](http://supervisord.org/): Command manager to keep the server itself alive.
- [NGINX](http://nginx.org/): Lean server to proxy requests back to Gunicorn.
- [Postgresql](http://www.postgresql.org/): Our trusty database.
- [Virtualenv](https://virtualenv.pypa.io/en/latest/): Keeps virtual environments sane and modular giving a cleaner global state.
- [Redis](http://redis.io/): For handling cache or whatever else you may need it for.
- [Saltstack](http://saltstack.com/): The glue that picks all the pieces up and makes it automatically work for us.
- [Vagrant](https://www.vagrantup.com/): A simple API to interact with our VM and give us a "blank slate".
- [Postfix](http://www.postfix.org/): Mail server to allow sending emails from Django.

## Getting Started

1. Install [Vagrant](http://docs.vagrantup.com/v2/installation/index.html).
2. Install Vagrant Salt Plugin (`vagrant plugin install vagrant-salt`).
3. Run `vagrant up`.
4. Checkout http://salt-dev/ in your browser and you should be good to go.

## Notes

This is still in development as there are a number of things I would like to
do with it still. Nonetheless, this will spin up a working Django instance via
SaltStack.

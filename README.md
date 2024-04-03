# WordCamp Development Environment

Setup the developement environment for https://github.com/WordPress/wordcamp.org with one click (and a couple of commands 😅).

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/candy02058912/wordcamp-dev-environment)

1. Once your Gitpod environment has loaded, please go to the PORTS tab and copy the address for port 443. Should be something like: 443-candy020589-wordcampdev-xvpm10eb4u7.ws-us110.gitpod.io

2. Open `wordcamp.test/.docker/data/wordcamp_dev.sql` and replace `wordcamp.test` with the url from above.

3. Open `wordcamp.test/.docker/config/composer.json` and change
```
{
    "type": "vsc",
    "url": "https://github.com/WordPress/wporg-mu-plugins.git"
},
```

to `"type": "git"`

```
{
    "type": "git",
    "url": "https://github.com/WordPress/wporg-mu-plugins.git"
},
```

4. Open `wordcamp.test/.docker/wp-config.php` and comment out the lines for
```
   define( 'DOMAIN_CURRENT_SITE',   'buddycamp.test' === $_SERVER['HTTP_HOST'] ? 'buddycamp.test' : 'wordcamp.test' );
   define( 'NOBLOGREDIRECT',        'https://central.wordcamp.test' );
   define( 'CLI_HOSTNAME_OVERRIDE', 'wordcamp.test' );
```

5. In the terminal, make sure you're in the `wordcamp.test` directory.

6. `docker compose build --pull`

7. `docker compose up`

8. Visit the URL for PORT 443
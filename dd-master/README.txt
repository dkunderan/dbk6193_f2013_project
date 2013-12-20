DEVELOPMENT ENVIRONMENT CONFIGURATION  (one time only)
=====================================

  The app is written in Ruby on Rails.  The app uses Gem
  Bundler (http://gembundler.com) to manage Gem dependencies.

  To make certain that you are using the most recent version of
  Bundler, run the following command:

    sudo gem update bundler



  Configuring OS X for development
  --------------------------------

  You will need to download and install MySQL server.  The 
  app has been tested with the MySQL 5.5.x series.  You can get the
  most recent version of the MySQL 5.5 series from:

    http://dev.mysql.com/downloads/mysql/5.5.html#downloads


  Configuring Ubuntu for development
  ----------------------------------

  You will need to install (at least) the following Ubuntu packages in
  order to run this app on Ubuntu:

    libmysqlclient-dev
    libsqlite3-dev
    nodejs-dev
    mysql-server


UPDATING THE APP
=========================

  Install the required versions of the Gem libraries using Bundler:

    bundle install

  Create database entries for this application's surveys (WARNING - this
  will destroy the database, so do not run this command on a production
  server):

    ./regenerate_surveys



RUNNING THE APP (on a development machine)
========================

  From the directory, start the development server on your
  machine using:

    rails server

  Next, open up another terminal window, and start a Facebook tunnel
  using:

    rake facebooker:tunnel:start

kill -9 `sudo lsof -t -i:7007`

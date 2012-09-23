#!/bin/sh

ruby dotcloudify_dbyml.rb
rake db:create
rake db:migrate

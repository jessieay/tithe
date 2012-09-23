#! /usr/bin/env ruby

require 'yaml'

DB_ADAPTER = "postgresql"
DATABASE = "tithe_db"
ENCODING = 'utf8'
TEMPLATE = 'template0'
TIMEOUT = 5000
POOL = 5

def load_dotcloud_env
  env = YAML.load(IO.read('/home/dotcloud/environment.yml'))
end

def overwrite_database_file
  env = load_dotcloud_env
  database = {
    'production' => {
      'adapter' => DB_ADAPTER,
      'database' => DATABASE,
      'host' => env['DOTCLOUD_DB_SQL_HOST'],
      'port' => env['DOTCLOUD_DB_SQL_PORT'].to_i,
      'username' => env['DOTCLOUD_DB_SQL_LOGIN'],
      'password' => env['DOTCLOUD_DB_SQL_PASSWORD'],
      'encoding' => ENCODING,
      'template' => TEMPLATE,
      'timeout' => TIMEOUT,
      'pool' => POOL
    }
  }
  File.open('config/database.yml', 'w') do |file|
    file.write database.to_yaml
  end
end

puts '=== Start to overwrite database.yml ==='
overwrite_database_file
puts '=== Finished overwriting! ==='

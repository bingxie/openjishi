== README

## Install
1. bundle install

2. rake db:migrate

3. rake db:seed

4. gem install foreman

5. foreman start

6. visit: http://localhost:3000

## Test

rake test

### Feature test:

rake test test/features

## Bitters:
Scss: /app/assets/stylesheets/base

Example page: http://localhost:3000/pages/home

## Static Pages

1. Add a page into /app/views/pages with a name like: hello.html.slim
2. Add coresponding css file in /app/assets/stylesheets/ with a name like: _hello.scss
3. Append a line in /app/assets/stylesheets/application.scss with: (at)import "home";
4. Then you can see the page from: http://localhost:3000/pages/hello

## How to use a refills component
1. List all available components and get the name
  > rails generate refills:list
2. Add a component
  > rails generate refills:import Component
3. Import css or js in application.scss or application.js
4. Use the html in your code and customize the css and js


## Check the Emails on Development Environment

visit: http://127.0.0.1:3000/letter_opener

## nokogiri installation error fix
brew install libxml2
bundle config build.nokogiri "--use-system-libraries --with-xml2-include=/usr/local/opt/libxml2/include/libxml2"
bundle install


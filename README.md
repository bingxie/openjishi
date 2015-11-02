== README

## Install
1. bundle install

2. rake db:migrate

3. gem install foreman

4. foreman start

5. visit: http://localhost:3000


## Bitters:
/app/assets/stylesheets/base

## Static Pages

1. Add a page into /app/views/pages with a name like: hello.html.slim
2. Add coresponding css file in /app/assets/stylesheets/ with a name like: _hello.scss
3. Append a line in /app/assets/stylesheets/application.scss with: (at)import "home";
4. Then you can see the page from: http://localhost:3000/pages/hello

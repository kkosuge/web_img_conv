## Installation
```
git clone git://github.com/kkosuge/web_img_conv.git
cd web_img_conv
bundle
mv config/config.yml.sample config/config.yml
rackup
```

### original
```
https://gist.github.com/raw/4467877/onomichi.jpg
```
![](https://gist.github.com/raw/4467877/onomichi.jpg)

### resize
```
http://localhost:9292/resize/350x200/https://gist.github.com/raw/4467877/onomichi.jpg
```
![](https://gist.github.com/raw/4467877/onomichi2.jpg)

### resize_to_fill
```
http://localhost:9292/resize_to_fill/350x200/https://gist.github.com/raw/4467877/onomichi.jpg
```
![](https://gist.github.com/raw/4467877/onomichi3.jpg)

![](https://img.shields.io/badge/Microverse-blueviolet)

# Ruby_Linters
In this project we buld linters for testing Ruby file## 🛠 Installing <a name = "installing"></a>

![screenshot]()

Additional description of the project and its features.

## Built With

- Ruby
- RSpec for testing

### Pre-requisites

- Ruby installed on local machine. Please go to [this](https://www.ruby-lang.org/en/documentation/installation/) link if you need to install it.

### Usage

Clone this repository on the command promp or console using

```
git clone https://github.com/uwadonat/Ruby_Linters
```
```
cd Ruby_Linters  ( to enter inside directory)
```

Type in the following command to run the linter on a test file
```
ruby bin/main.rb
```
### Testing
Test class methods using RSpec by running the command in the root directory 
```
- cd spec/rspec testr_spec.rb

```
But before testing using RSpec you can install the gem file by running the command
```
$ bundle install 
```
Also make sure you have bundler installed on your system, else run
```
$ gem install bundler 
```
or you simply install the the following directly using
```
$ gem install rspec 
```

# Type of errors checked with Examples
## 1. Wrong class Name

Always class name should be capitalized

```
# bad
class calculator

# good
class Calculator
```
#### 2. Space before and after operator

Always there must be empty space before and after operator

```
# bad
var=a+5

# good
var = a + 5
```
#### 3. Extra empty space

First line of the program should not be empty and no empty line allowed between statement except one empty line after end keyword

```
# bad
|  <-- empty line 
class Sample
  def hello
    puts 'Hello Ruby'

|  <-- empty line
|
    puts 'calculate sum of two numbers'
    a = 4
    b = 10

# good
class Sample
  def hello
    puts 'Hello Ruby'
    puts 'calculate sum of two numbers'
    a = 4
    b = 10
```

#### 4. open and closing tags
Always make sure that there are pair of tags: opening tag and closing tag
```
# bad
puts "Hello Ruby

# good
puts "Hello Ruby"
```
#### 5. Line too long
```
# bad
3   puts 'Hello Microverse ~~~~~~~~~~~' | <-- total characters in line > 50 

# good

3 puts 'Hello microverse ~~' | <-- Total characters in line < 50
```

👤 **Author**
- GitHub: [@githubhandle](https://github.com/@uwadonat)
- Twitter: [@twitterhandle](https://twitter.com/@uwamahoroDonat)
- LinkedIn: [LinkedIn](https://linkedin.com/in/uwamahoro-donat-84b5bb1b7/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## Show your support

Give and ⭐️ if you like this project!

## Acknowledgments

- StackOverflow

## 📝 License

This project is [MIT](https://opensource.org/licenses/MIT) licensed.

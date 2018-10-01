# TicTacToe

**Installation**  

This project requires Elixir 1.6.6 (compiled with OTP 20)  

**First install OTP 20 or above (backwards compatible) by going to:**  
```
https://www.erlang-solutions.com/resources/download.html
```

**Then install Elixir by going to:**
```
https://elixir-lang.org/install.html
```

**Then install this project by cloning:**  
```
git clone https://github.com/shibani/elixir-tictactoe.git
```

**To run tests**

cd into root of app directory and run in console.

To run the entire suite:

```
mix test 
```

**To run an individual test file:**
```
mix test test/ui_modules/cli_messages_test.exs 
```

**To run an individual test:**
```
mix test test/ui_modules/cli_messages_test.exs:73 
```  
**To play game in terminal**

cd into root of app directory and run in console:  

```
mix escript.build   
./tictactoe  
```


**Functional Core**

```
lib
-- game_modules/  
-- player_modules/  
-- strategy_modules/  
```

**Imperative Shell**
```
lib
-- app_modules/  
-- ui_modules/  
```

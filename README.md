# Hi Mark is 22/07/2017 19:18

# Installation

To run the server simply download the repository and and run `rails s`. Make sure you create a the `config\local_env.yml` file that contains the connection string for the database. This is not included in the repo for security purposes.

A running example of the website can be found at: https://cr301.herokuapp.com/

# API

The API can be accessed at https://cr301.herokuapp.com/api/
The headers that need to be passed to the request can be found at the Headers section of the Readme, and are marked with * next to the requests that require them 

The commands that can be called are:

/register -> POST request with the data:
```
{ 
    "player":
    {
        "nickname":"test",
        "password":"test",
        "demographic":"UK",
        "email":"test@test.com"
    }
}
```

/login -> POST/GET request *requires headers

/join_game_session -> POST/GET request *requires headers 
```
{ 
    "game_session_id": 1
}
```

/player_won -> POST/GET request *requires headers 
```
{ 
    "game_session_id": 1
}
```

/player_lost -> POST/GET request *requires headers 
```
{ 
    "game_session_id": 1
}
```

/create_game_session -> POST/GET request *requires headers 

/player_info -> POST/GET request  
```
{ 
    "player_id": 1
}
```

/high_score -> POST/GET request  
```
{ 
    "limit": 100,
    "demographic": "UK",
    "type": "weekly"
}
```
The allowed type for the highscore are: weekly, monthly, overall, and by default if the value is not supplied the overall will be returned. Demographic if not supplied then again the overall highscore will be returned. 

## Headers

The API requires the request to be authentificated with basic HTTP auth. The username and the passwords are the username and password of the player whom data needs to be saved to the leaderboard. 

In addition to the auth header, a game-id Key Value pair needs to be passed to the API which determins that game to which the score will be saved to. 

## Response

All the request will give a JSON format of the class that was required for instance registering a new player will return:

```
{ 
    "player":
    {
        "nickname":"test",
        "password":"test",
        "demographic":"UK",
        "email":"test@test.com"
    }
}
```

## Error

If there is an error you will get the following reply
```
{"error":"Error explenation"}
```

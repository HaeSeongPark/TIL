// db작업도 해야 함

var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);

var userList = [];
var roomList = [];
var typingUsers = {};
var users = [];
var rooms = [];
app.get('/', function(req, res){
  res.send('<h1>AppCoda - SocketChat Server</h1>');
});


http.listen(3000, function(){
  console.log('Listening on *:3000');
});


io.on('connection', function(clientSocket){
  console.log('a user connected');

  function setUserRooms(){
    rooms = Object.keys(roomList);
    for( var i in rooms){
      var roomTitle = rooms[i];
      var user = (Object.keys(roomList[roomTitle].socket_ids)).length;
      users.push(user);
    }
  }

  clientSocket.on('askRoomListReset', function(){
    setUserRooms();
    io.emit("replyRoomListReset", rooms, users);
    users = [];
  });

  clientSocket.on('disconnect', function(){
    console.log('user disconnected');

    var clientNickname;
    for (var i=0; i<userList.length; i++) {
      if (userList[i]["id"] == clientSocket.id) {
        userList[i]["isConnected"] = false;
        clientNickname = userList[i]["nickname"];
        break;
      }
    }

    delete typingUsers[clientNickname];
    io.emit("userList", userList);
    io.emit("userExitUpdate", clientNickname);
    io.emit("userTypingUpdate", typingUsers);
  });

  clientSocket.on("exitUser", function(clientNickname){
    for (var i=0; i<userList.length; i++) {
      if (userList[i]["id"] == clientSocket.id) {
        userList.splice(i, 1);
        break;
      }
    }
    io.emit("userExitUpdate", clientNickname);
  });


  clientSocket.on('chatMessage', function(clientNickname, message, roomTitle){
    var currentDateTime = new Date().toLocaleString();
    delete typingUsers[clientNickname];
    io.in(roomTitle).emit("userTypingUpdate", typingUsers);
    io.in(roomTitle).emit("newChatMessage",clientNickname, message, currentDateTime);
    // io.emit("userTypingUpdate", typingUsers);
    // io.emit('newChatMessage', clientNickname, message, currentDateTime);
  });


  clientSocket.on("connectUser", function(clientNickname, roomTitle) {
      var message = "User " + clientNickname + " was connected. in " + roomTitle;
      console.log(message);

      clientSocket.join(roomTitle);

      if ( roomList[roomTitle] == undefined ) {
          console.log('room create :' + roomTitle)
          roomList[roomTitle] = new Object();
          roomList[roomTitle].socket_ids = new Object();
      }

      var userInfo = {};
      var foundUser = false;
      userList = Object.values(roomList[roomTitle].socket_ids);
      for (var i=0; i<userList.length; i++) {
        if (userList[i]["id"] == clientSocket.id) {
          roomList[roomTitle].socket_ids[clientNickname].isConnected = true
          roomList[roomTitle].socket_ids[clientNickname].id = clientSocket.id;
          userInfo = roomList[roomTitle].socket_ids[clientNickname];
          foundUser = true;
          break;
        } 
      }

      if (!foundUser) {
        userInfo["id"] = clientSocket.id;
        userInfo["nickname"] = clientNickname;
        userInfo["isConnected"] = true
        roomList[roomTitle].socket_ids[clientNickname] = userInfo;
      }

      userList = Object.values(roomList[roomTitle].socket_ids);
      clientSocket.to(roomTitle).emit("userList",userList);
      clientSocket.to(roomTitle).emit("userConnectUpdate",userInfo);

      // 방에 유저가 들어오면 모든 클라 룸과 유저 업데이트 
      setUserRooms();
      io.emit("roomList", rooms,users)

      // io.emit("userList", userList);
      // io.emit("userConnectUpdate", userInfo)
  });

  clientSocket.on("connectRoom", function(clientRoomname){
    roomList[clientRoomname] = new Object();
    roomList[clientRoomname].socket_ids = new Object();

    setUserRooms();
    io.emit("roomList", rooms, users);
    users = [];
  });

  clientSocket.on("startType", function(clientNickname, roomTitle){
    console.log("User " + clientNickname + " is writing a message...");
    typingUsers[clientNickname] = 1;
    clientSocket.to(roomTitle).emit("userTypingUpdate", typingUsers);
  });


  clientSocket.on("stopType", function(clientNickname, roomTitle){
    console.log("User " + clientNickname + " has stopped writing a message...");
    delete typingUsers[clientNickname];
    clientSocket.to(roomTitle).emit("userTypingUpdate", typingUsers);
  });

});

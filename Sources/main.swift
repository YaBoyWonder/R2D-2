import Sword

let options = ShieldOptions()
options.prefixes = ["r."]
let bot = Shield(token: "Bot", shieldOptions: options)

bot.on(.messageCreate) { data in
  let msg = data[0] as! Message
  if msg.content == "r.ping" {
   let embed = ["embed": [
  "color": 0xFFC133,  
  "title": "Owner",
  "description": "Wonder™#3350"
]]

 bot.on(.messageCreate) { data in
  let msg = data[0] as! Message
  if msg.content == "r.src" {
   msg.reply(with: "https://github.com/YaBoyWonder/R2D-2 <= Source code for R2D-2")
 }
}   

bot.on(.ready) { _ in
  bot.editStatus(to: "online", playing: "with Wonder❤")
}
    
 bot.on(.messageCreate) { data in
  let msg = data[0] as! Message
  if msg.content == "r.about" {
    msg.reply(with: "A Discord Bot Coded in Swift **https://github.com/YaBoyWonder/R2D-2**")
 }
}   
      
    
bot.send(embed, to: channelId)
    }
}

bot.register("github", message: "https://github.com/YaBoyWonder <= Thats the link to the creator")

bot.register("playlist", message: "https://www.youtube.com/playlist?list=PLmBEmthiPlqpnZnUri6SqruR4kq6GMM6L Rap Playlist")

bot.register("ping", message: "Pong!")

bot.register("music", message: "https://discordapp.com/oauth2/authorize?client_id=264087326492327938&permissions=70642768&scope=bot")

bot.register("join") { message, args in
  guard message.member?.voiceState != nil else {
    message.reply(with: "Voice Channel not found")

    return
  }

  bot.join(voiceChannel: message.member!.voiceState!.channelId) { connection in
    connection.play(Youtube("https://www.youtube.com/watch?v=5lNyCSeO3BM"))
  }
}

bot.register("leave") { msg, args in
  guard msg.member?.voiceState != nil else {
    msg.reply(with: "User not located, where are you 👀")

    return
  }

  bot.leave(voiceChannel: msg.member!.voiceState!.channelId)
}

bot.register("echo") { message, args in
  message.reply(with: args.joined(separator: " "))
}

bot.connect()

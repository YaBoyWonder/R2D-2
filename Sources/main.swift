import Sword

let options = ShieldOptions()
options.prefixes = ["r."]
let bot = Shield(token: "Bot", shieldOptions: options)

bot.on(.messageCreate) { data in
  let msg = data[0] as! Message
  if msg.content == "r.ping" {
   let embed = ["embed": [
  "title": "Owner",
  "description": "Wonder™#3350",
   "field title": "with love ❤"
]]

bot.send(embed, to: channelId)
  }
}

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
    msg.reply(with: "User not located.")

    return
  }

  bot.leave(voiceChannel: msg.member!.voiceState!.channelId)
}

bot.register("echo") { message, args in
  message.reply(with: args.joined(separator: " "))
}

bot.connect()

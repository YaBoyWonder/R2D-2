import Sword

let options = ShieldOptions()
options.prefixes = ["r."]

let bot = Shield(token: "Bot", shieldOptions: options)

bot.register("ping", message: "Pong!")

bot.register("owner", message: "Wonder™#3350")

bot.register("join") { message, args in
  guard message.member?.voiceState != nil else {
    message.reply(with: "Voice Channel not found")

    return
  }

  bot.join(voiceChannel: message.member!.voiceState!.channelId) { connection in
    connection.play(Youtube("https://www.youtube.com/watch?v=5lNyCSeO3BM"))
  }
}

bot.register("echo") { message, args in
  message.reply(with: args.joined(separator: " "))
}

bot.connect()

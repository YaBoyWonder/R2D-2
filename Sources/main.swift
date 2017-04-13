import Sword

let options = ShieldOptions()
options.prefixes = ["!"]

let bot = Shield(token: "Bot", shieldOptions: options)

bot.register("ping", message: "Pong!")

bot.register("owner", message: "Wonder™#3350")

bot.register("echo") { msg, args in
  msg.reply(with: args.joined(separator: " "))
}

bot.connect()

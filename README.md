# rails5-actioncable-chat-example


Simple Chat Example using Rails5 ActionCable .

And ``Bootstrap4``, ``mysql``, ``redis``
 

## Files

- config/initializers/utf8mb4.rb ( For utf8mb4 Indexing)
- app/views/chats/*
- app/assets/javascripts/
 - cable.js
 - chats.js.coffee
 - application.js
 - channels/chat.js.coffee
- app/assets/stylesheets/
 - application.scss
 - chats.scss
- app/channels/
 - application_cable/channel.rb
 - application_cable/connection.rb
 - chat_channel.rb
 
 

## Usage

You must change `config/environments/development.rb ` File

links : https://github.com/rails/rails/blob/61a7239e405982e78de15bd86583514248e6f525/actioncable/lib/action_cable/engine.rb#L25   
```ruby
config.action_cable.url = "ws://localhost:3006/cable"
config.action_cable.allowed_request_origins  = "http://localhost:3006"
# My Proejct running on 3006 port

```

 If you not use mysql, change to `Gemfile` 
 

    $ rails db:migrate
    $ rails db:seed
    $ rails s [-p Port]



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## License

The gem is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).




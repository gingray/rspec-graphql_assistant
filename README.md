# Rspec::GraphqlAssistant
Helps you to generate query for testing GraphQL

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-graphql_assistant'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rspec-graphql_assistant

## Usage

```ruby
RSpec.configure do |config|
  config.include RSpec::GraphqlAssistant::Helpers
end
```

```ruby
graphql_mutation('updatePost', { post_id: 1, content: "some test" }, [:id, :content])
```

produce this one query
```gql
mutation {
  updatePost(input: {postId: 1, content: "some text"}) {
    id
    content
  }
}

```


Work in progress and now only supports inline syntax. Which means without passing variables. Later try to cover both cases
Cheers

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ginray/rspec-graphql_assistant.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

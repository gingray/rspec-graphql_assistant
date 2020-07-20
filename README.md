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
graphql_mutation('updatePost', { post_id: 1, content: "some test" }, [:id, author: [:name]])
```

produce this one query
```gql
mutation {
  updatePost(input: {postId: 1, content: "some text"}) {
    id
    author {
      name
  }
}

```
Examples of query and subscription
```ruby
args = {post_id: 1}
response = [:id, :name]

graphql_query('queryName', args, response)

graphql_subscription('subscriptionName', args, response)
```

## Matchers
```ruby
expect(result).to graphql_have_attributes([:book, :author_reviews], { score: 10 })
```
it's equivalent to `expect(result.dig('data', 'book', 'authorReviews')).to have_attributes({'score' => 10})`

```ruby
expect(result).to graphql_include(:book, %w[id title])
```

it's equivalent to `expect(result.dig('data', 'book')).to include('id', 'title')`

Work in progress and now only supports inline syntax. Which means without passing variables. Later try to cover both cases.  
I'm still working on documentation if you want to help me be appreciated 

Cheers

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ginray/rspec-graphql_assistant.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

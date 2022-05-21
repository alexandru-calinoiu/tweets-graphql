require "rails_helper"

RSpec.describe TweetsSchema do
  it "creates tweets" do
    query_string = <<-GRAPHQL
      mutation($input: TweetCreateInput!) {
          tweetCreate(input: $input) {
              tweet {
                  id
              }
          }
      }
    GRAPHQL

    variables = {
      "input": {
        "attributes": {
          "content": "Best thing I found in a while: https://12ft.io/"
        }
      }
    }

    result = TweetsSchema.execute(query_string, variables: variables)

    expect(result["data"]["tweetCreate"]["tweet"]["id"]).not_to be_nil
  end
end
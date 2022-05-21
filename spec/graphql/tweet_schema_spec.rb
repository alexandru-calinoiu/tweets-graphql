require "rails_helper"

RSpec.describe TweetsSchema do
  it "does the test query" do
    query_string = <<-GRAPHQL
      query {
        testField
    }
    GRAPHQL

    result = TweetsSchema.execute(query_string)

    expect(result["data"]["testField"]).to eq "Hello World!"
  end
end
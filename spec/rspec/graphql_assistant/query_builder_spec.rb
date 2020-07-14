RSpec.describe RSpec::GraphqlAssistant::QueryBuilder do
  let(:name) { :users }
  let(:args) { {input:{ name: 'test', content: 'content'}} }
  let(:response) { [:id] }
  let(:query_builder) { RSpec::GraphqlAssistant::QueryBuilder.new(:mutation ,name, args, response) }

  context 'when condition' do
    it 'succeeds' do
      val = <<~GQL
mutation {
 users(input: { name: "test", content: "content" }) {
  id
 }
}
      GQL
      expect(query_builder.call.strip).to eq val.strip
    end
  end
end
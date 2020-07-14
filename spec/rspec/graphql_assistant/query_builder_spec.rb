RSpec.describe RSpec::GraphqlAssistant::QueryBuilder, focus: true do
  let(:name) { :users }
  let(:args) { [{input: [:user_id, :user_type]}] }
  let(:response) { [:id] }
  let(:query_builder) { RSpec::GraphqlAssistant::QueryBuilder.new(:mutation ,name, args, response) }

  context 'when condition' do
    it 'succeeds' do
      val = <<~GQL
mutation {
 users(input: { userId: $userId, userType: $userType }) {
  id
 }
}
      GQL
      expect(query_builder.call.strip).to eq val.strip
    end
  end
end
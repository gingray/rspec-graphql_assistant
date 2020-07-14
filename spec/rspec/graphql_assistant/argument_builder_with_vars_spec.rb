RSpec.describe RSpec::GraphqlAssistant::ArgumentBuilderWithVars do
  context 'case 1' do
    let(:args) { [{input: [:user_id, :user_type]}] }
    let(:argument_builder) { RSpec::GraphqlAssistant::ArgumentBuilderWithVars.new(args) }

    it 'succeeds' do
      expect(argument_builder.call).to eq 'input: { userId: $userId, userType: $userType }'
    end
  end

  context 'case 2' do
    let(:args) { [:id, :name, :content] }
    let(:argument_builder) { RSpec::GraphqlAssistant::ArgumentBuilderWithVars.new(args) }

    it 'succeeds' do
      expect(argument_builder.call).to eq 'id: $id, name: $name, content: $content'
    end
  end
end

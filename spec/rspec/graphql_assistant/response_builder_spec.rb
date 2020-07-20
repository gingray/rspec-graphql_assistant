RSpec.describe RSpec::GraphqlAssistant::ResponseBuilder do
  context 'case 1' do
    let(:args) { [{ user: [:email]}, :token] }
    let(:argument_builder) { RSpec::GraphqlAssistant::ResponseBuilder.new(args) }

    it 'succeeds' do
      expect(argument_builder.call).to eq "user { email }  token"
    end
  end

  context 'case 2' do
    let(:args) { [{ user: [:id, role: [:id]]}, :token] }
    let(:argument_builder) { RSpec::GraphqlAssistant::ResponseBuilder.new(args) }

    it 'succeeds' do
      expect(argument_builder.call).to eq "user { id role { id }  }  token"
    end
  end
end

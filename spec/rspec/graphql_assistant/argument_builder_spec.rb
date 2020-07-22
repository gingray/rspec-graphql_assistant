RSpec.describe RSpec::GraphqlAssistant::ArgumentBuilder do
  context 'case 1' do
    let(:args) { {id: 1, name: 'test', content: 'content', bool_value: true} }
    let(:argument_builder) { RSpec::GraphqlAssistant::ArgumentBuilder.new(args) }

    it 'succeeds' do
      expect(argument_builder.call).to eq 'id: 1, name: "test", content: "content", boolValue: true'
    end
  end

  context 'case 2' do
    let(:args) { {input:{ name: 'test', content: 'content', bool_value: true}} }
    let(:argument_builder) { RSpec::GraphqlAssistant::ArgumentBuilder.new(args) }

    it 'succeeds' do
      expect(argument_builder.call).to eq 'input: { name: "test", content: "content", boolValue: true }'
    end
  end

  context 'case 3' do
    let(:args) { {input: [{name: 'test', content: 'content', bool_value: true}, {name: 'test', content: 'content', bool_value: true}]} }
    let(:argument_builder) { RSpec::GraphqlAssistant::ArgumentBuilder.new(args) }

    it 'succeeds' do
      expect(argument_builder.call).to eq 'input: [ {name: "test", content: "content", boolValue: true}, {name: "test", content: "content", boolValue: true} ]'
    end
  end
end

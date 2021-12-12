require 'peep'

describe Peep do
  describe '.all' do
    it "returns all the Peeps in reverse chronological order" do

      Peep.create(content: 'My first Peep')
      Peep.create(content: 'My second Peep')
      peep = Peep.create(content: 'My second Peep')

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps).to be_a Array
      expect(peeps.first.id).to eq peep.id
      expect(peeps.last.content).to eq('My first Peep')
    end
  end

  describe '.create' do
    it 'creates a Peep' do
      peep = Peep.create(content: "One last peep")
      persisted_data = DatabaseConnection.setup('chitter_app_test').query("SELECT * FROM peeps WHERE created_at = #{peep.created_at};")

      expect(peep).to be_a Peep
      p peep.created_at
      expect(peep.created_at).to eq persisted_time_data['created_at']
      expect(peep.content).to eq 'My fourth Peep'
    end
  end
end

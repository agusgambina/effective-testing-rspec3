class Coffee
  def ingridients
    @ingridients ||= []
  end

  def add(ingridient)
    ingridients << ingridient
  end

  def color
    ingridients.include?(:milk) ? :light : :dark
  end

  def temperature
    ingridients.include?(:milk) ? 190.0 : 205.0
  end

  def price
    1.00 + ingridients.size * 0.25
  end
end

RSpec.configure do |config|
  config.example_status_persistence_file_path='spec/examples.txt'
end

RSpec.describe 'A cup of coffee' do
  let(:coffee) { Coffee.new }

  it 'costs $1' do
    expect(coffee.price).to eq(1.00)
  end

  context 'with milk' do
    before { coffee.add :milk }

    it 'costs $1.25' do
      expect(coffee.price).to eq(1.25)
    end

    it 'is light in color' do
      expect(coffee.color).to be(:light)
    end

    it 'is cooler than 200 degrees Fahrenheit' do
      expect(coffee.temperature).to be < 200.0
    end
  end
end

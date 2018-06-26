require 'rspec'
require_relative '../lib/film'

describe 'Film object' do
  before :each do
    @films_array = Film.load_films(__dir__ + "/fixtures")
  end

  describe '.load_films' do
    context 'reading films from file and' do
      it 'returns films array.' do
        expect(@films_array).to be_a Array
      end
      it 'create Film instances' do
        expect(@films_array.first).to be_a Film
      end
    end
  end

  describe '#to_s' do
    it "should print film's instance variables"  do
      expect(@films_array.first.to_s).to eq("РЕЖИССЕР - \"ТАЙТЛ\" (ГОД)")
    end
  end
end

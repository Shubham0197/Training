RSpec.describe "include matcher" do
  describe 'hot chocolate' do
    it 'checks for substring inclusion' do
      expect(subject).to include('hot')
      expect(subject).to include('late')
      expect(subject).to include('choco') 
    end
    it{is_expected.to include('ot')}
  end

  describe [10,20,30] do
    it "checks for the elemnts included in the array regardless of order" do
      expect(subject).to include(10)
      expect(subject).to include(30,10)
      
    end
    
  end

  describe ({a:2, b:3}) do
    it "can check for the key existence" do
      expect(subject).to include(:a)
      expect(subject).to include(:b, :a)
    end

    it "can check for the key value pair" do
      expect(subject).to include(a: 2)
    end

    it {is_expected.to include(b: 3) }
  end


end
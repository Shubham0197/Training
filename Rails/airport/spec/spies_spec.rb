RSpec.describe "Spies Spec" do
  let(:animal) {spy("animal")}

  it "works differenty from double in paradigm here method invoked first then checked" do
    animal.eat_food
    expect(animal).to have_received(:eat_food)
    expect(animal).not_to have_received(:eat_garbage)
  end

  it "just like doubles resets between examples and also retains functionality of double" do
    expect(animal).not_to have_received(:eat_food)
    animal.eat_food
    animal.eat_food
    animal.eat_food("carrots")
    expect(animal).to have_received(:eat_food).exactly(3).times
    expect(animal).to have_received(:eat_food).at_least(2).times
    expect(animal).to have_received(:eat_food).with('carrots')
    expect(animal).to have_received(:eat_food).once.with('carrots')

  end


end
RSpec.describe 'hello world', type: :system, js: true do
  it 'greets "Stranger" by default' do
    visit hello_world_path

    expect(page).to have_text("Hello, Stranger")
  end

  it 'allows the name to be changed' do
    visit hello_world_path

    within 'form' do
      fill_in('name', with: 'Friend')
    end
    expect(page).to have_text("Hello, Friend")
  end
end

RSpec.describe 'display open positions', type: :system do
  let!(:position_1) { Fabricate(:position) }
  let!(:position_2) { Fabricate(:position) }

  it 'shows a list of open positions' do
    visit positions_path

    expect(page).to have_text(position_1.title)
    expect(page).to have_text(position_2.title)
  end
end

shared_examples "no piece bar" do
  scenario "piece bar doesn't show" do
    should_not have_css ".piece-bar"
  end
end

shared_examples "piece bar" do
  scenario "has two piece bars" do
    should have_css ".piece-bar", count: 2

    within(first(".piece-bar")) do
      should have_link "", href: new_piece_path
      should have_link "your pieces", href: pieces_path
    end
  end
end

shared_examples "piece bar for piece" do
  it_behaves_like "piece bar"

  scenario "shows piece links" do
    within(first(".piece-bar")) do
      should have_link "edit", href: edit_piece_path(piece.id)
      should have_link piece.short_title, href: piece_path(piece.id)
      should have_link "make draft", href: piece_drafts_path(piece_id: piece.id)
      should have_css ".make-draft-link"
      should have_link "", href: piece_path(piece.id)
      should have_css ".delete-piece-link"
    end
  end
end

shared_examples "piece bar for history" do
  it_behaves_like "piece bar for piece"

  scenario "shows history link" do
    within(first(".piece-bar")) do
      should have_link "history", href: history_piece_path(piece.id)
    end
  end
end

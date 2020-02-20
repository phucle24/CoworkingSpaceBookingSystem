module VenuesHelper
  def edit_venue_status
    [{ id: 0, name: "blocked" },
     { id: 1, name: "approved" }]
  end
end

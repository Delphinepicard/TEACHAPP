ap "cocou"




ap User.available('12-07-2021'.to_date, '16-07-2021'.to_date)


ap c.reviews.each_with_index{ |r, index| r.update(created_at: Date.today - (11 - index).days) }
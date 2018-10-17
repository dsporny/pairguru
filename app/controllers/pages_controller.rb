class PagesController < ApplicationController
	def commboard
		@users = User.select("name, COUNT(DISTINCT 'comments.comment_id') as comment_count")
		.joins(:comments)
		.group(:name)
		.limit(10)
		.order("comment_count DESC")
	end
end

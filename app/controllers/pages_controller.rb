class PagesController < ApplicationController
	def commboard
		@users = User.select("name, COUNT(DISTINCT comment_id) as comment_count")
		.joins(:comments)
		.group(:name)
		.limit(10)
		.order("comments_count DESC")
	end
end

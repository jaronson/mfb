class AddWebsiteToRefineryBlogComments < ActiveRecord::Migration
  def up
    add_column :refinery_blog_comments, :website, :string
  end

  def down
    remove_column :refinery_blog_comments, :website
  end
end

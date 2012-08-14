require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/portfolio.db"
)

class Post < ActiveRecord::Base
  field :title, :type => :string
  field :body, :type => :text
  field :position, :type => :integer
end

Post.auto_upgrade!
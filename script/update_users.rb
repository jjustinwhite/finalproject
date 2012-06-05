# Update current users to have level 1
users = User.all
users.each do |user|
  user.update_attribute(:level, 1)
end
 
# Add one administrative (that is, level 2) user
user = User.new
user.email = "admin"
user.password = "system"
user.password_confirmation = "system"
user.level = 2
user.save
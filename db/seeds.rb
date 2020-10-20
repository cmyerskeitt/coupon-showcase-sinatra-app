#Here is where I will write the seed data for my program 

ayana = User.create(email: "ayana@ayana.com", password: "ayanapassword", name: "Ayana Miser", image_url: "https://images.unsplash.com/photo-1567037782848-d0fe9a51ec4c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1798&q=80", savings_goal: "$3000")

jenn= User.create(email: "jenn@jenn.com", password: "jennpasssword!", name: "Jenn Saver", image_url: "https://www.niemanlab.org/images/monique-judge.jpg", savings_goal: "$4000")


Coupon.create(brand: "Colgate", amount: 1.00, expiration: 20210101, description: "$1 off of any Colgate product", user_id: ayana.id)

Coupon.create(brand: "Dove", amount: 1.50, expiration: 20210115, description: "$1.50 off of any Dove deodorant", user_id: jenn.id)

ayana = User.create(email: "ayana@ayana.com", password: "ayanapassword", name: "Ayana Miser", image_url: "https://media.gettyimages.com/photos/beautiful-girl-with-curly-hairstyle-picture-id1180484935?s=612x612", savings_goal: "3000")

jenn= User.create(email: "jenn@jenn.com", password: "jennpasssword!", name: "Jenn Saver", image_url: "https://www.niemanlab.org/images/monique-judge.jpg", savings_goal: "4000")


Coupon.create(brand: "Colgate", amount: 1.00, expiration: "20210101", description: "$1 off of any Colgate product", user_id: ayana.id)

Coupon.create(brand: "Dove", amount: 1.50, expiration: "20210115", description: "$1.50 off of any Dove deodorant", user_id: jenn.id)

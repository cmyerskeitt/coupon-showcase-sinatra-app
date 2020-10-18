#Here is where I will write the seed data for my program 

ayana = User.create(email: "ayana@ayana.com", password: "ayanapassword", name: "Ayana Miser", image_url: "https://unsplash.com/photos/5DJ8sR-m58I?utm_source=unsplash&utm_medium=referral&utm_content=creditShareLink", savings_goal: "$3000")

jenn= User.create(email: "jenn@jenn.com", password_digest:"jennpasssword!", name: "Jenn Saver", image_url: "https://www.niemanlab.org/images/monique-judge.jpg", savings_goal: "$4000")


Coupon.create(brand: "Colgate", amount: 1.00, expiration: 20210101, description: "$1 off of any Colgate product", user_id: ayana.id)

Coupon.create(brand: "Dove", amount: 1.50, expiration: 20210115, description: "$1.50 off of any Dove deodorant", user_id: jenn.id)

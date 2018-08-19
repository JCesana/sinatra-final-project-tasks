users = [
  {username: 'JohnJax', email: 'johnny@yahoo.com', password: "123" },
  {username: 'HollyHunt', email: 'kate22@aol.com', password: "123" },
  {username: 'OliverTwist', email: 'LizAndCam@gmail.com', password: "123" },
  {username: 'VinceVee', email: 'josh@gmail.com', password: "123" }
]

users.each do |u|
  User.create(u)
end

lists = [
  {name: "Life Goals", user_id: 1},
  {name: "Puppy Names", user_id: 2},
  {name: "Chores", user_id: 3},
  {name: "Donald Trump Phrases", user_id: 4}
]

lists.each do |l|
  List.create(l)
end

tasks = [
  {name: "Run a marathon", list_id: 1}, {name: "Find soulmate", list_id: 1}, {name: "Win the lottery", list_id: 1},
  {name: "Bailey", list_id: 2}, {name: "Max", list_id: 2}, {name: "Charlie", list_id: 2}, {name: "Donald", list_id: 2},
  {name: "Dusting", list_id: 3}, {name: "Vacuuming", list_id: 3}, {name: "Sweeping", list_id: 3}, {name: "Feed goldfish", list_id: 3},
  {name: "Check your facts", list_id: 4}, {name: "He's a great guy...", list_id: 4}, {name: "Billions and billions of dollars...", list_id: 4}, {name: "Bing, bing bong!", list_id: 4},
]

tasks.each do |t|
  Task.create(t)
end

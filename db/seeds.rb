# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
users = User.create([
    {
        firstname: "Leonell",
        lastname: "cruz",
        username: "leonell_cruz",
        email: "leonell@mail.com",
        password: "test"
    },
    {
        firstname: "Ange",
        lastname: "cruz",
        username: "ange_cruz",
        email: "ange@mail.com",
        password: "sample"
    },
    {
        firstname: "Kennedy",
        lastname: "De Vera",
        username: "ken_dev",
        email: "ken@mail.com",
        password: "test"
    }
])

posts  = Post.create([
    {
        title: 'My Post',
        body: 'This is my post.',
        tags: ['@react', '@bootcamp'], 
        votes: 0, 
        user: users.first
    },
    {
        title: 'TEst', 
        body: 'This is my Test.', 
        tags: ['@design-talks','@ruby'], 
        votes: 0, 
        user: users.second
    }
        ])

comments = Comment.create([
    {
        message: "test comment",
        username: "leonell_cruz",
        post: posts.first,
        votes: []
    }
])
replies = Reply.create([
    {
        message: "test reply",
        votes: [],
        comment: Comment.first,
        user: "leonell_cruz"
    }
])

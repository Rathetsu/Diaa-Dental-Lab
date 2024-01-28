const bcrypt = require("bcrypt");
const readline = require("readline");

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
});

rl.question("Enter the password to hash: ", (password) => {
    const saltRounds = 10;

    bcrypt.hash(password, saltRounds, function (err, hash) {
        if (err) {
            console.error("Error hashing password:", err);
        } else {
            console.log("Hashed Password:", hash);
        }
        rl.close();
    });
});
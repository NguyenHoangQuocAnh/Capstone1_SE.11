const db = require('../../config/db').MSSQLpool;

const admin = require('firebase-admin');
// const db = require('odbc')
class AuthController {

    async register(req, res) {
        const { email, password, username, fullname, phonenumber } = req.body;

        try {

            const userRecord = await admin.auth().createUser({
                email,
                password,
            })

            let sql = `Insert into users(user_id_, username, password,email, role) values(
                '${userRecord.uid}',
                '${username}',
                NULL,
                '${email}',
                'customer'
            )`


            let sql2 = `insert into Customers(customer_id,user_id_, full_name, phone_number) 
            values ('${userRecord.uid}','${userRecord.uid}','${fullname}','${phonenumber}')
            )`

            console.log(sql)

            db.query(sql, (err, result) => {
                if (!err) {
                    db.query(sql2, (err2, result) => {
                        if (!err) {
                            res.status(200).send({
                                status: 200,
                                message: 'User registered successfully',
                                user: {
                                    uid: userRecord.uid,
                                    email: userRecord.email,
                                },
                            });
                        } else {
                            res.status(500).send({
                                status: 500,
                                message: 'Error creating user',
                                error: err2,
                            })
                        }
                    })

                } else {
                    console.error('Error creating user:', err);
                    res.status(500).send({
                        status: 500,
                        message: 'Error creating user',
                        error: err,
                    })
                }

            })







        } catch (error) {

            console.error('Error creating user:', error);
            res.status(500).send({
                status: 500,
                message: 'Error creating user',
                error: error.message,
            });
        }
    }
    async login(req, res) { }

    async getAllUser(req, res) {
        const sql = 'SELECT * FROM Users';
        try {

            db.query(sql, (err, result) => {
                if (err) {
                    res.send({
                        status: 500,
                        data: err
                    });
                } else {
                    res.send({
                        status: 200,
                        data: result
                    });
                };
            }
            );

        }
        catch (err) {
            console.log(err);
        }
    }

}

module.exports = new AuthController;